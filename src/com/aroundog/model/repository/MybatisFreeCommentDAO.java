package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.FreeComment;

@Repository
public class MybatisFreeCommentDAO implements FreeCommentDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public List selectAll() {
		List fcList=sqlSessionTemplate.selectList("FreeComment.selectAll");
		return fcList;
	}

	@Override
	public int delete(int freecomment_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(FreeComment freeComment) {
		return sqlSessionTemplate.insert("FreeComment.insert", freeComment);
	}

	@Override
	public int update(FreeComment freeboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FreeComment select(int freecomment_id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int commentAdd(FreeComment freeComment) {
		return sqlSessionTemplate.insert("FreeComment.commentAdd", freeComment);
	}

}
