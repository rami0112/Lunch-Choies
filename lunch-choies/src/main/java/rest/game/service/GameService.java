package rest.game.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rest.game.dao.GameDAO;
import rest.map.vo.MapVO;

@Service
public class GameService {

	@Autowired
	private GameDAO gameDAO;
	
	public List<MapVO> selectRandom(MapVO mapVO) {
		return gameDAO.selectRandom(mapVO);
	}
}
