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
</style>

<form:form id="loginForm" modelAttribute="memberVO" action="login" method="post">
	<div class="form-group" style="float:left;">
		<input type="text" name="id" id="id-form" class="form-control" placeholder="ID" value="${member.id}" style="width:225px;">
		<form:errors path="id" />
		<input type="password" name="password" id="password-form" class="form-control" placeholder="PASSWORD" style="width:225px; margin-top: 10px;">
		<form:errors path="password" />
		<%--<form:errors path="notFoundMember" />--%>
	</div>
	<input type="submit" value="LOGIN" id="loginBtn" class="btn btn-primary btn-lg btn-block" style="width:100px; height:80px; margin-left:10px; float:left;">

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
	$('#loginBtn').click(function() {
		if ($('#id-form').val() == null || $('#id-form').val().trim().isEmpty()) {
			alert('아이디를 입력해주세요.');
			$('#id-form').focus();
		} else if ($('#password-form').val()=='' || $('#password-form').val()==null) {
			alert('비밀번호를 입력해주세요.');
			$('#password-form').focus();
		}
	});
</script>
</body>
</html>