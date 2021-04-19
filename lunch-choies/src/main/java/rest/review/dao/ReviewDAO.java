package rest.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rest.review.vo.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "mapper.ReviewMapper.";
	
	public List<ReviewVO> selectReview(ReviewVO reviewVO) {
		return sqlSession.selectList(NAMESPACE + "selectReview", reviewVO);
	}
	
	public int insertReview(ReviewVO reviewVO) {
		return sqlSession.insert(NAMESPACE + "insertReview", reviewVO);
	}
	
	public int deleteReview(ReviewVO reviewVO) {
		return sqlSession.delete(NAMESPACE + "deleteReview", reviewVO);
	}
}
