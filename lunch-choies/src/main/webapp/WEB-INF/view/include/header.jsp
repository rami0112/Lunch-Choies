<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<title>lunch choices</title>
		
		<link rel="stylesheet" href="${path}/resource/css/bootstrap.min.css?ver=1">
		<link rel="stylesheet" href="${path}/resource/css/bootstrap-cus.css?ver=1">
		
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400;700&display=swap" rel="stylesheet">	
		
	</head>
	
	<style>
		html {
			width: 100%;
			height: 100%;
		}
		
		body {
			padding-top: 4.5rem!important;
			width: 100%;
			height: 100%;
		}
		
		.fixed-top {
		}
	</style>
	
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
			<div class="container">		
				<a class="navbar-brand" href="<c:url value="/home" />">Lunch Choices</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			    
			    <!-- 로그인 전 -->
			    <c:if test="${sessionScope.member == null}">
				    <div class="collapse navbar-collapse" id="navbarColor01">
				    	<ul class="navbar-nav mr-auto">
				    		<li class="nav-item">
								<a class="nav-link" href="<c:url value="/login" />">로그인 후 이용가능합니다.</a>
							</li>
				    	</ul>
				    </div>
			    </c:if>
			    
			    
			    <!-- 로그인 후 -->
			    <c:if test="${sessionScope.member != null}">
					<div class="collapse navbar-collapse" id="navbarColor01">
					    <ul class="navbar-nav mr-auto">
	
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Map</a>
								<div class="dropdown-menu">
							    	<a class="dropdown-item" href="<c:url value="/map/search" />">Search</a>
							    	<a class="dropdown-item" href="<c:url value="/map/favorite" />">Favorite</a>
								</div>
							</li>
					      
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Game</a>
								<div class="dropdown-menu">
							    	<a class="dropdown-item" href="<c:url value="/game/random" />">Random</a>
							    	<a class="dropdown-item" href="<c:url value="/game/tournament" />">Tournament</a>
								</div>
							</li>
							
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="/board/boardList?num=1" />">Community</a>
							</li>
							
					    	<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.member.id} 님 환영합니다.</a>
								<div class="dropdown-menu">
							    	<a class="dropdown-item" href="#">MyPage</a>
							    	<a class="dropdown-item" href="<c:url value="/logout" />">Logout</a>
								</div>
							</li>
							
					    </ul>
					</div>
		    	</c:if>
			</div>
		</nav>
		
		<!-- Bootstrap core JavaScript -->
		<script src="${path}/resource/jquery/jquery.min.js"></script>
		<script src="${path}/resource/js/bootstrap.bundle.min.js"></script>
		
	 
	 