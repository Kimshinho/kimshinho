package com.naver.interpia.DAO;

import java.util.List;
import java.util.Map;

import com.naver.interpia.model.education;
import com.naver.interpia.model.interpia;

public interface interpiaService {

	void insert(interpia interpia);

	List<interpia> slelct(int page);

	int ListCount();
	
	int selectListCount(Map<String, Object> m);

	List<interpia> slelctlist(Map<String, Object> m);

	interpia cont(int num);

	void update(interpia te);

	void rydbrupdate(education te);

	void rydbrinsert(interpia interpia);

	education select2(String name);
}
