<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
	#loginForm {
		width: 335px;
		margin: 0 auto;
		margin-top: 250px;
	}
	
	#forgot {
		display: inline-block;
	}
	
	#loginBtn {
		width: 100px; 
		height: 80px; 
		margin-left: 10px; 
		float: left;
	}
</style>

<form:form name="loginForm" id="loginForm" modelAttribute="memberVO" action="login" method="post">
	<div class="form-group" style="float:left;">
		<input type="text" name="id" id="id-form" class="form-control" placeholder="ID" value="${member.id}" style="width:225px;">
		<input type="password" name="password" id="password-form" class="form-control" placeholder="PASSWORD" style="width:225px; margin-top: 10px;">
	</div>
	<input type="button" value="LOGIN" id="loginBtn" class="btn btn-primary btn-lg btn-block" onclick="login();">

	<div id="forgot">
		<span>
			<a href="#">아이디</a>
		</span> 
		<span>&nbsp;·&nbsp;</span>
		<span>
			<a href="#">비밀번호 찾기</a>
		</span>
		<span>&nbsp;|&nbsp;</span>
			<a href="<c:url value="/join" />">회원가입</a>
	</div>
</form:form>

<script>
	function login() {
		var form = document.loginForm;
		var id = form.id;
		var password = form.password;
		var pattern = /\s/g;

        //아이디 공백체크
        if (id.value == "" || id.value.match(pattern)) {
	        alert("아이디를 입력해주세요.");
	        id.focus(); //포커스를 id박스로 이동
	        return;
        }
		//비밀번호 공백체크
    	if (password.value == "" || password.value.match(pattern)) {
	        alert("비밀번호를 입력해주세요.");
	        password.focus(); //포커스를 Password박스로 이동
	        return;
    	}
    	
		form.submit();
	}


	<%--
	$('#loginBtn').click(function() {
		if ($('#id-form').val() == null || $('#id-form').val().trim().isEmpty()) {
			alert('아이디를 입력해주세요.');
			$('#id-form').focus();
		} 
		else if ($('#password-form').val()=='' || $('#password-form').val()==null) {
			alert('비밀번호를 입력해주세요.');
			$('#password-form').focus();
		}
	});
	--%>
</script>
</body>
</html>