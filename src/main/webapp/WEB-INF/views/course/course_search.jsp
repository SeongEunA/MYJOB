<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
@font-face {
    font-family: 'Daughter_handwriting';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/naverfont_03@1.0/Daughter_handwriting.woff') format('woff');
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
border:1px solid #F3F0D7;
width:400px;
height:400px;
margin-left:20px;
}

.weatherBox{
border:1px solid #F3F0D7;
width:inherit;
height:inherit;
display:flex;
flex-flow:column wrap;


}

/*  .weatherDiv{
border:1px solid blue;
width:100%;
height:100%;
display:flex;
flex-flow:row wrap;
flex-direction:column;
text-align:center;
}  */
.weatherDay{
border:1px solid #E3E0D7;
width:50%;
height:18%;
border-radius:5px;
display:flex;
flex-direction: row;

}
.weatherDayHeader{
border:1px solid #F3F0D7;
height:100%;
width:20%;
display:flex;
align-items: center;

}
.weatherContent{
border:1px solid #F3F0D7;
width:80%;
height:100%;
flex-direction:row;
display:flex;
align-items: center;

}
.weatherDayNum{
display:block;
border:1px solid #F3F0D7;
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
border:1px solid #F3F0D7;

}
.weatherSkyStatus2{
width:40%;
height:100%;
flex-direction:row;
border:1px solid #F3F0D7;
}

