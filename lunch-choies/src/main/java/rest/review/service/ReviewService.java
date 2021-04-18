package rest.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rest.review.dao.ReviewDAO;
import rest.review.vo.ReviewVO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	public List<ReviewVO> selectReview(ReviewVO reviewVO) {
		return reviewDAO.selectReview(reviewVO);
	}
	
	public int insertReview(ReviewVO reviewVO) {
		return reviewDAO.insertReview(reviewVO);
	}
}
