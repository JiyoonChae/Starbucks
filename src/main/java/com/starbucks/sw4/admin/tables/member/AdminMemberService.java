package com.starbucks.sw4.admin.tables.member;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starbucks.sw4.admin.util.Pager;

@Service
public class AdminMemberService {

	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	public List<AdminMemberDTO> getList(Pager pager) throws SQLException, ClassNotFoundException{
		
		pager.makeRow();
		pager.setTotalCount(adminMemberDAO.getCount(pager));
		pager.makePage();
		
		return adminMemberDAO.getList(pager);
		
	}
	
}
