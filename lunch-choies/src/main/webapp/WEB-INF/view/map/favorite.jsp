<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=188651cfe552ee9b3c8c65f2d926eb55&libraries=services,clusterer,drawing"></script>
<style>
	#map {
		width: 100%;
		height: 100%;
		position: relative;
		overflow: hidden;
	}
	
	.map_wrap, .map_wrap * {
		margin: 0;
		/*padding: 0;*/
		font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	}
	
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
		color: #000;
		text-decoration: none;
	}
	
	.map_wrap {
		position:relative;
		width: 100%;
		height: 100%;
	}
	
	#menu_wrap {
		width: 350px;
		height: 100%;
		position: absolute;
		top: 0;
		left: 0;
		bottom: 0;
		z-index: 1;
		background-color: white;
		font-size: 12px;
		box-shadow: 1px 1px 10px 1px gray;
	}
	
	.bg_white {
		background: #fff;
	}
	
	#menu_wrap hr {
		display: block;
		height: 1px;
		border: 0;
		border-top: 2px solid #5F5F5F;
		margin: 3px 0;
	}
	
	#menu_wrap .option {
		/*text-align: center;*/
		background-color: white;
		border-bottom: 1px solid lightgray;
		width: 350px;
		height: 75px;
		padding: 20px 25px;
	}
	
	#menu_wrap .option button {
		width: 70px;
		height: 35px;
	}
	
	#placesList {
		padding: 0px;
		position: relative;
	}
	
	#placesList li {
		list-style: none;
	}
	
	#placesList .item {
		position: relative;
		border-bottom: 1px solid #888;
		overflow: hidden;
		cursor: pointer;
		min-height: 65px;
	}
	
	#placesList .item span {
		display: block;
		margin-top: 4px;
	}
	
	#placesList .item h5, #placesList .item .info {
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	
	#placesList .item .info {
		padding: 10px 0 10px 55px;
	}
	
	#placesList .info .gray {
		color: #8a8a8a;
	}
	
	#placesList .info .jibun {
		padding-left: 26px;
		background:
			url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
			no-repeat;
	}
	
	#placesList .info .tel {
		color: #009900;
	}
	
	#placesList .item .markerbg {
		float: left;
		position: absolute;
		width: 36px;
		height: 37px;
		margin: 10px 0 0 10px;
		background:
			url(${path}/resource/images/marker_number_purple.png)
			no-repeat;
	}
	
	#placesList .item .marker_1 {
		background-position: 0 -10px;
	}
	
	#placesList .item .marker_2 {
		background-position: 0 -56px;
	}
	
	#placesList .item .marker_3 {
		background-position: 0 -102px
	}
	
	#placesList .item .marker_4 {
		background-position: 0 -148px;
	}
	
	#placesList .item .marker_5 {
		background-position: 0 -194px;
	}
	
	#placesList .item .marker_6 {
		background-position: 0 -240px;
	}
	
	#placesList .item .marker_7 {
		background-position: 0 -286px;
	}
	
	#placesList .item .marker_8 {
		background-position: 0 -332px;
	}
	
	#placesList .item .marker_9 {
		background-position: 0 -378px;
	}
	
	#placesList .item .marker_10 {
		background-position: 0 -423px;
	}
	
	#placesList .item .marker_11 {
		background-position: 0 -470px;
	}
	
	#placesList .item .marker_12 {
		background-position: 0 -516px;
	}
	
	#placesList .item .marker_13 {
		background-position: 0 -562px;
	}
	
	#placesList .item .marker_14 {
		background-position: 0 -608px;
	}
	
	#placesList .item .marker_15 {
		background-position: 0 -654px;
	}
	
	#pagination {
		margin: 10px auto;
		text-align: center;
	}
	
	#pagination a {
		display: inline-block;
		margin-right: 10px;
	}
	
	#pagination .on {
		font-weight: bold;
		cursor: default;
		color: #777;
	}
	
	#placesList li h5 {
		font-weight: bold;
	}
	
	<%--
	#favoForm {
		width: 350px;
		height: 200px;
		position: absolute;
		top: 0;
		left: 50%;
		bottom: 0;
		overflow-y: auto;
		z-index: 1;
		margin: 120px 0px 0px 50px;
		padding: 20px 20px 10px 20px;
		background-color: rgba(255, 255, 255, 0.9);
		border-radius: 15px;
		font-size: 12px;
	}
	--%>
	
	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 112px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info2 {width: 286px;height: 100px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info2:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info2 .title {height: 40px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info2 .title2 {padding: 7px 0 0 10px;width: 250px; overflow:hidden; text-overflow:ellipsis;}
    
    .close {position: absolute;top: -140px;right: -130px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .close:hover {cursor: pointer;}
    .info2 .body {position: relative;overflow: hidden;}
    .info2 .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info2 .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info2:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info2 .link {color: #5085BB;}
    
    .info3 {
    	background-color: #fff;
    	padding: 0 5px;
    	border: 2px solid #593196;
    	border-radius: 30px;
   	}
   	
   	#star {
   		width: 25px;
   		height: 25px;
    	background: url('${path}/resource/images/unfavorite.png') no-repeat;
    	background-size: contain;
    	border: 0px;
    	vertical-align: top;
    	margin-right: 5px;
    }
    
    .btn-secondary {
    	width: 127px;
    	height: 42px;
    	border-radius: 5px;
    	margin: 16px 8px;
    }

</style>

<div class="map_wrap">
	<div id="map"></div>
	
	<form:form name="favoForm" id="favoForm" modelAttribute="mapVO" method="post">
		<input type="hidden" name="member_id" id="member_id" value="${sessionScope.member.id}">
	</form:form>
        <%--
	<div id="menu_wrap">
        <div class="option" id="top">
			<form onsubmit="searchPlaces(); return false;">
				
				<div class="form-group">
					<input type="text" class="form-control" id="keyword" placeholder="검색어를 입력해주세요." style="width:220px;float:left;">
				</div> 
				<button type="submit" class="btn btn-primary" style="float:left;margin-left:10px;">Search</button>
			</form>
        </div>
		<div id="content" style="position:absolute;overflow:auto;width:350px;top:75px;">
        	<ul id="placesList"></ul>

        	<div id="pagination"></div>
        </div>
    </div>
		--%>
</div>

<script>
<%--
	//즐겨찾기 등록/해제
	$(document).on("click", "#star", function() {
		var form = document.favoForm;

		var member_id = form.member_id.value;
		var place_name = form.place_name.value;
		var address = form.address.value;
		var lat = form.lat.value;
		var lon = form.lon.value;

		var action = './favoritesCheck';

		$.post(
			action,
			{
				member_id : member_id,
				place_name : place_name,
				address : address,
				lat : lat,
				lon : lon
			},
			function(data) {
				alert(data.msg);
				$("#star").css("background", "url('${path}" + data.background);
				$("#star").css("backgroundSize", data.backgroundSize);
			},
			'json'
		);
	});
--%>
	
	// --지도 시작 현재 위치--
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 2 // 지도의 확대 레벨 
	}; 
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {
	    
	    var lat = position.coords.latitude, // 위도
	        lon = position.coords.longitude; // 경도
	    
	    var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다.

	    map.setCenter(locPosition); // 지도 중심좌표를 접속위치로 변경합니다
	    
	  });
	
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	
	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);  
	
	map.setCenter(locPosition); // 지도 중심좌표를 접속위치로 변경합니다
	
	}

	
	// --즐겨찾기한 장소들 표시하기--
	var markers = []; // 마커를 담을 배열입니다

    var selectedMarker = null; 
    var selectOverlay = null;
    
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다
	$(document).ready(function() {
		var form = document.favoForm;
		var member_id = form.member_id.value;
		var action = './star';
		
		$.post(
			action,
			{
				member_id : member_id
			},
			function(data) {
				
				for (var j = 0; j < data.size; j++) {
					var positions = [
						{
					        content: '<div>' + data.mapDB[j].place_name + '</div>', 
					        latlng: new kakao.maps.LatLng(data.mapDB[j].lat, data.mapDB[j].lon)
						}
					];

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "${path}/resource/images/marker_star.png"; 
				
				for (var i = 0; i < positions.length; i ++) {

					// 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커의 위치
				        image : markerImage // 마커 이미지 
				    });
				
				    // 마커에 표시할 인포윈도우를 생성합니다 
				    var infowindow = new kakao.maps.InfoWindow({
				        content: positions[i].content // 인포윈도우에 표시할 내용
				    });
				
				    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
				    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				}
				
				// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
				function makeOverListener(map, marker, infowindow) {
				    return function() {
				        infowindow.open(map, marker);
				    };
				}
				
				// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
				function makeOutListener(infowindow) {
				    return function() {
				        infowindow.close();
				    };
				}
				}
			},
			'json'
		);
	});

	<%--
	var positions = [
	    {
	        content: '<div>카카오</div>', 
	        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
	    },
	    {
	        content: '<div>생태연못</div>', 
	        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
	    },
	    {
	        content: '<div>텃밭</div>', 
	        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
	    },
	    {
	        content: '<div>근린공원</div>',
	        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
	    }
	];
	
	
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
--%>
</script>
</body>
</html>