package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.FreeBoard;
@Repository
public class MybatisFreeBoardDAO implements FreeBoardDAO{	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//��� �����Խ��� �� ��������
	public List selectAll() {
		List freeBoardList=sqlSessionTemplate.selectList("FreeBoard.selectAll");
		return freeBoardList;
	}
	//�Խñ� �Ѱ� ����
	public int delete(int freeboard_id) {		
		return sqlSessionTemplate.delete("FreeBoard.delete", freeboard_id);
	}

	public int insert(FreeBoard freeboard) {
		return sqlSessionTemplate.insert("FreeBoard.insert", freeboard);
	}
	@Override
	public int update(FreeBoard freeboard) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public FreeBoard select(int freeboard_id) {
		return sqlSessionTemplate.selectOne("FreeBoard.select", freeboard_id);
	}
	public int updateHitCnt(int freeboard_id) {
		return sqlSessionTemplate.update("FreeBoard.updateHitCnt", freeboard_id);
	}

	

}