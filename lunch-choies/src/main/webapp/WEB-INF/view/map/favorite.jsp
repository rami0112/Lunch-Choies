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
			url(${path}/resource/images/marker_star.png)
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
    	border: 3px solid #efa31d;
    	border-radius: 30px;
   	}
   	
   	#star {
   		width: 25px;
   		height: 25px;
    	background: url('${path}/resource/images/favorite.png') no-repeat;
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
		<input type="hidden" id="place_name" name="place_name">
		<input type="hidden" id="address" name="address">
		<input type="hidden" id="lat" name="lat">
		<input type="hidden" id="lon" name="lon">
	</form:form>
	<div id="menu_wrap">
		<div id="content" style="position:absolute;overflow:auto;width:350px;"<%--top:75px;--%>>
        	<ul id="placesList"></ul>
        	<div id="pagination"></div>
        </div>
    </div>
</div>

<script>
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

	//즐겨찾기 표시
	function favorites() {

		var form = document.favoForm;
	
		var member_id = form.member_id.value;
		var place_name = form.place_name.value;
		var lat = form.lat.value;
		var lon = form.lon.value;

		var action = './favorites';

		$.post(
			action,
			{
				member_id : member_id,
				place_name : place_name,
				lat : lat,
				lon : lon
			},
			function(data) {
				$("#star").css("background", "url('${path}" + data.background);
				$("#star").css("backgroundSize", data.backgroundSize);
			},
			'json'
		);
	}

	//사이즈 맞추기
	$(document).ready(function() {
		resizeContent();
	});
	
	$(window).resize(function() {
		resizeContent();
	});
	
	function resizeContent() {
		var totalHeight = $("#menu_wrap").height();
		<%--var topHeight = $("#top").height();--%>
		$('#content').css({'height':(totalHeight)+'px'});
	}
	
	// --지도 시작 현재 위치--
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 2
	// 지도의 확대 레벨 
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
			if (data.size == 0) {
				var totalHeight = $("#menu_wrap").height();
				$('#menu_wrap').css({'line-height':(totalHeight)+'px'});
				$('#menu_wrap').css('text-align', 'center');
				
				$('#menu_wrap').text('저장한 즐겨찾기가 없습니다.');
			}
			
			if (data.size != 0) 

				var markers = []; // 마커를 담을 배열입니다
			
				var selectedMarker = null;
				var selectOverlay = null;

			 	// 검색 목록과 마커를 표출합니다
				displayPlaces();

				// 페이지 번호를 표출합니다
		        displayPagination(pagination);
		        
		     	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		    	function placesSearchCB(data, status, pagination) {
		    	    if (status === kakao.maps.services.Status.OK) {
		    	
		    	        // 정상적으로 검색이 완료됐으면
		    	        // 검색 목록과 마커를 표출합니다
		    	        displayPlaces(data);
		    	
		    	        // 페이지 번호를 표출합니다
		    	        displayPagination(pagination);
	    	    	}
		    	}
		    	    
				// 검색 결과 목록과 마커를 표출하는 함수입니다
				function displayPlaces() {
				
				    var listEl = document.getElementById('placesList'), 
				    menuEl = document.getElementById('menu_wrap'),
				    fragment = document.createDocumentFragment(), 
				    bounds = new kakao.maps.LatLngBounds(), 
				    listStr = '';
					
					// 검색 결과 목록에 추가된 항목들을 제거합니다
				    removeAllChildNods(listEl);
				    
					// 지도에 표시되고 있는 마커를 제거합니다
				    removeMarker();
	
					for (var i = 0; i < data.size; i++) {
						// 마커를 생성하고 지도에 표시합니다
						var positions = new kakao.maps.LatLng(data.mapDB[i].lat, data.mapDB[i].lon);
						var marker = addMarker(positions);
							itemEl = getListItem();

						function addMarker(positions) {
							var imageSrc = "${path}/resource/images/marker_star.png",
								imageSize = new kakao.maps.Size(24, 35),
		
								markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
							    marker = new kakao.maps.Marker({
								position : positions, // 마커의 위치
								image : markerImage,	// 마커 이미지
								title : data.mapDB[i].place_name,
								options : data.mapDB[i].address
							});
		
							marker.setMap(map); // 지도 위에 마커를 표출합니다
							markers.push(marker);
							
							return marker;
						}

						function getListItem() {
							
						    var el = document.createElement('li'),
						    itemStr = '<span class="markerbg"></span>' +
						                '<div class="info">' +
						                '<h5>' + data.mapDB[i].place_name + '</h5>' +
						                '<span class="jibun gray">' +  data.mapDB[i].address  + '</span>';
						                '</div>';
						
						    el.innerHTML = itemStr;
						    el.className = 'item';
						
						    return el;
						}

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        bounds.extend(positions);
			            
						(function(marker) {

							// 커스텀 오버레이를 생성합니다
					        var customOverlay = new kakao.maps.CustomOverlay({
					            content: '<div class="info3">' + marker.getTitle() + '</div>',
					            position: marker.getPosition(),
					            xAnchor: 0.5, // 컨텐츠의 x 위치
					            yAnchor: 2.5 // 컨텐츠의 y 위치
					        });

					        var customOverlay2 = new kakao.maps.CustomOverlay({
					            position: marker.getPosition(),
					            xAnchor: 0.5, // 컨텐츠의 x 위치
					            yAnchor: 1 // 컨텐츠의 y 위치
					        });
					        
					        var content = document.createElement('div'),
					       		contentStr = '<div class="wrap">' + 
						        	'<div class="info2">' + 
						        		'<div class="title">' +
						        			'<div class="title2">' + 
						        				'<button type="button" id="star">' + '</button>' + marker.getTitle() + 
						        			'</div>' +
						        			'<div>' + 
						        				'<button type="button" class="btn btn-secondary">' + '상세보기' + '</button>' +
						        				'<button type="button" class="btn btn-secondary">' + '리뷰보기' + '</button>' +
						        			'</div>' + 
						        		'</div>' + 
						        	'</div>' +
						        '</div>';
						        content.innerHTML = contentStr;

					        var closeBtn = document.createElement('div'),
								closeStr = '<div class="close">' + '</div>';
				        		closeBtn.innerHTML = closeStr;
					        
					        closeBtn.onclick = function () {
					        	customOverlay2.setMap(null);
					        };
							
					        content.appendChild(closeBtn);
					        customOverlay2.setContent(content);
					        
					     	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
					        function closeOverlay() {
					        	customOverlay2.setMap(null);
					        }							
							
				            kakao.maps.event.addListener(marker, 'mouseover', function() {
			     	        	customOverlay.setMap(map); // 지도에 올린다.
				            });
	
				            kakao.maps.event.addListener(marker, 'mouseout', function() {
				            	customOverlay.setMap(null);
				            });

				            kakao.maps.event.addListener(marker, 'click', function() {
				            	var latlng = marker.getPosition();

			       				var geocoder = new kakao.maps.services.Geocoder();

		         				var coord = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
		         				var callback = function(result, status) {
		         				    if (status === kakao.maps.services.Status.OK) {
		         				    	document.getElementById('address').value = result[0].address.address_name;
		         				    }
		         				};
		         				
		         				geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		         				
				            	document.getElementById('place_name').value = marker.getTitle();
			       				document.getElementById('lat').value = latlng.getLat();
			       				document.getElementById('lon').value = latlng.getLng();
			       				
				            	if (selectOverlay) {
				            		selectOverlay.setMap(null);
				            	}

				            	customOverlay2.setMap(map);
				            	selectOverlay = customOverlay2;
				            });

				            itemEl.onclick = function (idx) {
				            	var latlng = marker.getPosition();

			       				var geocoder = new kakao.maps.services.Geocoder();

		         				var coord = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
		         				var callback = function(result, status) {
		         				    if (status === kakao.maps.services.Status.OK) {
		         				    	document.getElementById('address').value = result[0].address.address_name;
		         				    }
		         				};
		         				
		         				geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		         				
				            	document.getElementById('place_name').value = marker.getTitle();
			       				document.getElementById('lat').value = latlng.getLat();
			       				document.getElementById('lon').value = latlng.getLng();
			       				
				            	if (selectOverlay) {
				            		selectOverlay.setMap(null);
				            	}

				            	customOverlay2.setMap(map);
				            	selectOverlay = customOverlay2;
						    };
					        
						})(marker);
						
						fragment.appendChild(itemEl);

					}
					// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
				    listEl.appendChild(fragment);
				    menuEl.scrollTop = 0;
				
				    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				    map.setBounds(bounds);
				}

				
				// 검색결과 항목을 Element로 반환하는 함수입니다
				<%--function getListItem(index) {
				
				    var el = document.createElement('li'),
				    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
				                '<div class="info">' +
				                '<h5>' + data.mapDB[i].place_name + '</h5>' +
				                '</div>';
				
				    el.innerHTML = itemStr;
				    el.className = 'item';
				
				    return el;
				}--%>

				<%--function addMarker(positions) {
					var imageSrc = "${path}/resource/images/marker_star.png",
						imageSize = new kakao.maps.Size(24, 35),

						markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
					    marker = new kakao.maps.Marker({
						position : positions, // 마커의 위치
						image : markerImage	// 마커 이미지
					});

					marker.setMap(map); // 지도 위에 마커를 표출합니다
					markers.push(marker);
					
					return marker;
				}--%>
				
				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {
				    for ( var i = 0; i < markers.length; i++ ) {
				        markers[i].setMap(null);
				    }   
				    markers = [];
				}

				// 검색결과 목록 하단에 페이지번호를 표시하는 함수입니다
				function displayPagination(pagination) {
				    var paginationEl = document.getElementById('pagination'),
				        fragment = document.createDocumentFragment(),
				        i; 
				
				    // 기존에 추가된 페이지번호를 삭제합니다
				    while (paginationEl.hasChildNodes()) {
				        paginationEl.removeChild (paginationEl.lastChild);
				    }
				
				    for (i=1; i<=pagination.last; i++) {
				        var el = document.createElement('a');
				        el.href = "#";
				        el.innerHTML = i;
				
				        if (i===pagination.current) {
				            el.className = 'on';
				        } else {
				            el.onclick = (function(i) {
				                return function() {
				                    pagination.gotoPage(i);
				                }
				            })(i);
				        }
				
				        fragment.appendChild(el);
				    }
				    paginationEl.appendChild(fragment);
				}

				// 검색결과 목록의 자식 Element를 제거하는 함수입니다
				function removeAllChildNods(el) {   
				    while (el.hasChildNodes()) {
				        el.removeChild (el.lastChild);
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