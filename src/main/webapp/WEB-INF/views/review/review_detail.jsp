<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Kakao 지도 시작하기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d7b169893841eb187f9823a06d83f4"></script>
<script type="text/javascript" src="/resources/review/js/review_detail.js?ver=92"></script>
<style type="text/css">
.contentDiv{
	width: 1100px;
	margin : 0 auto;
	margin-bottom: 35px;
}

.manageBtnDiv{
	margin-bottom: 10px;
	text-align: right;
}

.deleteReviewBoardBtnDiv{
	display: inline-block;
}

#map{
	text-align: center;
}

</style>
</head>
<body>
	<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' }">
		<div class="manageBtnDiv">
			<div class="deleteReviewBoardBtnDiv">
				<input type="button" id="deleteReviewBoardBtn" value="삭제" onclick="deleteReviewBoard('${review.reviewBoardCode}');">
			</div>
		</div>
	</c:if>
	
	
	<div class="contentDiv">
		<div id="map" style="width:900px;height:350px;"></div>
		<div>
			${review.reviewBoardCode}
			${review.reviewBoardWriter}
			${review.reviewBoardContent}
		</div>	
	</div>
	<input type="hidden" class="reviewReplyId" value="${sessionScope.loginInfo.memberId}">
	<input type="hidden" class="reviewReplyWriter" value="${sessionScope.loginInfo.memberName}">
	<input type="hidden" class="hiddenBoardCode" value="${review.reviewBoardCode}">
	<%@ include file="../review/review_reply.jsp" %>	
</body>
</html>