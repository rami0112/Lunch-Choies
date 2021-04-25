<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
	.place1, .place2, .place3 {
		width: 400px;
		height: 200px;
		background-color: #eee;
		border-radius: 25px;
		line-height: 200px;
		text-align: center;
		border: 0px;
		font-size: 14pt;
		font-weight: bold;
		margin: 0px 10px;
	}
	
	.place3 {
		margin: 20px auto;
		border: 4px solid #593196;
	}
	
	.place3 p {
		font-size:.875rem;
		font-weight: normal;
		margin: 15px 0px;
	}
	
	.place {
		text-align: center;
	}
	
	.roundBtns {
		text-align: center;
		font-size: 14pt;
		font-weight: bold;
	}
	
	.roundBtn {
		width: 80px;
		margin: 0px 25px;
	}
	
	#tournarment {
		text-align: center;
		margin-top: 100px;
	}
	
	#tournarmentTitle {
		font-family: 'Gaegu',cursive;
		font-size: 20pt;
		font-weight: bold;
		color: #593196;
		margin-bottom: 10px;
	}
</style>

<div>
	<input type="hidden" name="member_id" id="member_id" value="${sessionScope.member.id}">
	<div id="tournarment">
		<p id="tournarmentTitle">💜TOURNAMENT GAME💜</p>
		<p style="margin:0px;margin-bottom:20px;">원하는 라운드 버튼을 클릭하면 토너먼트가 시작됩니다.</p>
	</div>
	
	<div class="roundBtns">
		<button type="button" id="16roundBtn" class="btn btn-primary btn-lg roundBtn">16강</button>
		<button type="button" id="8roundBtn" class="btn btn-primary btn-lg roundBtn">8강</button>
		<button type="button" id="4roundBtn" class="btn btn-primary btn-lg roundBtn">4강</button>
	</div>
	<div id="roundView">
		
	</div>
</div>

