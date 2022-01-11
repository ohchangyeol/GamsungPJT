package site.gamsung.service.user.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;
import site.gamsung.service.user.UserDAO;

@Repository("userDAOImpl")
public class UserDAOImpl implements UserDAO{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	///Constructor
	public UserDAOImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addUser(User user){
		sqlSession.insert("UserMapper.addUser", user);
	}

	@Override
	public User getUser(String id){
		return sqlSession.selectOne("UserMapper.getUser", id);
	}

	@Override
	public void updateUser(User user){
		sqlSession.update("UserMapper.updateUser", user);
		
	}

	@Override
	public List<User> listUser(Search search){
		return sqlSession.selectList("UserMapper.listUser", search);
	}

	@Override
	public int getTotalCount(Search search){

		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}

	@Override
	public int checkDuplication(User user){

		return sqlSession.selectOne("UserMapper.checkDuplication", user);
	}

	@Override
	public void addLoginDate(User user){
		
		sqlSession.insert("UserMapper.addLoginDate", user);
	}

	@Override
	public String getSaltById(String id){
		
		return sqlSession.selectOne(id);
	}

	@Override
	public String findId(Map<String, Object> map){
		return sqlSession.selectOne("UserMapper.findId", map);
	}

	@Override
	public void addSuspensionUser(User user){
		sqlSession.update("UserMapper.addSuspensionUser", user);
		
	}

	@Override
	public void addSecessionUser(User user){
		sqlSession.update("UserMapper.addSecessionUser", user);
		
	}

	@Override
	public void addDormantUser(User user){
		sqlSession.update("UserMapper.addDormantUser", user);	
	}

	@Override
	public void updateDormantGeneralUserConver(String id){
		sqlSession.update("UserMapper.updateDormantGeneralUserConvert", id);
		
	}

	@Override
	public List<User> reportSuspensionListUser(Search search) {
		return sqlSession.selectList("UserMapper.reportSuspensionListUser", search);
	}

	@Override
	public int countReportSuspensionListUser(Search search) {
		return sqlSession.selectOne("UserMapper.countReportSuspensionListUser", search);
	}

	@Override
	public List<User> dormantListUser(Search search) {
		return sqlSession.selectList("UserMapper.dormantListUser", search);
	}

	@Override
	public int countDormantListUser(Search search) {
		return sqlSession.selectOne("UserMapper.countDormantListUser", search);
	}
	
	@Override
	public List<User> secessionListUser(Search search) {
		return sqlSession.selectList("UserMapper.secessionListUser", search);
	}

	@Override
	public int countSecessionListUser(Search search) {
		return sqlSession.selectOne("UserMapper.countSecessionListUser", search);
	}

}
