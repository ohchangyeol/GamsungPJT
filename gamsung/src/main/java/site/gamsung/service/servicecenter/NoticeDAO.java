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
	public List<Notice> listProductList( Search search ) throws Exception ;
}