<script>
		var member_id = $('#member_id').val();
		var action = './random'; 
			
		$.post(
			action,
			{
				member_id : member_id
			},
			function(data) {
				var randomNum = [];
				var divi = [];
				var place = [];
				var i = 0;
				var k = 7;
				var l = 3;
				var m = 1;

				function valueReset() {
					randomNum = [];
					divi = [];
					place = [];
					i = 0;
					k = 7;
					l = 3;
					m = 1;
				}

				$(document).on('click', '#replayBtn', function() {
					valueReset();
					$('.roundBtn').show();
					$('.place').hide();
				});
					
				
				$('#16roundBtn').click(function() {
					if (data.size < 17) {
						alert("즐겨찾기된 장소의 갯수가 부족합니다.");
						return;
					}
					$('.roundBtn').hide();
					//$('.roundBtns').text("오늘 점심 뭐 먹지? 16강");
					random(16);

					reset(2);
					
					select(k);
				});

				$('#8roundBtn').click(function() {
					if (data.size < 9) {
						alert("즐겨찾기된 장소의 갯수가 부족합니다.");
						return;
					}
					$('.roundBtn').hide();
					//$('.roundBtns').text("오늘 점심 뭐 먹지? 8강");
					random(8);

					reset(2);
					//console.log(divi);
					k = -1;
					select(l);
				});

				$('#4roundBtn').click(function() {
					if (data.size < 4) {
						alert("즐겨찾기된 장소의 갯수가 부족합니다.");
						return;
					}
					$('.roundBtn').hide();
					//$('.roundBtns').text("오늘 점심 뭐 먹지? 4강");
					random(4);

					reset(2);
					//console.log(divi);
					k = -1;
					l = -1;
					select(m);
				});
				
				function random(n){
					while (i < n) {
						var num = Math.floor(Math.random()*data.size); //0~data갯수 중에서 랜덤숫자
						if (! sameNum(num)) {
							randomNum.push(num);
							place.push(data.mapDB[num].place_name);
							i++;
						}
					}
				}

				function sameNum(num) {
					for (j = 0; j < randomNum.length; j++) {
						if (num === randomNum[j]) {
							return true;
						}
					}
					return false;
				}
//--------------------------------------------------------------------------------------------
				//배열 나누는 함수
				Array.prototype.division = function (n) {
					var arr = this;
			        var len = this.length;
			        var cnt = Math.floor(len / n);
			        divi = [];
			        
			        for (i = 0; i < cnt; i++) {
			            divi.push(arr.splice(0,n));
			        }
			        
			        return divi;
				}
				
				//console.log(place);

				function reset(n) {
					divi = place.division(n);
					place = [];
				}
				
				//선택지 2개씩 보이도록 하는 함수
				function select(n) {
					//console.log(k);
					//console.log(l);
					//console.log(m);
					var el = document.createElement('div'),
					itemStr =
						'<button type="button" class="place1">' + divi[n][0] + '</button>' +
						'<button type="button" class="place2">' + divi[n][1] + '</button>';

					el.innerHTML = itemStr;
					el.className = 'place';
					$('#roundView').append(el);
				}

				//1번 선택시 실행되는 함수
				$(document).on('click', '.place1', function() {
					place.push($(this).text()); //place에 넣고
					
					$('.place1').hide();					
					$('.place2').hide();					

					var itemStr =
						'<div class="place3">' + place[place.length-1] + '</div>';

					$('.place').append(itemStr);

					setTimeout(function() {
						$('.place').remove(); //화면 초기화하고
						
						if (k > 0) { //0~8까지 select(k)실행
							k--; //k를 -1 해준뒤
							select(k); //다음 선택지 2개 보이게
							
						} else if (k == 0) {
							//alert('k 8 끝');
							//console.log(divi);
							reset(2);
							//console.log(divi);
							select(l);
							k--;
						} else if (k == -1 && l > 0) {
							l--;
							select(l);
						} else if (l == 0) {
							//alert('l 4 끝');
							//console.log(divi);
							reset(2);
							//console.log(divi);
							select(m);
							l--;
						} else if (l == -1 && m > 0) {
							m--;
							select(m);
						} else if (m == 0) {
							//alert('m 2 끝');
							//console.log(divi);
							reset(1);
							//console.log(divi);
							
							var el = document.createElement('div'),
							itemStr =
								'<button type="button" class="place1">' + divi[0] + '</button>' +
								'<button type="button" class="place2">' + divi[1] + '</button>';
	
							el.innerHTML = itemStr;
							el.className = 'place';
							$('#roundView').append(el);
	
							m--;
						} else if (m == -1) {
							var el = document.createElement('div'),
							itemStr =
								'<div class="place3" style="line-height:normal;padding-top:39px;">' + 
									'<p>오늘 점심은</p>' + divi[0] + '<p>어때요?</p>' +
								'</div>' +
								'<button type="button" id="replayBtn" class="btn btn-primary btn-lg"> R E P L A Y </button>';
	
							el.innerHTML = itemStr;
							el.className = 'place';
							$('#roundView').append(el);
						}
					}, 1000);
				});

				//2번 선택시 실행되는 함수
				$(document).on('click', '.place2', function() {
					place.push($(this).text()); //place에 넣고
					
					$('.place1').hide();					
					$('.place2').hide();					

					var itemStr =
						'<div class="place3">' + place[place.length-1] + '</div>';

					$('.place').append(itemStr);

					setTimeout(function() {
						$('.place').remove(); //화면 초기화하고
						
						if (k > 0) { //0~8까지 select(k)실행
							k--; //k를 -1 해준뒤
							select(k); //다음 선택지 2개 보이게
						} else if (k == 0) {
							//alert('k 8 끝');
							//console.log(divi);
							reset(2);
							//console.log(divi);
							select(l);
							k--;
						} else if (k == -1 && l > 0) {
							l--;
							select(l);
						} else if (l == 0) {
							//alert('l 4 끝');
							//console.log(divi);
							reset(2);
							//console.log(divi);
							select(m);
							l--;
						} else if (l == -1 && m > 0) {
							m--;
							select(m);
						} else if (m == 0) {
							//alert('m 2 끝');
							//console.log(divi);
							reset(1);
							//console.log(divi);
							
							var el = document.createElement('div'),
							itemStr =
								'<button type="button" class="place1">' + divi[0] + '</button>' +
								'<button type="button" class="place2">' + divi[1] + '</button>';
	
							el.innerHTML = itemStr;
							el.className = 'place';
							$('#roundView').append(el);
	
							m--;
						} else if (m == -1) {
							var el = document.createElement('div'),
							itemStr =
								'<div class="place3" style="line-height:normal;padding-top:39px;">' + 
									'<p>오늘 점심은</p>' + divi[1] + '<p>어때요?</p>' +
								'</div>' +
								'<button type="button" id="replayBtn" class="btn btn-primary btn-lg"> R E P L A Y </button>';
	
							el.innerHTML = itemStr;
							el.className = 'place';
							$('#roundView').append(el);
						}
					}, 1000);
				});
				
			},
			'json'
		);
	//});
</script>

</body>
</html>