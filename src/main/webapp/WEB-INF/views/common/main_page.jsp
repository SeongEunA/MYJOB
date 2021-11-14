<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script src="/resources/common/js/main_page.js"></script>


<style type="text/css">
@font-face {
    font-family: 'Cafe24Oneprettynight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Mini_handwriting';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/naverfont_08@1.0/Mini_handwriting.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.mainPhotoContainer{
border:1px solid white;
width:auto;
height:400px;
}
.mainPhoto{
border:1px solid white;
height:100%;
margin:0 auto;
position:relative;
overflow: hidden;
}
.photoText1{
position:absolute;
top:60%;
color:white;
margin-left:20px;

}
.bxslider > li > img {
width:1800px;
height:500px;
}
.bxslider > li > .photoText1 > h1{
opacity: 1;
transform: translateY(0);
transition: 0.8s;
transition-delay: .7s;
color:white;
}
.tagContainer{
border:1px solid white;
height:160px;
margin:0 auto;
}
.tagLayout{
border:1px solid white;
height:50px;
margin-top:20px;
}
.tagLayout > .tag-li-container >ul >li{
width:auto;
border:1px solid #A6A6A6;
border-radius: 5px;
padding:10px 20px;
color:#A6A6A6;
margin-left:10px;
margin-right:10px;
cursor: pointer;
}
.tagLayout > .tag-li-container >ul >li:hover{
width:auto;
border:1px solid #D5D5D5;
border-radius: 5px;
padding:10px 20px;
color:#D5D5D5;
margin-left:10px;
margin-right:10px;
cursor: pointer;
}
.tag-li-container{
border:1px solid white;
height:100%;
margin:0 auto;
text-align:center;
}
.mainReviewContainer{
border:1px solid #EBF7FF;
height:400px;
text-align: center;
background-color:#EBF7FF;
}
.mainReviewLayout{
border:1px solid #EBF7FF;
height:100%;
margin:0 auto;
text-align:center;
}
.mainReviewDiv{
border:1px solid #EBF7FF;
height:80%;
margin-top:35px;
display:inline-block;
border-radius:10px;
background-color:white;
width:280px;
margin-left:5px;
margin-right:5px;

}
.mainReviewPhoto{
border:1px solid #EBF7FF;
border-top-left-radius:10px;
border-top-right-radius:10px;
height:80%;
}
.mainReviewText{
border:1px solid #EBF7FF;
border-bottom-left-radius:10px;
border-bottom-right-radius:10px;
width:100%;
height:20%;

}
.mainReviewText > span {
border:1px solid white;
display:inline-block;
width:90%;
height:30px;
font-family: 'Mini_handwriting';
font-weight:bold;
font-size:28px;
overflow:hidden;
text-overflow:ellipsis;
white-space:nowrap;
margin:0 auto;
}


.noticeEventContainer{
border:1px solid white;
height:500px;
text-align: center;
margin-top:100px;
}
.noticeEventLayout{
border:1px solid white;
height:100%;
margin:0 auto;
display:flex;
flex-direction:row;
}
.eventBannerLayout{
border:1px solid white;
height:50%;
display:flex;
flex-direction:row;
}
.noticeBoardLayout{
border:1px solid white;
height:50%;
}

.noticeEventDiv{
border:1px solid white;
height:100%;

}

.noticeBanner{
border:1px solid white;
background-color:white;
height:50%;
display:flex;
flex-direction:row;
}

.eventDiv{
border:1px solid white;
cursor:pointer;
}
.healingTripContainer{
border:1px solid white;
height:100%;
margin:0 auto;
display:flex;
flex-direction:column;

}

.healingTripLayout{
border:1px solid white;
height:100%;
display:flex;
flex-direction: row;
}
.healingTripDiv{
border:1px solid #e6e6e6;
border-radius:5px;
margin:0 auto;
height:80%;
}
.healingTripDivPhoto{
border:1px solid white;
border-radius:5px;
width:83%;
height:90%;
margin:0 auto;
margin-top:7%;
position:relative;
}
.healingTripDivPhotoText{
color:white;
position:absolute;
margin-top:10%;
z-index:9;
text-align:left;
padding: 2px 15px;
}
.healingTitle{
border:1px solid red;
width:100%;
height:30px;
}
.healingImg{
border-radius:5px;
width:100%;
height:100%;
filter: brightness(70%);
}
.bannerBox{
border:1px solid black;
height:90px;
}
.noticeTable{
border:1px solid #BDBDBD;
width:100%;
height:100%;
font-family: 'Cafe24Oneprettynight';
}
.noticeTable > thead{
border:1px solid #F29661;
background-color:#F29661;
color:#747474;
height:15%;
font-weight:bold;
}
.noticeTable > thead > tr >td{
vertical-align: middle;
}

.noticeTable > tbody > tr{
border-bottom:1px solid #BDBDBD;
vertical-align: middle;
padding-top:10px;

}
.noticeTable > tbody > tr > td{
border-bottom:1px solid #BDBDBD;
vertical-align: middle;
padding-top:5px;
}
.bannerStyle{
border-radius:10px;
width:100%;
height:100%;
}

</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-12">
		<div class="mainPhotoContainer">
			<div class="mainPhoto col-9">
			    <ul id="imgholder" class="bxslider">
			        <li>
			        	<div class="photoText1"  id="text1">
			        		<h1>노을이 아름다운 바다 명소</h1>
			       		 </div>
			        	<img src="/resources/images/pexels-photo-210205.jpeg" width="1800" height="1000">
			        </li>
			        <li>
				        <div class="photoText1"  id="text2">
				       	 <h1>두근두근 2021 여행가는 달♡</h1>
				       	 <p> 모두의 안전을 위해 방역수칙은 준수!</p>
				       	 </div>
				       	 <img src="/resources/images/pexels-photo-620337.jpeg">
					</li>
			        <li>
				        <div class="photoText1"  id="text2">
				       	 <h1>강릉 한옥 마을</h1>
				       	 <p> 다양한 축제를 만나보세요.</p>
				       	 </div>
				        <img src="/resources/images/41741_73542_3717.jpg">
			        </li>
			        <li>
				        <div class="photoText1"  id="text2">
				       	 <h1>나주 비대면 여행코스</h1>
				       	 <p> 자연을 벗삼아 힐링~! 나주 구석구석 숨은 여행지로 비대면 여행 떠나보세요!</p>
				       	 </div>
				        <img src="/resources/images/call.png">
			        </li>
			        <li>
				        <div class="photoText1"  id="text2">
				       	 <h1>실험용</h1>
				       	 <p> 자연을 벗삼아 힐링~! 나주 구석구석 숨은 여행지로 비대면 여행 떠나보세요!</p>
				       	 </div>
				        <img src="/resources/images/pexels-photo-2341830.jpeg">
			        </li>  
			     </ul>
			</div>
		</div>
		<div class="row">
				<div class="col-12">
					<div class="tagContainer col-8">
						<div class="col-12 tagLayout">
							<div class="tag-li-container col-8">
								<ul>
									<c:forEach items="${tagList }" var="tag" begin="0" end="2">
								<li>
									<a href="/review/selectReviewList?tagCode=${tag.tagCode }">${tag.tagName }</a>
								</li>
									</c:forEach>
								</ul>
							</div>
						</div>
							<div class="tagContainer col-12">
								<div class="col-12 tagLayout">
									<div class="tag-li-container col-8">
							<ul>
							<c:forEach items="${tagList }" var="tag" begin="2" end="5">
									<li>${tag.tagName }</li>
							</c:forEach>
							</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
		<div class="row">
			<div class="col-12 mainReviewContainer">
				<div class="col-10 mainReviewLayout">
				 	<c:forEach items="${reviewList}" var="reviewVO">			
						<div class="mainReviewDiv">
							<div class="mainReviewPhoto">
								<a href="/review/detailReview?reviewBoardCode=${reviewVO.reviewBoardCode }&courseCode=${reviewVO.courseCode}"><img src="/resources/images/${reviewVO.reviewImgList[0].reviewImgAttachedName }" style="border-top-left-radius:10px;border-top-right-radius:10px;" width="100%" height="100%"></a>
							</div>
							 <div class="mainReviewText"><span>${reviewVO.reviewBoardContent }</span></div>
						</div>
					</c:forEach> 
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 noticeEventContainer">
				<div class="col-7 noticeEventLayout">
					<div class="col-6 noticeEventDiv">
						<div class="col-12 noticeBanner">
							<img src="/resources/images/timeToTravel.jpg" class="bannerStyle">
						</div>
						<div class="col-12 noticeBanner">
							<table class="noticeTable">
								<colgroup>
									<col width="5%">
									<col width="50%">
									<col width="20%">
									<col width="25%">
								</colgroup>
								<thead>
								<tr>
									<td>No</td>
									<td>제목</td>
									<td>작성자</td>
									<td>등록일</td>
								</tr>
								</thead>
								<tbody>
									<c:forEach begin="0" end="4" items="${noticeBoardList }" var="noticeBoardVO" varStatus="cnt">
									<tr>
										<td>${(cnt.end+1)-cnt.index }</td>
										<td><a href="/common/detailNoticeBoard?noticeBoardCode=${noticeBoardVO.noticeBoardCode }">${noticeBoardVO.boardSubject }</a></td>
										<td>${noticeBoardVO.boardWriter }</td>
										<td>${noticeBoardVO.regDate }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="col-6 noticeEventDiv">
							<div class="col-12 noticeBanner">
								<div class="col-6 eventDiv">
								<img src="/resources/images/배너1.jpg" class="bannerStyle">
								</div>
								<div class="col-6 eventDiv">
								<img src="/resources/images/배너2.png" class="bannerStyle">
								</div>
							</div>
							<div class="col-12 noticeBanner">
								<div class="col-6 eventDiv">
								<img src="/resources/images/0a6021a7-57ae-49eb-a52e-822e5b03567b.png" class="bannerStyle">
								</div>
								<div class="col-6 eventDiv">
								<img src="/resources/images/fa837cab-3363-42d0-b819-585abc0b4c0b.png" class="bannerStyle">
								</div>
						</div>
					</div>
				</div>
				
			</div><!-- noticeEventContainer -->
		</div><!-- 힐링 테마 여행 -->
		<div class="row">
			<div class="col-12 noticeEventContainer">
				<div class="col-8 healingTripContainer">
					<div class="col-12 healingTripLayout">
						<div class="col-3 healingTripDiv">
							<div class="healingTripDivPhoto">
								<div class="healingTripDivPhotoText">
								웅장한 자연이 파노라마로 펼쳐지는
								담양 금성산성 힐링 풍경 여행
								</div>
								<img src="/resources/images/힐링4.png" class="healingImg">
							</div>
						</div>
					<div class="col-3 healingTripDiv">
						<div class="healingTripDivPhoto">
								<div class="healingTripDivPhotoText">
								설렘 가득한 기차 테마 파크로!
								곡성 섬진강기차마을
								</div>
							<img src="/resources/images/힐링5.png" class="healingImg">
						</div>
					</div>
					<div class="col-3 healingTripDiv">
						<div class="healingTripDivPhoto">
								<div class="healingTripDivPhotoText">
								그윽한 맛과 향 즐기는 시음부터
								힐링 와인 족욕 체험까지, 영월 ♡
								</div>
							<img src="/resources/images/힐링6.png" class="healingImg">
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
			<div class="row" style="position:relative;top:-100px;">
				<div class="col-12 noticeEventContainer">
					<div class="col-8 healingTripContainer">
						<div class="col-12 healingTripLayout">
							<div class="col-3 healingTripDiv">
								<div class="healingTripDivPhoto">
									<div class="healingTripDivPhotoText">
										곶감공원, 자전거 박물관, 학전망대
										추억 새기는 상주 가을 여행 코스
									</div>
									<img src="/resources/images/힐링1.png" class="healingImg">
								</div>
							</div>
							<div class="col-3 healingTripDiv">
								<div class="healingTripDivPhoto">
									<div class="healingTripDivPhotoText">
										쪽빛바다와 드넓은 초원, 이국적
										풍경의 제주 섬 ‘차귀도’
									</div>
									<img src="/resources/images/힐링2.png" class="healingImg">
								</div>
							</div>
							<div class="col-3 healingTripDiv">
								<div class="healingTripDivPhoto">
									<div class="healingTripDivPhotoText">
										여유롭게 걸으면서 만나는 가을
										청도 운문호반에코트레일
									</div>
									<img src="/resources/images/힐링3.png" class="healingImg">
								</div>
							</div>
						</div>
					</div>
				</div><!-- noticeEventContainer -->
			</div>
		
		<!-- <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/resources/images/main001.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/resources/images/main002.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/resources/images/main003.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div> -->
	</div>
</div>

</body>
</html>