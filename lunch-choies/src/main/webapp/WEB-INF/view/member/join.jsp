<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
	#joinForm {
		width: 500px;
		margin: 0 auto;
		margin-top: 125px;
	}
	#id-form {
		width: 400px;
		float: left;
	}
	#id-checkBtn {
		width: 90px;
		margin-left: 10px;
	}
</style>

<form:form name="joinForm" id="joinForm" modelAttribute="memberVO" action="join" method="post">
		<div class="form-group">
			<label class="col-form-label" for="id-form" style="float:left;">아이디*&nbsp&nbsp</label>
			<p id="id-hint" class="col-form-label" style="color:red; font-size:50%;"><form:errors path="id" /></p> 
			<div style="display:inline-block;">
				<input type="text" name="id" class="form-control" id="id-form" aria-describedby="id-hint" value="${memberVO.id}">
				<button type="button" class="btn btn-outline-primary" id="id-checkBtn">중복확인</button>
				<input type="hidden" name="idCheck" class="id-check" value="0">
			</div>
		</div>

		<div class="form-group">
			<label class="col-form-label" for="password-form" style="float:left;">비밀번호*&nbsp&nbsp</label>
			<p id="password-hint" class="col-form-label" style="color:red; font-size:50%;"><form:errors path="password" /></p> 
			<input type="password" name="password" class="form-control"	id="password-form" aria-describedby="password-hint">
		</div>

		<div class="form-group">
			<label class="col-form-label" for="passwordCheck-form" style="float:left;">비밀번호 확인*&nbsp&nbsp</label> 
			<p id="passwordCheck-hint" class="col-form-label" style="color:red; font-size:50%;"><form:errors path="passwordCheck" /></p> 
			<input type="password" name="passwordCheck" class="form-control" id="passwordCheck-form" aria-describedby="passwordCheck-hint">
		</div>

		<div class="form-group">
			<label class="col-form-label" for="name-form" style="float:left;">이름*&nbsp&nbsp</label>
			<p id="name-hint" class="col-form-label" style="color:red; font-size:50%;"><form:errors path="name" /></p> 
			<input type="text" name="name" class="form-control" id="name-form" aria-describedby="name-hint" value="${memberVO.name}">
		</div>

		<input type="submit" class="btn btn-primary btn-lg btn-block" value="회원가입" style="margin-top: 40px;">
</form:form>

<script>
	$('#id-checkBtn').click(function() {
		var form = document.joinForm;
		var id = form.id.value;
		var action = './idCheck';

		$.post(
			action,
			{
				id : id
			},
			function(data) {
				alert(data.msg);
			},
			'json'
		);
	});

	$('#id-checkBtn').click(function() {
		$('.id-check').val(1);
	});
	
</script>

</body>
</html>