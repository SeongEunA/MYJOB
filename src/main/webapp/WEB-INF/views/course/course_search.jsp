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
min-width: 600px;
width:auto;
border: 2px solid transparent;
margin-top: 20px;
min-height:40px;
margin-left:20px;
background-image: linear-gradient(#fff, #fff), linear-gradient(to right, red 0%, orange 100%);
background-origin: border-box;
background-clip: content-box, border-box;
border-radius:5px;
}

.placeName{
cursor: pointer;
}
.weatherContainer{
border:1px solid black;
width:200px;
height:360px;
margin-top:30px;
}

.weatherBox{
border:1px solid white;
width:200px;
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
.searchBox{
border:1px solid black;
display:flex;
margin:0 auto;
}
.searchLayout{
border:1px solid orange;
}

.searchDiv{
border:1px solid black;
margin:0 20px;
}

.searchBtn{

width:70%;
height:100%;
border: 3px solid #1F50B5;
border-radius: 5px;
color: #fff;
background:#1F50B5;
text-transform: uppercase;
font-size: 1em;
line-height: 1.7em;
font-weight: bold;
letter-spacing: .1em;
font-family: "Roboto Condensed", sans-serif;
cursor: pointer;
transition: all .5s;
text-align:center;
box-shadow:inset 0 0 0 0 gray;

}
.searchBtn:hover{
box-shadow:inset -15em 0 0 0 #fff;
color: #1F50B5;
}
@import url('https://fonts.googleapis.com/css?family=Quicksand');
@font-face {
    font-family: 'KyoboHand';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/KyoboHand.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'SBAggroB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.ticketContainer{

    border:1px solid white;
    width:90%;
    height:200px;
    display:flex;
    flex-direction: row;
    margin:0 auto;

}
.ticketLayout1{

    border:1px solid black;
    border-right:1px solid white;
    width:65%;
    height:80%;
    margin-top:4%;
   	position:relative;

}
.ticketLayout2{

    border:1px solid black;
    border-left:1px dotted black;
    width:28%;
    height:80%;
    position:relative;
    font-family: 'KyoboHand';
    margin-top:4%;
    
}
.ticketLayout2 > span{
	border:1px solid white;
	display:inline-block;
	margin-top:16px;
}

.ticketMark{
	border:1px solid white;
	width:50px;
	height:50px;
	margin:0 auto;
	margin-top:5px;
}
.ticketDiv{
	border:1px solid white;
	width:100%;
	height:80%;
	position: relative;
    top: 16px;
    
}
.ticketBlock{
    border:1px solid #B5B2FF;
    background-color:#B5B2FF;
    width:90%;
    height:100%;
    font-family: 'KyoboHand';
    margin: 0 auto;
}
.travelTicket{
	border:none;
	position:absolute;
	bottom:0;
	font-size:30px;
	font-family: 'SBAggroB';
	letter-spacing: -1px;
	margin-left:5px;
	color:#333333;
	text-shadow: 4px 2px 0 white;
}

.custom-kontakt .barcode-box { 
  border:1px solid white;
  width:90px;
  min-width: 90px; 
  height: 27px; 
  padding-right: 5px;
  margin-left:10px; 
  margin-right:auto; 
  position:absolute;
  bottom:0;
}
.custom-kontakt .barcode-box .barcode-stripes .stripe-1 { 
  display: block; 
  height: 27px; 
  width: 3px; 
  float: left; 
  border-right: thin solid #333;
  border-left: thin solid #333; 
  border-top-color: #fff; 
  border-bottom-color: #fff; 
  
}
.custom-kontakt .barcode-box .barcode-stripes .stripe-2 { 
  display: block; 
  height: 26px; 
  width: 5px; 
  float: left; 
  margin-left: 1px; 
  margin-right: 1px; 
  border-right: thick solid #333;
  border-left: thick solid #333; 
  border-top-color: #fff; 
  border-bottom-color: #fff; 
}
.custom-kontakt .barcode-box .barcode-stripes .stripe-3 { 
  display: block; 
  height: 26px; 
  width: 5px; 
  float: left; 
  margin-left: 1px; 
  margin-right: 1px; 
  border-right: thick solid #333;
  border-left: thin solid #333; 
}
.custom-kontakt .barcode-box .barcode-stripes span.sig1, .custom-kontakt .barcode-box .barcode-stripes span.sig2, .custom-kontakt .barcode-box .barcode-stripes span.sig3, .custom-kontakt .barcode-box .barcode-stripes span.sig4, .custom-kontakt .barcode-box .barcode-stripes span.sig5, .custom-kontakt .barcode-box .barcode-stripes span.sig6, .custom-kontakt .barcode-box .barcode-stripes span.sig7, .custom-kontakt .barcode-box .barcode-stripes span.sig8, .custom-kontakt .barcode-box .barcode-stripes span.sig9 { 
  color: #000; 
  font-size: 12px;
  font-family:'Quicksand', sans-serif;
  float: left; 
  margin-top: -10px;
}
.custom-kontakt .barcode-box .barcode-stripes span.sig1 { 
  margin-right: 20px; 
  margin-left: 7px; 
}
.custom-kontakt .barcode-box .barcode-stripes span.sig2 { 
  margin-right: 20px; 
  margin-left: 7px; 
}
.custom-kontakt .barcode-box .barcode-stripes span.sig3 { 
  margin-right: 13px; 
  margin-left: 5px; 
}
.custom-kontakt .barcode-box .barcode-stripes span.sig4 { 
  margin-right: 5px; 
}
.custom-kontakt .barcode-box .barcode-stripes span.sig5 { 
  margin-right: 15px; 
  margin-left: 5px; 
}
.custom-kontakt .barcode-box .barcode-stripes span.sig6 { 
  margin-right: 15px; 
  margin-left: 2px; 
}
.custom-kontakt .barcode-box .barcode-stripes span.sig7 { 
  margin-right: 15px; 
  margin-left: 10px; 
}
.custom-kontakt .barcode-box .barcode-stripes span.sig8 { 
  margin-right: 15px; 
  margin-left: 5px; 
}
.custom-kontakt .barcode-box .barcode-stripes span.sig9 { 
  margin-left: 12px; 
}
.resultPlaceName{
    font-family: 'KyoboHand';
	border:none;
	position:relative;
	padding: 5px; 5px;
}
.resultPlaceAddr,.resultTel{
	border:none;
	padding: 5px; 5px;
}

.close {
	border:none;
	position:absolute;
	right:0;
	display:inline-block;
	width:20px;
	height:100%;
	text-align:right;
	margin-right:10px;
	cursor:pointer;
}


.close1:after {content: "\00d7"; font-size:18pt;}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	3d45ea450bf493fb0fea992bed62c07e&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d45ea450bf493fb0fea992bed62c07e&libraries=services"></script>
</head>
<body>
<!-- 검색 영역 -->
<div class="courseContainer">
	<div class="courseHalfLayout">
		<div class="row">
			<div class="searchLayout col-12">
				<div class="searchBox col-12">
					<div class="col-2 searchDiv">
						<select class="form-select" aria-label="Default select example" id="highLocation" name="locationLandCode">
							<option selected>지역</option>
							<c:forEach items="${highLocationList }" var="highLocationInfo">
								<option value="${highLocationInfo.locationLandCode }">${highLocationInfo.highLocationName }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-2 searchDiv">
						<select class="form-select" aria-label="Default select example" id="lowLocation" name="locationTempCode">
							<option selected>하위지역</option>
						</select>
					</div>
					<div class="col-2 searchDiv">
						<select class="form-select" aria-label="Default select example" id="cateCode">
							<option value="CATE_001">숙박</option>
							<option value="CATE_002">관광지</option>
						</select>
					</div>
					<div class="col-2 searchDiv">
						<div class="searchBtn" onclick="clickSearch(1);" id="clickSearch">검색</div>
					</div>
				</div><!-- searchBox -->
			</div><!-- searchLayout -->
		</div><!-- row -->
	
<!-- 날씨영역 -->
<!-- 날씨영역 -->
<!-- 은아 10/23 테이블 작업 -->
	<div class="weatherContainer" id="weatherArea">
	<div class="weatherBox" id="weatherBox">
		<div class="weatherDiv">
		<c:forEach items="${weatherList}" var="totalWeatherVO" varStatus="cnt">
		<c:if test="${cnt.count <= 10 }">
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
				<c:if test="${cnt.count >= 4 and cnt.count <= 10}">
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
			</c:if>
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
<script type="text/javascript"src="/resources/course/js/course_search.js?ver=10"></script>
		<div class="row">
		   <div class="col-6" id="placeList">
		   </div>
		</div>
	</div><!-- courseHalfLayout -->
	<div class="courseHalfLayout">
		<form id="regCourseForm" method="post">
		 <div id="resInfoList" class="resInfoList">
		   	 <div class="ticketContainer"><!-- 티켓부분 -->
        <div class="ticketLayout1">
			<div class="ticketDiv">
				<div class="ticketBlock">
					<div class="resultPlaceName">
										장소:이거이거
						<div class="close close1" id="deleteResBtn"></div>
					</div>
						<div class="resultPlaceAddr">주소:여기</div>
						<div class="resultTel" class="resultPlaceTel">Tel:000-0000</div>
						<div class="travelTicket">Travel Ticket</div>
				</div>
			</div>
		</div>
        <div class="ticketLayout2">
               	<span>숙박지,관광지,맛집구분하기</span>
               	<div class="ticketMark">
               		<img src="/resources/images/free-icon-aeroplane-5639813.png"width="100%" height="100%">
               	</div>
            <section class="custom-kontakt">
                <div class="barcode-box">
                 <div class="barcode-stripes"><span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-3"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-1"></span> <span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-1"></span><span class="stripe-1"></span><span class="sig5"></span> <span class="sig6"></span> <span class="sig7"></span></div>
                </div>
              </section>
        </div>
    </div><!-- 티켓끝 -->
		 <div class="ticketContainer"><!-- 티켓부분 -->
        <div class="ticketLayout1">
			<div class="ticketDiv">
				<div class="ticketBlock">
					<div class="resultPlaceName">
										장소:이거이거
						<div class="close close1" id="deleteResBtn"></div>
					</div>
						<div class="resultPlaceAddr">주소:여기</div>
						<div class="resultTel" class="resultPlaceTel">Tel:000-0000</div>
						<div class="travelTicket">Travel Ticket</div>
				</div>
			</div>
		</div>
        <div class="ticketLayout2">
               	<span>숙박지,관광지,맛집구분하기</span>
               	<div class="ticketMark">
               		<img src="/resources/images/free-icon-aeroplane-5639813.png"width="100%" height="100%">
               	</div>
            <section class="custom-kontakt">
                <div class="barcode-box">
                 
                  <div class="barcode-stripes"><span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-3"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-1"></span> <span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-1"></span><span class="stripe-1"></span><span class="sig5"></span> <span class="sig6"></span> <span class="sig7"></span></div>
                </div>
              </section>
        </div>
    </div><!-- 티켓끝 -->
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