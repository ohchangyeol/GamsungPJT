package site.gamsung.service.servicecenter.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Qna;
import site.gamsung.service.domain.QnaWrapper;
import site.gamsung.service.servicecenter.QnaDAO;
import site.gamsung.service.servicecenter.QnaService;

@Service("qnaServiceImpl")
public class QnaServiceImpl implements QnaService {
	
	// Field
	@Autowired
	@Qualifier("qnaDAOImpl")
	private QnaDAO qnaDAO;

	// Constructor
	public QnaServiceImpl() {
		 System.out.println("@Service :: "+this.getClass());
	}

	@Override
	public void addQuestion(Qna qna) throws Exception {
		qnaDAO.addQuestion(qna);
	}

	@Override
	public void addAnswer(Qna Qna) throws Exception {
		qnaDAO.addAnswer(Qna);
	}

	@Override
	public Qna getQna(int noticeNo) throws Exception {
		return qnaDAO.getQna(noticeNo);
	}

	@Override
	public void updateViewCount(int qnaNo) throws Exception {
		qnaDAO.updateViewCount(qnaNo);
	}

	@Override
	public void deleteQna(int qnaNo) throws Exception {
		qnaDAO.deleteQna(qnaNo);
	}

	@Override
	public QnaWrapper listQna(Search search) throws Exception {
		return new QnaWrapper(qnaDAO.listQna(search),qnaDAO.getTotalCount(search));	
	}

	@Override
	public int notTotalCountQna() throws Exception {
		return qnaDAO.notTotalCountQna();
	}
	
	
	
}
