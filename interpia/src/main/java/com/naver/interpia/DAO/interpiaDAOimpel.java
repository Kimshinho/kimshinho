package com.naver.interpia.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.interpia.model.education;
import com.naver.interpia.model.interpia;

@Repository
public class interpiaDAOimpel {

	@Autowired 
	private SqlSessionTemplate sqlsession;
	
	public void insert(interpia interpia) {
		sqlsession.insert("insert",interpia);
		
	}

	public List<interpia> select(int page) {
		
		return sqlsession.selectList("select",page);
	}

	public int listCount() {
		
		return sqlsession.selectOne("count");
	}

	public int selectListCount(Map<String, Object> m) {
		
		return sqlsession.selectOne("selectcount", m);
	}

	public List<interpia> selectlist(Map<String, Object> m) {
		return sqlsession.selectList("selectlist",m);
	}

	public interpia cont(int num) {
		
		return sqlsession.selectOne("cont",num);
	}

	public void update(interpia te) {
		sqlsession.update("update",te);
		
	}

	public void rydbrupdate(education te) {
		sqlsession.update("rydbrupdate",te);
		
	}

	public void tydbrinsert(interpia interpia) {
		sqlsession.insert("rydbrinsert",interpia);
		
	}

	public education select2(String name) {
		return sqlsession.selectOne("list2",name);
	}

}
