package com.starbucks.sw4.member.auth;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthDAO {
	
	@Autowired
	private SqlSession sqlSession;	
	private final String NAMESPACE = "com.starbucks.sw4.member.auth.AuthDAO.";
	
	public int setAuthEmailSend(AuthDTO authDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setAuthEmailSend", authDTO);
	}
	
	public long getMemberEmailCheck(AuthDTO authDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"setAuthEmailCheck", authDTO);
	}
	
	public long setEmailAuthStatus(AuthDTO authDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setEmailAuthStatus", authDTO);
	}
}