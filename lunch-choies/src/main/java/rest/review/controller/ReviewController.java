package rest.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import rest.review.service.ReviewService;
import rest.review.vo.ReviewVO;

@Controller
@RequestMapping("/map/")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	//리뷰쓰기 ajax
	@PostMapping(value="reviewWrite", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> reviewWrite(ReviewVO reviewVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
		
			int result = reviewService.insertReview(reviewVO);
			if (result == 1) {
				rs.put("msg", "리뷰가 등록되었습니다.");
			}
		
		return rs;
	}
	
	//리뷰보기 ajax
	@PostMapping(value="reviewRead", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> reviewRead(ReviewVO reviewVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
		
		List<ReviewVO> reviewDB = reviewService.selectReview(reviewVO);
		if (!reviewDB.isEmpty()) {
			rs.put("reviewDB", reviewDB);
		} else {
			rs.put("msg", "작성된 리뷰가 없습니다.");
		}
		return rs;
	}
}
