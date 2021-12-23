package site.gamsung.service.servicecenter;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Qna;

public interface QnaDAO {
	// INSERT QUESTION
	public void addQuestion ( Qna qna) throws Exception ;
	
	// INSERT ANSWER
	public void addAnswer ( Qna qna ) throws Exception ;
	
	// SELECT
	public Qna getQna ( int qnaNo ) throws Exception ;
	
	// LIST
	public List<Qna> listQna ( Search search ) throws Exception ;
	
	// VIEW COUNT
	public void updateViewCount( int qnaNo ) throws Exception ;

	// DELETE
	public void deleteQna( int qnaNo ) throws Exception ;
	
	// TOTALCOUNT
	public int getTotalCount(Search search) throws Exception ;
	
	// NOT TOTLACOUNT
	public int notTotalCountQna() throws Exception ;
}
