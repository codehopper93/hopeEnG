package org.hope.web.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.hope.web.controller.GlaaController;
import org.hope.web.domain.GlaaFileVO;
import org.hope.web.domain.GlaaVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class GlaaDAO {
	
	@Autowired
	private SqlSession sqlSession; //상위클래스로 빼기 -> 상위클래스에서 필요한 부분 오버라이드 해서 자식클래스는 불러서 사용
	
	private static final Logger logger = LoggerFactory.getLogger(GlaaController.class);
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(GlaaVO glaaVO) throws DataAccessException{ 

		sqlSession.insert("GlaaMapper.Glaa1000_insert", glaaVO);
		
		return glaaVO.getgllyNo();
	}
	
	public void insertGlaaFile(GlaaFileVO glaaFileVO) throws DataAccessException{
		sqlSession.insert("GlaaMapper.Glaa1000_insertFile", glaaFileVO);
		
	}
	
	public List<GlaaVO> select(Map<String, String> map) throws DataAccessException{ 

		List<GlaaVO> tmp = sqlSession.selectList("GlaaMapper.Glaa1000_select", map);

		return tmp;
	}
	
	public GlaaVO selectDetail(String gllyNo) throws DataAccessException{ 

		GlaaVO tmp = sqlSession.selectOne("GlaaMapper.Glaa1000_selectDetail", gllyNo);
		return tmp;
	}

	public List<Map<String, String>> selectImagePath(Map<String, String> map){
		return sqlSession.selectList("GlaaMapper.Glaa1000_selectImagePath",map);
	}
	
	public int updateGlaa(Model model) throws DataAccessException{
		
		return sqlSession.update("GlaaMapper.Glaa1000_update", model);
	}

}
