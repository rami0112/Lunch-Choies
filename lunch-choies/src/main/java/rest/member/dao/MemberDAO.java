package rest.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rest.member.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "mapper.MemberMapper.";
	
	public MemberVO selectMember(MemberVO memberVO) {
		return sqlSession.selectOne(NAMESPACE + "selectMember", memberVO);
	}
	
	public int insertMember(MemberVO memberVO) {
		return sqlSession.insert(NAMESPACE + "insertMember", memberVO);
	}
}
