package org.hope.web.comm.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.hope.web.controller.BraaController;
import org.hope.web.domain.BraaVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession sqlSession; //상위클래스로 빼는거 고려 
	
	private static final Logger logger = LoggerFactory.getLogger(BraaController.class);
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void insert(BraaVO braaVO) throws DataAccessException{ 
		// TODO Auto-generated method stub
		sqlSession.insert("BraaMapper.Braa1000_insert", braaVO);
	}
	
	public List<BraaVO> select(BraaVO braaVO) throws DataAccessException{ 
		// TODO Auto-generated method stub
		return sqlSession.selectList("BraaMapper.Braa1000_select", braaVO);
	}
	

}
