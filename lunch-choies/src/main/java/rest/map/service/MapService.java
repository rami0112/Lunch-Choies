package rest.map.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rest.map.dao.MapDAO;
import rest.map.vo.MapVO;

@Service
public class MapService {

	@Autowired
	private MapDAO mapDAO;
	
	public MapVO selectMap(MapVO mapVO) {
		return mapDAO.selectMap(mapVO);
	}
	
	public int insertMap(MapVO mapVO) {
		return mapDAO.insertMap(mapVO);
	}
	
	public int deleteMap(MapVO mapVO) {
		return mapDAO.deleteMap(mapVO);
	}
	
}
