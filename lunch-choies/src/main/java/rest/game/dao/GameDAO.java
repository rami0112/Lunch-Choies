package rest.game.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rest.map.vo.MapVO;

@Repository
public class GameDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "mapper.GameMapper.";
	
	public List<MapVO> selectRandom(MapVO mapVO) {
		return sqlSession.selectList(NAMESPACE + "selectRandom", mapVO);
	}
}
