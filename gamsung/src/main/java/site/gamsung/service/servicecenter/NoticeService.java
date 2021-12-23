package site.gamsung.service.servicecenter;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Notice;
import site.gamsung.service.domain.NoticeWrapper;

public interface NoticeService {
	
	// 공지사항 등록 + 캠핑장공지 사항 등록
	public void addNotice(Notice notice) throws Exception;
	
	// 공지사항 조회 
	public Notice getNotice ( int noticeNo ) throws Exception ;
	
	// 공지사항 수정
	public void updateNotice( Notice notice ) throws Exception ;
	
	// 공지사항 조회수 증가
	public void updateViewCount( int noticeNo  ) throws Exception ;
	
	// 공지사항 삭제 ( 블라인드 처리 )
	public void deleteNotice( int noticeNo ) throws Exception ;
	
	// 공지사항 목록 조회 + 캠핑장 공지사항 목록 조회
	public NoticeWrapper listNotice ( Search search ) throws Exception ;
}