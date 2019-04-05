package com.naver.interpia.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.interpia.model.education;
import com.naver.interpia.model.interpia;

@Service("interpia")
public class interpiaServiceimpel implements interpiaService {

	@Autowired
	private interpiaDAOimpel dao;

	@Override
	public void insert(interpia interpia) {
	dao.insert(interpia);
		
	}

	@Override
	public List<interpia> slelct(int page) {
	return dao.select(page);
	}

	@Override
	public int ListCount() {
		
		return dao.listCount();
	}

	@Override
	public int selectListCount(Map<String, Object> m) {
		
		return dao.selectListCount(m);
	}

	@Override
	public List<interpia> slelctlist(Map<String, Object> m) {
		
		return dao.selectlist(m);
	}

	@Override
	public interpia cont(int num) {
		
		return dao.cont(num);
	}

	@Override
	public void update(interpia te) {
		dao.update(te);
		
	}

	@Override
	public void rydbrupdate(education te) {
		dao.rydbrupdate(te);
		
	}

	@Override
	public void rydbrinsert(interpia interpia) {
		dao.tydbrinsert(interpia);
		
	}

	@Override
	public education select2(String name) {
		
		return dao.select2(name);
	}
	
	
}
