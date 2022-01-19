package site.gamsung.service.auction.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import site.gamsung.service.auction.AuctionInfoDAO;
import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.auction.AuctionSchedulerService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.util.user.SendMail;

@Service("auctionSchedulerService")
public class AuctionSchedulerServiceImpl implements AuctionSchedulerService {

	@Autowired
	@Qualifier("auctionProductDAO")
	private AuctionProductDAO auctionProductDAO;

	@Autowired
	@Qualifier("auctionInfoDAO")
	private AuctionInfoDAO auctionInfoDao;
	
	@Autowired
	@Qualifier("sendMail")
	private SendMail sendMail;
	
	@Value("#{auctionProperties['url']}")
	private String url;
	
	@Value("#{auctionProperties['video']}")
	private String video;

	// 경매 상태 업데이트
	@Override
	@Scheduled(cron = "*/1 * * * * *")
	public void updateAuctionProductCondition() {
		// TODO Auto-generated method stub
		// 시분초 포멧 지정
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

		// 모든 삭제 플래그가 Y가 아닌 모든 경매 상품을 뽑아온다.
		List<AuctionProduct> auctionList = auctionProductDAO.listAuctionProduct(new Search());
		List<AuctionInfo> bidderList = null;

		AuctionInfo auctionInfo = new AuctionInfo();
		boolean isEnd = false;

		// enhanced for loop
		for (AuctionProduct auctionProduct : auctionList) {

			String auctionProductNo = auctionProduct.getAuctionProductNo();

			auctionProduct = auctionProductDAO.getAuctionProduct(auctionProductNo);

			try {

				// 잔여 시간이 00:00:00초라면 경매 상태를 업데이트한다.
				isEnd = dateFormat.parse(auctionProduct.getRemainAuctionTime()).before(dateFormat.parse("00:00:01"));

				if (isEnd) {
					auctionInfo.setAuctionProductNo(auctionProductNo);

					AuctionProduct tmpAuctionProduct = auctionProductDAO.getAuctionProduct(auctionProductNo);

					// 경매에 참여한 모든 인원들 뽑아온다.
					bidderList = auctionInfoDao.getBidderRanking(auctionInfo);

					// 희망 낙찰가 보다 최종 입찰가가 작을 경우
					if (tmpAuctionProduct.getCurrentBidPrice() < tmpAuctionProduct.getHopefulBidPrice()) {
						// 경매 상태 유찰
						auctionProduct.setAuctionStatus("FAIL");

						// 입찰한 모든 인원에게 실패 메일 발송
						for (AuctionInfo info : bidderList) {
							sendMail.sendMail(info.getUser().getId(), tmpAuctionProduct.getAuctionProductName(),
									"유찰 되셨습니다.\n"+url+auctionProductNo);
						}

					} else {
						// 1등을 제외한 모든 인원에게 입찰 상태를 전송한다.

						// 경매 상태 낙찰
						auctionProduct.setAuctionStatus("WAIT");

						// 낙찰 성공 여부에 따라 등수에 따른 메일 발송
						for (AuctionInfo info : bidderList) {
							if (info.getBidderRank() == 1) {
								auctionProduct.setSuccessfulBidderId(info.getUser().getId());
								sendMail.sendMail(info.getUser().getId(), tmpAuctionProduct.getAuctionProductName(),
										"낙찰 되셨습니다.\n 하단 링크를 통해 경매 확정 혹은 낙찰 취소 가능합니다.\n"+url+auctionProductNo
										+"\n 하단 화상채팅 버튼을 통해서 상품을 확인하세요.\n http://127.0.0.1:8080/video/"+auctionProductNo);
							} else {
								sendMail.sendMail(info.getUser().getId(), tmpAuctionProduct.getAuctionProductName(),
										"유찰 되셨습니다.\n"+url+auctionProductNo);
							}
						}
					}

					// 경매 상태를 업데이트 한다.
					auctionProductDAO.updateAuctionProductCondition(auctionProduct);

				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	@Scheduled(cron = "*/1 * * * * *")
	public void checkMainAuctionProductRemainTime() {
		// TODO Auto-generated method stub
		List<AuctionProduct> list = auctionProductDAO.listMainAuctionProduct();

		String endTime = "";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		boolean isEnd = false;

		for (AuctionProduct auctionProduct : list) {
			endTime = auctionProduct.getRemainAuctionTime();

			try {
				isEnd = dateFormat.parse(endTime).before(dateFormat.parse(dateFormat.format(new Date())));
				if (isEnd) {
					auctionProductDAO.deleteMainAuctionProduct(auctionProduct.getAuctionProductNo());
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	@Scheduled(cron = "*/1 * * * * *")
	public void bidConcernNotice() {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<AuctionInfo> list = auctionInfoDao.listBidConcern(map);
		
		String remainTime = "";
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		boolean isSend = false;
		
		for(AuctionInfo auctionInfo : list) {
			remainTime = auctionInfo.getBidDateTime();
			
			try {
				isSend = dateFormat.parse(remainTime).before(dateFormat.parse("00:30:00"));
				
				if(isSend) {
					sendMail.sendMail(auctionInfo.getUser().getId(),auctionInfo.getInfo(),
									"경매 종료 30분 전입니다. 아래 링크를 클릭하여 이동하세요.\n"+url+auctionInfo.getAuctionProductNo());
					auctionInfoDao.finishBidConcern(auctionInfo.getBidNo());
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
