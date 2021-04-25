<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>


<style>
	.mainBg {
		min-height: 100%;
    	background-position: center;
    	background-size: cover;
    	background-color: #593196;
	}
	
	.mainCircle {
		width: 500px;
		height: 500px;
		background-color: #593196;
		border-radius: 100%;
		position: absolute;
		margin-top: 5%;
		margin-left: 15%;
	}
	
	.mainFont {
		text-align: center;
		padding-top: 10%;
	}
	
	.mainFont1 {
		font-family: 'Gaegu', cursive;
		font-size: 4em;
		font-weight: 400;
		color: white;
	}
	.mainFont2 {
		font-family: 'Gaegu', cursive;
		font-size: 3em;
		font-weight: 400;
		color: #efa31d;
	}
	
	.mainBtn {
		text-align: center;
		margin-top: 25px;
	}
	
	.btn-secondary {
		background-color: rgba( 255, 255, 255, 0 );
		border: 2px solid #ffffff;
		border-radius: 100px;
        color: white;
        width: 120px;
        height: 50px;
        margin-right: 10px;
	}
	
	.btn-outline-warning {
		border: 2px solid #efa31d;
		border-radius: 100px;
		width: 120px;
		height: 50px;
		margin-left: 10px;
	}
</style>

<div class="mainBg">
	<div class="mainFont">
		<div class="mainFont1"> 오늘 점심 뭐 먹지? </div>
		<div class="mainFont2"> Let's pick lunch! </div>
	</div>
	<c:if test="${sessionScope.member == null}">
		<div class="mainBtn">
			<button type="button" class="btn btn-secondary" onClick="location.href='<c:url value="/login" />'">LOGIN</button>
			<button type="button" class="btn btn-outline-warning" onClick="location.href='<c:url value="/join" />'">JOIN</button>
		</div>
	</c:if>
	
	<c:if test="${sessionScope.member != null}">
		<div class="mainBtn"> 
			<button type="button" class="btn btn-secondary" onClick="location.href='<c:url value="/game/random" />'">Random</button>
			<button type="button" class="btn btn-outline-warning" onClick="location.href='<c:url value="/game/tournament" />'">Tournament</button>
		</div>
	</c:if>
</div>

<script>
		
		
</script>
</body>
</html>
