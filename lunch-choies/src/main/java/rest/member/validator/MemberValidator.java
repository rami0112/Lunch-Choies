package rest.member.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import rest.member.vo.MemberVO;

public class MemberValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberVO memberVO = (MemberVO) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_name", "required");
		
		if (!memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
			errors.rejectValue("passwordCheck", "required.passwordCheck");
		}
	}
	
}
