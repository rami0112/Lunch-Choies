<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
	#random {
		text-align: center;
		margin-top: 100px;
	}
	
	#randomResult {
		margin: 20px auto;
		width: 400px;
		height: 200px;
		border-radius: 25px;
		background-color: #eeeeee;
	}
	
	#randomTitle {
		font-family: 'Gaegu',cursive;
		font-size: 20pt;
		font-weight: bold;
		color: #593196;
		margin-bottom: 10px;
	}
	
</style>

<div id="random">
	<p id="randomTitle">💜RANDOM GAME💜</p>
	<p style="margin:0px;">버튼을 클릭하면 즐겨찾기 해놓은 장소 중 랜덤으로 한 곳이 뽑힙니다.</p>
	<input type="hidden" name="member_id" id="member_id" value="${sessionScope.member.id}">
	<div id="randomResult"><p style="padding-top:0px;line-height:200px;">오늘 점심 뭐 먹지 ?</p></div>
	<button type="button" id="randomBtn" class="btn btn-primary btn-lg"> C L I C K </button>
</div>

<script>
	$('#randomBtn').click(function() {

		var member_id = $('#member_id').val();
		var action = './random'; 
			
		$.post(
			action,
			{
				member_id : member_id
			},
			function(data) {
				if (data.size == null) {
					$('#randomResult').html('<p style="line-height:200px;">저장한 즐겨찾기가 없습니다.</p>');
				} else {
					var num = Math.floor(Math.random()*data.size);
					$('#randomResult').html('<p style="padding-top:50px;">오늘 점심은</p><p style="font-size:14pt;font-weight:bold;">' 
							+ data.mapDB[num].place_name + '</p><p>어때요?</p>');
				}
			},
			'json'
		);
	});
</script>

</body>
</html>