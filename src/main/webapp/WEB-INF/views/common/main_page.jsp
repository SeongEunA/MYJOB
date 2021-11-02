<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mainPhotoContainer{

border:1px solid black;
width:auto;
height:400px;
background-image:url('/resources/images/야경1.png');
background-repeat: no-repeat;

}
.tagContainer{
border:1px solid black;
height:200px;
margin:0 auto;
}
.mainReviewContainer{
border:1px solid black;
height:400px;
text-align: center;
}
.mainReviewDiv{
border:1px solid blue;
height:80%;
margin-top:35px;
margin-right:20px;
display:inline-block;
border-radius:10px;
}

.noticeEventContainer{
border:1px solid red;
height:500px;
text-align: center;
}
.noticeEventLayout{
border:1px solid blue;
height:100%;
margin:0 auto;
display:flex;
flex-direction:row;
}
.eventBannerLayout{
border:1px solid blue;
background-color:orange;
height:50%;
display:flex;
flex-direction:row;
}
.noticeBoardLayout{
border:1px solid blue;
background-color:pink;
height:50%;
}

.noticeEventDiv{
border:1px solid red;
height:100%;

}

.noticeBanner{
border:1px solid blue;
background-color:white;
height:50%;
display:flex;
flex-direction:row;
}

.eventDiv{
border:1px solid red;
}
.healingTripContainer{
border:1px solid blue;
height:100%;
margin:0 auto;
display:flex;
flex-direction:column;
}

.healingTripLayout{
border:1px solid orange;
height:100%;
display:flex;
flex-direction: row;
}
.healingTripDiv{
border:1px solid blue;
margin:0 auto;
height:80%;
}
.healingTitle{
border:1px solid red;
width:100%;
height:30px;
}
</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-12">
		<div class="mainPhotoContainer">
		배너 사진
		</div>
		<div class="row">
				<div class="col-12">
					<div class="tagContainer col-8">
					태그
					</div>
				</div>
		</div>
		<div class="row">
			<div class="col-12 mainReviewContainer">
				<div class="col-2 mainReviewDiv">
				 리뷰썸네일1
				</div>
				<div class="col-2 mainReviewDiv">
				리뷰썸네일1
				</div>
				<div class="col-2 mainReviewDiv">
				리뷰썸네일1
				</div>
				<div class="col-2 mainReviewDiv">
				리뷰썸네일1
				</div>
				<div class="col-2 mainReviewDiv">
				리뷰썸네일1
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 noticeEventContainer">
				<div class="col-8 noticeEventLayout">
					<div class="col-6 noticeEventDiv">
						<div class="col-12 noticeBanner">
						공지사항배너
						</div>
						<div class="col-12 noticeBanner">
						공지사항테이블
						</div>
					</div>
					<div class="col-6 noticeEventDiv">
							<div class="col-12 noticeBanner">
								<div class="col-6 eventDiv">
								이벤트1
								</div>
								<div class="col-6 eventDiv">
								이벤트2
								</div>
							</div>
							<div class="col-12 noticeBanner">
								<div class="col-6 eventDiv">
								이벤트3
								</div>
								<div class="col-6 eventDiv">
								이벤트4
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
							여행테마1
						</div>
						<div class="col-3 healingTripDiv">
							여행테마2
						</div>
						<div class="col-3 healingTripDiv">
							여행테마3
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="row">
				<div class="col-12 noticeEventContainer">
					<div class="col-8 healingTripContainer">
						<div class="col-12 healingTripLayout">
							<div class="col-3 healingTripDiv">
								여행테마4
							</div>
							<div class="col-3 healingTripDiv">
								여행테마5
							</div>
							<div class="col-3 healingTripDiv">
								여행테마6
							</div>
						</div>
					
				
				</div><!-- noticeEventContainer -->
			</div>
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