.weatherSkyStatusImg{
border:1px solid #F3F0D7;
width:40%;
height:50%;
margin:0 auto;


}
.weatherSkyStatusImg2{
border:1px solid #F3F0D7;
width:90%;
height:70%;
margin:0 auto;
text-align: center;
}
.weatherSkyStatusText{
border:1px solid #F3F0D7;
flex-direction:column;
width:40%;
height:20%;
font-size:13px;
margin:0 auto;
}
.weatherSkyStatusText2{
border:1px solid #F3F0D7;
flex-direction:column;
width:100%;
height:30%;
margin:0 auto;
font-size:9px;
font-family: 'NanumBarunpen';
text-align: center;
}
.weatherSkyStatusText2 > span{
border:1px solid #F3F0D7;

} 
.weatherTemp{
border:1px solid #F3F0D7;
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
.covidNowBox{
border:1px solid #F3F0D7;
width:500px;
height:400px;
margin-left:100px;
margin-bottom: 5px;
}
.covidNowLayout{
border: 1px solid #F3F0D7;
text-align: center;
font-size: 12px;
background-image: url("/resources/images/koreaMap3.png");
width: 100%;
height:100%;
background-size:contain;
background-repeat: no-repeat;
background-position: center;
}
.covidDetail{
border:1px solid #DCF8FF;
border-radius: 50%;
width: 60px;
display: inline-block;
background-color: white;
background-color: rgba( 220, 248, 255, 0.8 );
padding: 5px 5px;
font-family: 'NanumBarunpen';
}
.stdDay{
text-align: center;
position: relative; top:-15px;
font-size: 15px;
font-family: 'NanumBarunpen';
font-weight: bold;
}
.area{

}
.totalCoronic{
color: #003399;
}
.newCoronic{
color: #FF2424;
}
#검역{position: relative; top: 180px; left: 50px;}
#제주{position: relative; top: 330px;}
#경남{position: relative; top: 240px; left: 90px;}
#경북{position: relative; top: 120px; left: 110px;}
#전남{position: relative; top: 290px; right: 110px;}
#전북{position: relative; top: 180px; right: 180px;}
#충남{position: relative; top: 120px; right: 290px;}
#충북{position: relative; top: 30px; left: 230px;}
#강원{position: relative; bottom: 20px; left: 220px;}
#경기{position: relative; bottom: 30px; left: 90px;}
#세종{position: relative; top: 55px; right: 35px;}
#울산{position: relative; top: 170px; left: 60px;}
#대전{position: relative; top: 80px; right: 95px;}
#광주{position: relative; top: 190px; right: 250px;}
#인천{position: relative; bottom: 60px; left: 20px;}
#대구{position: relative; top: 90px; left: 120px;}
#부산{position: relative; top: 180px; left: 110px;}
#서울{position: relative; bottom: 50px; right: 100px;}
#합계{position: relative; bottom: 80px; right: 330px;}



.weatherHowToContainer{
border:1px solid #F3F0D7;
display:flex;
flex-direction: row;
padding-top:30px;
background-color:#F3F0D7;
border-bottom-left-radius: 20px;
border-bottom-right-radius: 20px;
}
.courseContainer{
border:1px solid white;
width:1700px;
height:auto;
display:flex;
flex-direction: row;
margin: 0 auto;
margin-bottom:100px;

}
.courseHalfLayout:first-child{
border:1px solid white;
width:70%;
height:auto;
max-height:2500px;

}
.courseHalfLayout:last-child{
border:1px solid white;
border-radius:20px;
width:30%;
height:auto;
background-color:#EBF7FF;
margin-left:20px;
}
.map_wrap{
border:2px solid white;
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
border:1px solid #EBF7FF;
height:40px;
width:100%;
font-family: 'KyoboHand';
text-align:center;
}
.submitCourseBtn > span{
border:1px solid #EBF7FF;
height:42px;
display:inline-block;

}
.regCourseBtn{
border:1px solid #BDBDBD;
width:auto;
height:30px;
background-color:white;
border-radius:5px;
}
.regCourseBtn:hover{
border:1px solid #BCE55C;
width:auto;
height:30px;
background-color:#BCE55C;
border-radius:5px;
}
.searchBox{
display:flex;
margin:0 auto;
background-color:#F3F0D7;
padding-top:15px;
border-top-left-radius:20px;
border-top-right-radius:20px;
}
.searchLayout{
border:1px solid #F3F0D7;
border-top-left-radius:20px;
border-top-right-radius:20px;
}

.searchDiv{
border:1px solid #F3F0D7;
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

    border:1px solid #EBF7FF;
    width:90%;
    height:200px;
    display:flex;
    flex-direction: row;
    margin:0 auto;

}
.ticketMainLayout{
	border:0.5px solid #dddddd;
	width:100%;
	height:80%;
	display:flex;
	flex-direction: row;
	margin-top:4%;
	box-shadow: 2px 2.5px 4px gray;
}
.ticketLayout1{

    border:1px solid #EBF7FF;
    border-right:1px solid #EBF7FF;
    width:70%;
    height:100%;
   	position:relative;
   	background-color:white;

}
.ticketLayout2{

    border:1px solid #EBF7FF;
    border-left:1px dotted black;
    width:30%;
    height:100%;
    position:relative;
    font-family: 'KyoboHand';
    text-align:center;
    background-color:white;
    
}
.ticketLayout2 > span{
	border:1px solid white;
	display:inline-block;
	margin:0 auto;
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
    border:1px solid #FFEBFE;
    background-color:#FFEBFE;
    width:90%;
    height:100%;
    font-family: 'KyoboHand';
    margin: 0 auto;
}
.ticketBlock2{
	 border:1px solid #FCFFA6;
    background-color: #FCFFA6;
    width:90%;
    height:100%;
    font-family: 'KyoboHand';
    margin: 0 auto;
}
.ticketBlock3{
	 border:1px solid #C1FFD7;
    background-color: #C1FFD7;
    width:90%;
    height:100%;
    font-family: 'KyoboHand';
    margin: 0 auto;
}
.travelTicket{
	border:none;
	position:absolute;
	bottom:0;
	font-size:27px;
	font-family: 'SBAggroB';
	letter-spacing: -1px;
	margin-left:5px;
	color:#333333;
	text-shadow: 4px 2px 0 #fffdff; 
}

.custom-kontakt .barcode-box { 
  border:1px solid #EBF7FF;
  width:90px;
  min-width: 89px; 
  height: 27px; 
  padding-right: 5px;
  margin-left:20px;
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

.placeLayout{
border:1px solid #fff9a3;
width:500px;
height:150px;
background-color:#fff9a3;
box-shadow: 2px 2px 4px gray;
font-family: 'Daughter_handwriting';
font-weight:bold;
font-size:20px;
letter-spacing: 1px;
margin-top:20px;
margin-left:20px;

}

.placeLayout span{
border-bottom:1px solid #F15F5F;
padding:5px; 5px;
display:block;
width:80%;
margin-left:20px;
}

.placeLayout > ul > li{
border:none;
display:inline-block;
width:auto;
height:100%;
cursor:pointer;
position:relative;
margin-top:10px;
}

.placeLayout > ul > li:hover{
border:1px solid #FFC19E;
background-color:#FFC19E;
opacity: 90%;
border-radius:10px;
}
.placeListOrder{
border:1px solid white;
height:880px;
display:flex;
flex-flow:column wrap;
margin:0 auto;
}
.placeListContainer{
border:1px solid white;
height:auto;
}
.pageBtn{
width: 50%;
margin: 0 auto;
text-align: center;
padding-right: 25px;
}
.pageBtn ul > li{
/* display:inline-block; */
width:30px;
height:30px;
cursor:pointer;
/* position:relative; */
/* margin: 0 auto; */
margin-top:10px;
text-align: center;
/* border: 1px solid #e0e0e0; */
line-height: 28px;
} 
.activePage, .pageBtn ul > li:hover{
border: 1px solid #b0b0b0;
color: #FFBB00;
}
.disabled {
pointer-events:none;
opacity:0.6;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	3d45ea450bf493fb0fea992bed62c07e&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d45ea450bf493fb0fea992bed62c07e&libraries=services"></script>
</head>
<body>
<!-- 검색 영역 -->
<div class="courseContainer">
	<div class="courseHalfLayout">
		<div>
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
<div class="weatherHowToContainer col-12">
	<div class="weatherContainer" id="weatherArea">
	<div class="weatherBox" id="weatherBox">
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
							<c:set var ="skyStatus" value="${totalWeatherVO.skyStatus}"></c:set>
							<c:if test="${fn:contains(skyStatus,'맑음')}">
								<span><img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt1.svg" width="80%" height="100%"></span>
							</c:if>
							<c:if test="${totalWeatherVO.skyStatus eq '구름많음' or totalWeatherVO.skyStatus eq '흐림'}">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt5.svg" width="80%" height="100%">
							</c:if>
							<c:if test="${fn:contains(skyStatus,'비')}">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">
							</c:if>
							<c:if test="${fn:contains(skyStatus,'눈')}">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt13.svg" width="80%" height="100%">
							</c:if>
						</div>
						<div class="weatherSkyStatusText2">
							<span>${totalWeatherVO.skyStatus }</span>
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
						<c:set var ="skyStatusAm" value="${totalWeatherVO.skyStatusAm}"></c:set>
						<c:if test="${totalWeatherVO.skyStatusAm eq '맑음' }">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt1.svg" width="80%" height="100%">
						</c:if>
						<c:if test="${totalWeatherVO.skyStatusAm eq '구름많음' or totalWeatherVO.skyStatusAm eq '흐림'}">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt5.svg" width="80%" height="100%">
						</c:if>
						<c:if test="${fn:contains(skyStatusAm,'비')}">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">
						</c:if>
						<c:if test="${fn:contains(skyStatusAm,'눈')}">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt13.svg" width="80%" height="100%">
						</c:if>
						</div>
						<div class="weatherSkyStatusText2">
							<span>${totalWeatherVO.skyStatusAm }</span>
						</div>					
					</div>
					<div class="weatherSkyStatus2">
						<div class="weatherSkyStatusImg2">
						<c:set var ="skyStatusPm" value="${totalWeatherVO.skyStatusPm}"></c:set>
							<c:if test="${totalWeatherVO.skyStatusPm eq '맑음'}">
								<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt1.svg" width="80%" height="100%">
							</c:if>
							<c:if test="${totalWeatherVO.skyStatusPm eq '구름많음' or totalWeatherVO.skyStatusPm eq '흐림' }">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt7.svg" width="80%" height="100%">
							</c:if>
							<c:if test="${fn:contains(skyStatusPm,'비')}">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">
							</c:if>
							<c:if test="${fn:contains(skyStatusPm,'눈')}">
							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt13.svg" width="80%" height="100%">
							</c:if>
						</div>
						<div class="weatherSkyStatusText2">
							<span>${totalWeatherVO.skyStatusPm}</span>
						</div>
					</div>
					<div class="weatherTemp">
						<span>${totalWeatherVO.minTemp }&deg;</span>/${totalWeatherVO.maxTemp }&deg;
					</div>
				</div>
				</c:if>
			</div><!-- weatherDay -->
			</c:if>
			</c:forEach>
	</div><!-- weatherBox -->
</div><!--weatherContainer-->

			<div class="covidNowBox">
				<div class="covidNowLayout">
					<div class="stdDay">${covid19List[0].stdDay } 기준 지역별 확진자 현황</div>
					<c:forEach items="${covid19List }" var="covid19Info">
						<div class="covidDetail" id="${covid19Info.gubun }">
							<div class="area">${covid19Info.gubun }</div>
							<div class="totalCoronic">${covid19Info.defCnt }</div>
							<div class="newCoronic">↑${covid19Info.incDec }</div>
						</div>
					</c:forEach>
				</div>
			</div>	
</div><!-- weatherHowToContainer -->
	
	
	<!-- 지도영역 -->
		<div class="map_wrap" id="map_warp">
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
<script type="text/javascript"src="/resources/course/js/course_search.js?ver=25"></script>
		
		<div class="col-12 placeListContainer">
		   <div class="col-11 placeListOrder" id="placeList"><!--장소리스트 나오는곳 -->
		   </div>
		   <div class="pageBtnLayout" id="pageBtnLayout"></div>
		</div><!-- placeListContainer -->
	</div><!-- courseHalfLayout -->
	<div class="courseHalfLayout">
		<form id="regCourseForm" method="post">
			<div id="resInfoList" class="resInfoList">
			</div><!-- resInfoList -->
			<div class="submitCourseBtn"  id="submitCourse">
				<span>코스이름 입력:<input type="text" name="courseName" id="courseName">
				<input type="hidden" id="memberId" value="${sessionScope.loginInfo.memberId }">
				<input type="button" value="코스등록" id="regCourseBtn" class="regCourseBtn"></span>
			</div> 
		</form>
	</div><!-- courseHalfLayout -->
</div><!-- courseContainer -->

</body>
</html>