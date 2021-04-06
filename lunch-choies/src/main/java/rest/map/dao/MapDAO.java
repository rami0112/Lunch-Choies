package rest.map.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rest.map.vo.MapVO;

@Repository
public class MapDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "mapper.MapMapper.";
	
	public int insertMap(MapVO mapVO) {
		return sqlSession.insert(NAMESPACE + "insertMap", mapVO);
	}
	
}
