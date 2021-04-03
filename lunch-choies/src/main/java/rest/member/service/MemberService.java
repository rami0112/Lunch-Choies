package rest.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rest.member.dao.MemberDAO;
import rest.member.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO selectMember(MemberVO memberVO) {
		return memberDAO.selectMember(memberVO);
	}
	
	public int insertMember(MemberVO memberVO) {
		return memberDAO.insertMember(memberVO);
	}
}
