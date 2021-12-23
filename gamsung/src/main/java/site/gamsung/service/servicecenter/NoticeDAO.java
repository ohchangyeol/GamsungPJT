package site.gamsung.service.servicecenter;

import java.util.List;


import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Notice;

public interface NoticeDAO {

	// INSERT
	public void addNotice ( Notice notice ) throws Exception ;
	
	// SELECT
	public Notice getNotice ( int noticeNo ) throws Exception ;
	
	// LIST
	public List<Notice> listNotice( Search search ) throws Exception ;
	
	// UPDATE
	public void updateNotice( Notice notice ) throws Exception ;
	
	// VIEW COUNT
	public void updateViewCount( int noticeNo ) throws Exception ;

	// DELETE
	public void deleteNotice( int noticeNo ) throws Exception ;
	
	// TOTALCOUNT
	public int getTotalCount(Search search) throws Exception ;
}
