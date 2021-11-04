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
margin: 0 auto;
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	3d45ea450bf493fb0fea992bed62c07e&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d45ea450bf493fb0fea992bed62c07e&libraries=services"></script>
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
				<input type="button" value="검색" onclick="clickSearch(1);" id="clickSearch">
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
							<c:if test="${totalWeatherVO.skyStatus eq '흐리고 비' or totalWeatherVO.skyStatus eq '비' or totalWeatherVO.skyStatus eq '구름많고 비' or totalWeatherVO.skyStatus eq '구름많고 한때 비' }">
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
						<c:if test="${totalWeatherVO.skyStatusAm eq '흐리고 비' or totalWeatherVO.skyStatusAm eq '비' or totalWeatherVO.skyStatusAm eq '구름많고 비' or totalWeatherVO.skyStatusAm eq '구름많고 한때 비' }">
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
							<c:if test="${totalWeatherVO.skyStatusPm eq '흐리고 비' or totalWeatherVO.skyStatusPm eq '비' or totalWeatherVO.skyStatusPm eq '구름많고 비' or totalWeatherVO.skyStatusPm eq '구름많고 한때 비' }">
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
	
	<!-- 검색 장소 리스트 영역 -->
<script type="text/javascript"src="/resources/course/js/course_search.js?ver=8"></script>
		<div class="row">
		   <div class="col-6" id="placeList">
		   </div>
		</div>
	</div><!-- courseHalfLayout -->
	<div class="courseHalfLayout">
		<form id="regCourseForm" method="post">
		 <div id="resInfoList" class="resInfoList">
		   
		  </div>
		 <div class="submitCourseBtn"  id="submitCourse">
		 	코스이름 입력:<input type="text" name="courseName" id="courseName">
		  <input type="hidden" id="memberId" value="${sessionScope.loginInfo.memberId }">
		  <input type="button" value="코스등록하러가기" id="regCourseBtn">
		  </div> 
		</form>
	</div><!-- courseHalfLayout -->
</div><!-- courseContainer -->
</body>
</html>