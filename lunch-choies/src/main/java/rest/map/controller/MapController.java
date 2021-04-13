package rest.map.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonAlias;

import rest.map.service.MapService;
import rest.map.vo.MapVO;

@Controller
@RequestMapping("/map/")
public class MapController {
	
	@Autowired
	private MapService mapService;

	@GetMapping("search")
	public String searchGet() {
		return "map/search";
	}

	//장소 즐겨찾기 등록 ajax
	@PostMapping(value="favoritesCheck", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> favoritesCheck(MapVO mapVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
		
		int mapDB = mapService.countMap(mapVO);
		if (mapDB == 0) {
			int result = mapService.insertMap(mapVO);
			if (result == 1) {
				rs.put("msg", "즐겨찾기 등록 완료❤");
				rs.put("background", "/resource/images/favorite.png') no-repeat");
				rs.put("backgroundSize", "contain");
			}
		} else if (mapDB == 1) {
			int result = mapService.deleteMap(mapVO);
			if (result == 1) {
				rs.put("msg", "즐겨찾기 해제💔");
				rs.put("background", "/resource/images/unfavorite.png') no-repeat");
				rs.put("backgroundSize", "contain");
			}
		}
		return rs;
	}
	
	//장소 즐겨찾기 ajax
	@PostMapping(value="favorites", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> favorites(MapVO mapVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
		
		int mapDB = mapService.countMap(mapVO);
		if (mapDB == 1) {
			rs.put("background", "/resource/images/favorite.png') no-repeat");
			rs.put("backgroundSize", "contain");
		} else if (mapDB == 0) {
			rs.put("background", "/resource/images/unfavorite.png') no-repeat");
			rs.put("backgroundSize", "contain");
		}
		return rs;
	}

	@GetMapping("favorite")
	public String favoriteGet() {
		return "map/favorite";
	}
	
	//즐겨찾기한 장소찾기 ajax
	@PostMapping(value="star", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> star(MapVO mapVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
		
		List<MapVO> mapDB = mapService.selectMap(mapVO);
		if (mapDB != null) {
			/*for (int i = 0; i < mapDB.size(); i++) {*/
				rs.put("size", mapDB.size());
				rs.put("mapDB", mapDB);
		}
		return rs;
		
	}

}
