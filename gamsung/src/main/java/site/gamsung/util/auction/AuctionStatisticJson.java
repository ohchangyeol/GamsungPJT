package site.gamsung.util.auction;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import site.gamsung.service.domain.AuctionInfo;

public class AuctionStatisticJson {
	
	@SuppressWarnings("unchecked")
	public List<String> makeJson(List<AuctionInfo> list) {
		
		List<String> jsonList  = new ArrayList<String>();
		JSONObject jsonObject = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		
		List<Object> dataList  = new ArrayList<Object>();
		
		/*//////////////////////////경매확정//////////////////////////*/
		
		for(AuctionInfo auctionInfo : list) {
			List<Object> tmpList = new ArrayList<Object>();
			tmpList.add(auctionInfo.getInfo());
			tmpList.add(auctionInfo.getAuctionConfirmCount());
			dataList.add(tmpList);
		}
		
		jsonObject.put("data", dataList);
		jsonObject.put("color", "#0088cc");
		if(list.size() != 0 && list.get(0).getInfo().length() == 4) {
			jsonObject.put("label", "경매확정");
		}
		String json = "";
		
		try {
			json = mapper.writeValueAsString(jsonObject);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		jsonList.add(json);
		jsonObject.clear();
		dataList.clear();
		
		/*//////////////////////////유찰//////////////////////////*/
		
		for(AuctionInfo auctionInfo : list) {
			List<Object> tmpList = new ArrayList<Object>();
			tmpList.add(auctionInfo.getInfo());
			tmpList.add(auctionInfo.getAuctionFailCount());
			dataList.add(tmpList);
		}
		jsonObject.put("data", dataList);
		jsonObject.put("color", "#2baab1");
		if(list.size() != 0 && list.get(0).getInfo().length() == 4) {
			jsonObject.put("label", "유찰");
		}
		try {
			json = mapper.writeValueAsString(jsonObject);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		jsonList.add(json);
		jsonObject.clear();
		dataList.clear();
		
		/*//////////////////////////낙찰취소//////////////////////////*/
	
		for(AuctionInfo auctionInfo : list) {
			List<Object> tmpList = new ArrayList<Object>();
			tmpList.add(auctionInfo.getInfo());
			tmpList.add(auctionInfo.getCancelSuccessfulBidCount());
			dataList.add(tmpList);
		}
		
		jsonObject.put("data", dataList);
		jsonObject.put("color", "#734ba9");
		if(list.size() != 0 && list.get(0).getInfo().length() == 4) {
			jsonObject.put("label", "낙찰취소");
		}
		try {
			json = mapper.writeValueAsString(jsonObject);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		jsonList.add(json);
		jsonObject.clear();
		dataList.clear();
		
		/*//////////////////////////중도철회//////////////////////////*/

		for(AuctionInfo auctionInfo : list) {
			List<Object> tmpList = new ArrayList<Object>();
			tmpList.add(auctionInfo.getInfo());
			tmpList.add(auctionInfo.getMidwayWithdrawalCount());
			dataList.add(tmpList);
		}
		
		jsonObject.put("data", dataList);
		jsonObject.put("color", "#E36159");
		if(list.size() != 0 && list.get(0).getInfo().length() == 4) {
			jsonObject.put("label", "중도철회");
		}
		try {
			json = mapper.writeValueAsString(jsonObject);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		jsonList.add(json);
		jsonObject.clear();
		dataList.clear();
		
		return jsonList;
	}

}
