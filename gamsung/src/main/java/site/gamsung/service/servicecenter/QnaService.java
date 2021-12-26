package site.gamsung.service.servicecenter;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Qna;
import site.gamsung.service.domain.QnaWrapper;

public interface QnaService {

	// QnA 등록
	public void addQuestion(Qna qna) throws Exception;
	
	// QnA 등록
	public void addAnswer(Qna qna) throws Exception;
	
	// QnA 조회
	public Qna getQna ( int qnaNo ) throws Exception ;
	
	// QnA 조회수 증가
	public void updateViewCount( int qnaNo  ) throws Exception ;
	
	// QnA 삭제 ( 블라인드 처리 )
	public void deleteQna( int qnaNo ) throws Exception ;
	
	// QnA 목록 조회
	public QnaWrapper listQna( Search search ) throws Exception ;
	
	// 답변이 없는 QnA
	public int notTotalCountQna() throws Exception ;
}

