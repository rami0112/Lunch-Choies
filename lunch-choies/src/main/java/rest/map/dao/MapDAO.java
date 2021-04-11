package rest.map.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rest.map.vo.MapVO;

@Repository
public class MapDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "mapper.MapMapper.";
	
	public List<MapVO> selectMap(MapVO mapVO) {
		return sqlSession.selectList(NAMESPACE + "selectMap", mapVO);
	}
	
	public int countMap(MapVO mapVO) {
		return sqlSession.selectOne(NAMESPACE + "countMap", mapVO);
	}
	
	public int insertMap(MapVO mapVO) {
		return sqlSession.insert(NAMESPACE + "insertMap", mapVO);
	}
	
	public int deleteMap(MapVO mapVO) {
		return sqlSession.delete(NAMESPACE + "deleteMap", mapVO);
	}
	
}
