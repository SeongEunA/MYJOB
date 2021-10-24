<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Kakao 지도 시작하기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d7b169893841eb187f9823a06d83f4"></script>
<script type="text/javascript" src="/resources/review/js/review_detail.js?ver=4"></script>
<style type="text/css">
.contentDiv{
	width: 1100px;
	margin : 0 auto;
	margin-bottom: 35px;
}

#map{
	text-align: center;
}

</style>
</head>
<body>
	<div class="contentDiv">
		<div id="map" style="width:900px;height:350px;"></div>
		
		<div>
			${review.reviewBoardCode}
			${review.reviewBoardWriter}
			${review.reviewBoardContent}
		</div>	
	
	</div>
	
	
	<%@ include file="../review/review_reply.jsp" %>	
</body>
</html>