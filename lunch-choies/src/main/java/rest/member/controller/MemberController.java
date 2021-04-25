package rest.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import rest.member.service.MemberService;
import rest.member.validator.MemberValidator;
import rest.member.vo.MemberVO;

@Controller
@RequestMapping("/")
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	@GetMapping("home")
	public String homeGet() {
		return "home";
	}
	
	//회원가입
	@GetMapping("join")
	public String joinGet() {
		return "member/join";
	}
	
	@PostMapping("join")
	public String join(MemberVO memberVO, Errors errors, Model model, HttpSession session, HttpServletRequest request) {
		new MemberValidator().validate(memberVO, errors);
		if (errors.hasErrors()) {
			model.addAttribute("member", memberVO);
			return "member/join";
		}
		try {
			//중복확인 여부
			if (memberVO.getIdCheck() == 1) {
				int result = memberService.insertMember(memberVO);
				if (result == 1) {
					model.addAttribute("msg", "가입을 환영합니다! 로그인을 해주세요💜");
					model.addAttribute("uri", request.getContextPath() + "/login");
					return "common/alert";
				}
			} else if (memberVO.getIdCheck() == 0) {
				errors.rejectValue("id", "duplicate.id");
			}
		} catch (DuplicateKeyException e) {
			errors.rejectValue("id", "duplicate.id");
			return "member/join";
		}
		return "member/join";
	}
	
	//중복확인 ajax
	@PostMapping(value="idCheck", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> idCheck(MemberVO memberVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
		MemberVO memberDB = memberService.selectMember(memberVO);
		if (memberVO.getId() == null || memberVO.getId().trim().isEmpty()) {
			rs.put("msg", "아이디를 입력해주세요.");
		} else if (memberDB != null) {
			rs.put("msg", "중복된 아이디입니다.");
		} else if (memberDB == null) {
			rs.put("msg", "사용가능한 아이디입니다.");
		}
		return rs;
	}
	
	//로그인
	@GetMapping("login")
	public String loginGet() {
		return "member/login";
	}
	
	@PostMapping("login")
	public String login(MemberVO memberVO, Model model, HttpSession session, HttpServletRequest request) {

		MemberVO memberDB = memberService.selectMember(memberVO);
		if (memberDB != null) {
			session.setAttribute("member", memberDB);
			return "redirect:/home";
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
			model.addAttribute("uri", request.getContextPath() + "/login");
			return "common/alert";
		}
	}
	
	//로그아웃
	@GetMapping("logout")
	public String logoutGet(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
}
