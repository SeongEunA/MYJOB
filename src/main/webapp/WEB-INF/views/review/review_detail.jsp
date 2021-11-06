<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Kakao 지도 시작하기</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d7b169893841eb187f9823a06d83f4"></script>
<script type="text/javascript"
	src="/resources/review/js/review_detail.js?ver=26"></script>
<style type="text/css">
.totalContain {
	border: 1px solid red;

}

.reviewTitleContanier {
	border: 1px solid blue;
	margin: 0 auto;

}

.mainTitle {
	border: 1px solid black;
	margin: 0 auto;
	text-align:center; 
}

.subTitle {
	margin-top: 15px;
	border: 1px solid black;
	margin: 0 auto;
	text-align: right;
}
.mainContainer{
	border: 1px solid green;
	background-color:green;
	width:100%;
	text-align:center;
}
.mainContainderLayout{
	border:2px solid pink;
	width:1200px;
	margin:0 auto;
}
.replyContainer{
	border: 1px solid lime;
	margin:0 auto;
	margin-top: 30px;
}
.map_wrap{
	background-color:blue;
	height:350px;
	width:100%;
	margin:0 auto;
}
.regTagContainer{
	border:1px solid black;
	height:50px;
	margin:0 auto;
}
.regReviewText{
	border:1px solid red;
	height:auto;
	margin:0 auto;
}
.reviewPhotoContainer{
	border:1px solid black;
	min-height:300px;
	margin:0 auto;
	text-align: center;
}
.reviewPhotoLayout{
	border:1px solid red;
	height:300px;
	display:flex;
	flex-direction: row;
	margin:0 auto;
	text-align: center;
}
.reviewPhotoDiv{
	border:1px solid black;
	width:30%;
	height:100%;
	border-radius:10px;
	margin:0 20px;
}

</style>
</head>
<body>
	<div class="row">
		<div class="col-12 bodyContainer">
			<div class="reviewTitleContanier col-8">
				<div class="mainTitle">울산대공원</div>
			    <div class="subTitle">
					<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' }">
						<div class="manageBtnDiv">
							<div class="deleteReviewBoardBtnDiv">
								<input type="button" id="deleteReviewBoardBtn" value="삭제" onclick="deleteReviewBoard();">
							</div>
						</div>
					</c:if>
					<div class="recommendLayout" id="appendRecommendCnt">
						<c:choose>
							<c:when test="${reviewRecom.isRecommend eq 'Y'}">
								<img id="recomBtn" src="/resources/images/updateRecommend.PNG">${review.reviewBoardRecommendCnt }
						</c:when>
							<c:otherwise>
								<img id="recomBtn" onclick="updateRecommend();"src="/resources/images/nomalRecommend.PNG">${review.reviewBoardRecommendCnt }
						</c:otherwise>
						</c:choose>
					</div>
				</div><!-- subtitle -->  
			</div>
			<!-- 태그시작 -->
			<div class="regTagContainer col-6">
				태그좌
			</div>
			<div class="regReviewText col-7">
			야야야 야야야 리뷰글쓰기 얍
			</div>
 		<div class="row"><!-- 지도 -->
			<div class="col-12 mainContainderLayout">
				<div class ="map_wrap" id="map"></div>
				<div></div>
			</div>
		</div> 
			<!-- 사진3개영역 -->
			<div class="reviewPhotoContainer col-8">
				<div class="reviewPhotoLayout col-9">
					<div class="reviewPhotoDiv">
						사진1
					</div>
					<div class="reviewPhotoDiv">
						사진2
					</div>
					<div class="reviewPhotoDiv">
						사진3
					</div>
				</div>
			</div>
		
			<div class="col-12"><!-- 댓글 -->
				<div class="replyContainer col-8">
					<div class="replyformDiv">
						<div>
							<form action="/review/regRely" method="post">
									<input type="hidden" name="memberId"          value="${sessionScope.loginInfo.memberId}"> 
									<input type="hidden" name="reviewReplyWriter" value="${sessionScope.loginInfo.memberName}"> 
									<input type="hidden" name="reviewBoardCode"   value="${review.reviewBoardCode}"> 
									<br><br>
								<div>
									<strong>댓글</strong>
								</div>
								<table class="replyTable">
									<tr>
										<td>
											<textarea style="width:100%; resize: none;"class="replyContent" rows="3" cols="30"name="reviewReplyContent" required></textarea> <br>
											<div>
												<input type="submit" value="등록" class="">
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<div class="replyList">
						
						</div>
					</div>
				</div>
			</div>


	
		<input type="hidden" class="reviewReplyIsAdmin" value="${sessionScope.loginInfo.memberIsAdmin}"> 
		<input type="hidden" class="reviewReplyId"      value="${sessionScope.loginInfo.memberId}"> 
		<input type="hidden" class="reviewReplyWriter"  value="${sessionScope.loginInfo.memberName}"> 
		<input type="hidden" class="reviewBoardCode"	value="${reviewReplyVO.reviewBoardCode}">

		<div class="container">
			<form action="/review/regRely" method="post">
				<input type="hidden" name="memberId"          value="${sessionScope.loginInfo.memberId}"> 
				<input type="hidden" name="reviewReplyWriter" value="${sessionScope.loginInfo.memberName}"> 
				<input type="hidden" name="reviewBoardCode"   value="${review.reviewBoardCode}"> 
				<br><br>
				<div>
					<strong>댓글</strong>
				</div>
				<div class="replyFormDiv">
					
				</div>
			</form>
		</div>
		<div class="container">
			<div id="replyForm">
				<div id="replyList">
					<c:choose>
						<c:when test="${!empty reviewReplyList}">
							<c:forEach items="${reviewReplyList }" var="reviewReplyVO">
								<div>
									<div>
										<table class="table">
												<tr>
													<td>
														${reviewReplyVO.reviewReplyWriter }
														${reviewReplyVO.reviewReplyContent}												
													</td>
												</tr>
											<tr>
												<td>
													<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' || sessionScope.loginInfo.memberId eq reviewReplyVO.memberId}">
														<form action="/review/deleteReply" method="get"id="deleteReply">
															<input type="hidden" name="reviewBoardCode"value="${reviewReplyVO.reviewBoardCode}"> 
															<input type="hidden" class="hiddenReviewReplyCode" name="reviewReplyCode"value="${reviewReplyVO.reviewReplyCode }">
														</form>
															<input type="button" onclick="deleteReply();" value="삭제">
														</c:if>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							등록된 댓글이 없습니다											
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>