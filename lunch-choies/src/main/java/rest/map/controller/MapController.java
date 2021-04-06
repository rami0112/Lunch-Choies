package rest.map.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@PostMapping(value="favorites", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> favorites(MapVO mapVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
		int result = mapService.insertMap(mapVO);
		if (result == 1) {
			rs.put("msg", "즐겨찾기 등록 완료❤");
		}
		return rs;
	}

}
