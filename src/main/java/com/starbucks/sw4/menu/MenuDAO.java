package com.starbucks.sw4.menu;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.starbucks.sw4.menu.category.CategoryDTO;

@Component
public class MenuDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.starbucks.sw4.menu.MenuDAO.";
	
	public List<CategoryDTO> getCategoryList(MenuDTO menuDTO) throws SQLException, ClassNotFoundException{
		return sqlSession.selectList(NAMESPACE+"getCategoryList", menuDTO);
	}
	
	public MenuDTO getOne(MenuDTO menuDTO) throws SQLException, ClassNotFoundException{
		System.out.println(menuDTO.getMenuCode());
		return sqlSession.selectOne(NAMESPACE+"getOne", menuDTO);
	}
	
	public List<MenuDTO> getMenuList(MenuDTO menuDTO) throws SQLException, ClassNotFoundException{
		return sqlSession.selectList(NAMESPACE+"getMenuList", menuDTO);
	}

	public List<OptionDTO> getOptionList() throws SQLException, ClassNotFoundException{
		return sqlSession.selectList(NAMESPACE+"getOptionList");
	}
	
	public List<StoreSDTO> getStoreList(String limitedStore) throws SQLException, ClassNotFoundException{
		return sqlSession.selectList(NAMESPACE+"getStoreList", limitedStore);
	}
}
