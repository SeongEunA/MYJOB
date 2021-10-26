<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="/resources/course/css/course_search.css">
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<style>
@font-face {
    font-family: 'NanumBarunpen';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumBarunpen.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
/* 장소목록 관련 style 적용 */
.placeInfo{
width: 900px;
border: 1px solid gray;
margin-top: 20px;
}

.placeName{
cursor: pointer;
}
.weatherContainer{
border:1px solid white;
width:200px;
height:400px;
display:flex;
flex-direction:row;
}

.weatherBox{
border:1px solid white;
width:400px;
height:400px;
display:flex;
}

 .weatherDiv{
border:1px solid white;
width:100%;
height:100%;
display:flex;
flex-flow:row wrap;
flex-direction:column;
text-align:center;
} 
.weatherDay{
border:1px solid #eeeeee;
width:100%;
height:15%;
border-radius:5px;
display:flex;


}
.weatherDayHeader{
border:1px solid white;
height:100%;
width:20%;
display:flex;
align-items: center;

}
.weatherContent{
border:1px solid white;
width:80%;
height:100%;
flex-direction:row;
display:flex;
align-items: center;

}
.weatherDayNum{
display:block;
border:1px solid white;
width:100%;
height:60%;
font-size:12px;

} 
.weatherDayNum > div{
color:#303030;
margin-top:10px;
font-family: 'NanumBarunpen';
font-size:13px;
font-weight:600;
}

.weatherSkyStatus{
width:60%;
height:100%;
flex-direction:row;
border:1px solid white;

}
.weatherSkyStatus2{
width:40%;
height:100%;
flex-direction:row;
border:1px solid white;


}
.weatherSkyStatusImg{
border:1px solid white;
width:40%;
height:50%;
margin:0 auto;


}
.weatherSkyStatusImg2{
border:1px solid white;
width:90%;
height:70%;
margin:0 auto;
border-radius: 50%;
}
.weatherSkyStatusText{
border:1px solid white;
flex-direction:column;
width:40%;
height:20%;
font-size:13px;
margin:0 auto;
}
.weatherSkyStatusText2{
border:1px solid white;
flex-direction:column;
width:100%;
height:30%;
margin:0 auto;
font-size:9px;
font-family: 'NanumBarunpen';
}
.weatherTemp{
border:1px solid white;
width:35%;
height:40%;
font-size:13px;
color:#dc0100;

margin-right:5px;
margin-top:5px;
}
.weatherTemp > span{
font-size:12px;
color:#2a74f8;
}

.courseContainer{
border:1px solid black;
width:1700px;
height:auto;
display:flex;
flex-direction: row;
}
.courseHalfLayout:first-child{
border:1px solid blue;
width:70%;
height:auto;


}
.courseHalfLayout:last-child{
border:1px solid blue;
width:30%;
height:auto;


}
.map_wrap{
border:2px solid pink;
width:100%;
height:800px;
}
.resInfoDiv{
border:1px solid #eeeeee;
border-radius:10px;
width:400px;
height:100px;

}
.submitCourseBtn{
visibility: hidden;
}
</style>
<script type="text/javascript"src="/resources/course/js/course_search.js?ver=1"></script>
</head>
<body>
<!-- 검색 영역 -->
<div class="courseContainer">
	<div class="courseHalfLayout">
	<div class="row">
		<div class="col-2">
			<select class="form-select" aria-label="Default select example" id="highLocation" name="locationLandCode">
				<option selected>지역</option>
				<c:forEach items="${highLocationList }" var="highLocationInfo">
					<option value="${highLocationInfo.locationLandCode }">${highLocationInfo.highLocationName }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-2">
			<select class="form-select" aria-label="Default select example" id="lowLocation" name="locationTempCode">
				<option selected>하위지역</option>
			</select>
		</div>
		<div class="col-2">
			<select class="form-select" aria-label="Default select example" id="cateCode">
				<option value="CATE_001">숙박</option>
				<option value="CATE_002">관광지</option>
			</select>
		</div>
		<div class="col-2">
			<input type="button" value="검색" onclick="clickSearch();" id="clickSearch">
		</div>
	</div>
	
<!-- 날씨영역 -->
<!-- 날씨영역 -->
<!-- 은아 10/23 테이블 작업 -->
	<div class="weatherContainer" id="weatherArea">
	<div class="weatherBox" id="weatherBox">
		<div class="weatherDiv">
		<c:forEach items="${weatherList}" var="totalWeatherVO" varStatus="cnt">
			<div class="weatherDay">
				<div class="weatherDayHeader">
					<div class="weatherDayNum">
						<div>${totalWeatherVO.date}</div>
					</div>	
						
				</div>
				<c:if test="${cnt.count < 4}">
				<div class="weatherContent">
					<div class="weatherSkyStatus2">
						<div class="weatherSkyStatusImg2">
							<c:if test="${totalWeatherVO.skyStatus eq '맑음' }">
								<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt1.svg" width="80%" height="100%">
							</c:if>
							<c:if test="${totalWeatherVO.skyStatus eq '구름많음' or totalWeatherVO.skyStatus eq '흐림'}">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt5.svg" width="80%" height="100%">
							</c:if>
							<c:if test="${totalWeatherVO.skyStatus eq '흐리고 비' or totalWeatherVO.skyStatus eq '비' }">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">
							</c:if>
						</div>
						<div class="weatherSkyStatusText2">
							${totalWeatherVO.skyStatus }
						</div>
					</div>
					<div class="weatherTemp">
							${totalWeatherVO.temp }&deg;
					</div>
				</div>
				</c:if>
				<c:if test="${cnt.count >= 4}">
				<div class="weatherContent">
					<div class="weatherSkyStatus2">
						<div class="weatherSkyStatusImg2">
						<c:if test="${totalWeatherVO.skyStatusAm eq '맑음' }">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt1.svg" width="80%" height="100%">
						</c:if>
						<c:if test="${totalWeatherVO.skyStatusAm eq '구름많음' or totalWeatherVO.skyStatusAm eq '흐림'}">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt5.svg" width="80%" height="100%">
						</c:if>
						<c:if test="${totalWeatherVO.skyStatusAm eq '흐리고 비' or totalWeatherVO.skyStatusAm eq '비' }">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">
							</c:if>
						</div>
						<div class="weatherSkyStatusText2">
							${totalWeatherVO.skyStatusAm }
						</div>					
					</div>
					<div class="weatherSkyStatus2">
						<div class="weatherSkyStatusImg2">
							<c:if test="${totalWeatherVO.skyStatusPm eq '맑음'}">
								<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt1.svg" width="80%" height="100%">
							</c:if>
							<c:if test="${totalWeatherVO.skyStatusPm eq '구름많음' or totalWeatherVO.skyStatusPm eq '흐림' }">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt7.svg" width="80%" height="100%">
							</c:if>
							<c:if test="${totalWeatherVO.skyStatusPm eq '흐리고 비' or totalWeatherVO.skyStatusPm eq '비' }">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">
							</c:if>
						</div>
						<div class="weatherSkyStatusText2">
							${totalWeatherVO.skyStatusPm}
						</div>
					</div>
					<div class="weatherTemp">
						<span>${totalWeatherVO.minTemp }&deg;</span>/${totalWeatherVO.maxTemp }&deg;
					</div>
				</div>
				</c:if>
			</div>
			</c:forEach>
		</div><!-- weatherDiv1 -->
		
	
	</div>


</div><!--weatherContainer-->
				
				
	
	
<!-- 지도영역 -->

	<div class="map_wrap">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <div>
	                <form onsubmit="searchPlaces(); return false;" id="keywordForm">
	                    키워드 : <input type="text" value="맛집" id="keyword" size="15"> 
	                    <button type="submit">검색하기</button> 
	                </form>
	            </div>
	        </div>
	        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
	    </div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d45ea450bf493fb0fea992bed62c07e&libraries=services"></script>
	<script type="text/javascript">
	// 마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

	    var keyword = document.getElementById('keyword').value;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }

	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);

	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);

	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

	        alert('검색 결과가 존재하지 않습니다.');
	        return;

	    } else if (status === kakao.maps.services.Status.ERROR) {

	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;

	    }
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {

	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);

	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });

	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });

	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };

	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);

	        fragment.appendChild(itemEl);
	    }

	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

		var el = document.createElement('li'),
	       itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                   '<div class="info">' +
	                   '   <h5 id="resName" name="resName">' + places.place_name + '</h5>';

	       if (places.road_address_name) {
	           itemStr += '    <span name="resAddr">' + places.road_address_name + '</span>';
	       } else {
	           itemStr += '    <span name="resAddr">' +  places.address_name  + '</span>'; 
	       }
	                    
	         itemStr += '  <span class="tel" name="resTel">' + places.phone  + '</span>' +
	                   '</div>';           

	       el.innerHTML = itemStr;
	       el.className = 'item';

	       return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
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

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}

	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	 //지도 내의 주소목록의 주소이름을 클릭했을때 호출되는 함수입니다.
	 function saveAddress(road_address_name,place_name,phone){

			 var el = document.createElement('li'),
			    itemStr = 
			                '<div class="info">' +
			                '   <h5>' + place_name + '</h5>';

			    if (places.road_address_name) {
			        itemStr += '    <span>' + road_address_name + '</span>';
			                    
			    } 
			                 
			      itemStr += '  <span class="tel">' + phone  + '</span>' +
			                '</div>';
			 
			 $('#resInfoDiv').append(itemStr);
		
		
		 
		 
	 }
	</script>

<!-- 검색 장소 리스트 영역 -->

<div class="row">
   <div class="col-6" id="placeList">
   </div>
  
</div>
</div><!-- courseHalfLayout -->
<div class="courseHalfLayout">
<form action="/course/regCourse" method="post">
 <div id="resInfoList" class="resInfoList">
   
  </div>
 <div class="submitCourseBtn"  id="submitCourse">
 	코스이름 입력:<input type="text" name="courseName" id="courseName">
  <input type="submit" value="코스등록하러가기">
  </div> 
</form>
</div><!-- courseHalfLayout -->
</div><!-- courseContainer -->
</body>
</html>