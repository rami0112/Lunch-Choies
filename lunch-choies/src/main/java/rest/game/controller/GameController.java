package rest.game.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import rest.game.service.GameService;
import rest.map.vo.MapVO;

@Controller
@RequestMapping("/game/")
public class GameController {
	
	@Autowired
	private GameService gameService;


	@GetMapping("random")
	public String randomGet() {
		return "game/random";
	}
	
	@GetMapping("tournament")
	public String tournamentGet() {
		return "game/tournament";
	}
	
	//랜덤게임 ajax
	@PostMapping(value="random", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> random(MapVO mapVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
		
		List<MapVO> mapDB = gameService.selectRandom(mapVO);
		if (!mapDB.isEmpty()) {
			rs.put("size", mapDB.size());
			rs.put("mapDB", mapDB);
		} else {
			rs.put("msg", "즐겨찾기가 없습니다.");
		}
		return rs;
	}
	
}
