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
	src="/resources/review/js/review_detail.js?ver=27"></script>
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
	text-align: center;	
	border:1px solid red;
	height:auto;
	margin:0 auto;
}
.reviewPhotoContainer{
	border:1px solid black;
	min-height:300px;
	margin:0 auto;
	text-align: center;
	margin-top: 25px;
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
	width:250px;
	height:250px;
	border-radius:10px;
	margin:0 75px;
}
.reviewPhotoDiv img{
 	top:0; 
 	left: 0;
  	width: 100%;
  	height: 100%;
}
mmendLayout{
	text-align: left;
	padding: 12px;
}
.recommendLayout div:last-child{
	text-align: right;
	color: #707070;
}
.recommendLayout span{
	margin-left: 3px;
}

.recommendLayout img{
	height: 28px;
}
.totalReply{
	board: 1px solid red;
}
.replyWrap{
	margin: 0 auto;
}
.replyListForm{
	board: 1px solid blue;
}
.replyTitle{
	margin-top: 22px;
}
.replyTitle span{
	color: #0a97cd;
}
.replyTitle strong{
	font-size: 26px;
}
.replyWrap{
	border: 5px solid pink;
	margin: 0 auto;
}
.write{
	border: 3px solid red;
}

.replyWrap .write {
	height: 150px;
    position: relative;
    margin-top: 30px;
    background: #f7f7f7;
    border: 1px solid #e5e5e5;
}
.writeForm{
	padding: 20px;
	border: 3px solid green;
}
.regBtn{
	margin-top: 15px;
	border: 3px solid white;
	text-align: right;
}
.replyListForm{
	text-align: left;
	margin-left: 10px;
	margin-top: 15px;
}
.reviewTable{
	width: 100%;
	text-align: left;
	border-bottom: 2px solid #eeeeee;
}
.reviewTable tr, td{
	padding: 3px;
}
.reviewList{
	border: 3.5px solid black;
	padding: 15px;
}
.reviewTable tr:nth-child(2) td{
	font-size: 16px;
}
.deleteBtn {
	text-align: right;
}
.recommendLayout {
	text-align: left;
}
</style>
</head>
<body>
	<div class="row">
		<input type="hidden" class="reviewReplyId"      value="${sessionScope.loginInfo.memberId}"> 
		<input type="hidden" class="reviewReplyWriter"  value="${sessionScope.loginInfo.memberName}"> 
		<input type="hidden" class="reviewBoardCode"	value="${reviewReplyVO.reviewBoardCode}">
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
					<div class="recommendLayout">
						<span id="appendRecommendCnt">
							<c:choose>
								<c:when test="${reviewRecom.isRecommend eq 'Y'}">
									<img class="recomBtn" src="/resources/images/updateRecommend.PNG">${review.reviewBoardRecommendCnt }
								</c:when>
								<c:otherwise>
									<img class="recomBtn" onclick="updateRecommend();"src="/resources/images/nomalRecommend.PNG">${review.reviewBoardRecommendCnt }
								</c:otherwise>
							</c:choose>
						</span>
						<span>
							조회수${review.reviewBoardReadCnt }
						</span>
						<div>
							작성일&nbsp;${review.reviewBoardRegDate }
						</div>
					</div>
				</div><!-- subtitle -->  
			</div>
			<!-- 태그시작 -->
			<div class="regTagContainer col-6">
				태그좌
			</div>
			<div class="regReviewText col-7">
				${review.reviewBoardContent }
			</div>
 		<div class="row"><!-- 지도 -->
			<div class="col-12 mainContainderLayout">
				<div class ="map_wrap" id="map"></div>
				<div></div>
			</div>
		</div> 
			<!-- 사진3개영역 -->
			<div class="reviewPhotoContainer col-8">
				<div class="reviewPhotoLayout col-12">
					<c:forEach items="${review.reviewImgList}" var="reviewImgVO">
						<div class="reviewPhotoDiv">
							<img src="/resources/images/${reviewImgVO.reviewImgAttachedName }" width="200" height="200">
						</div>					
					</c:forEach>
				</div>
			</div>
		
			<div class="col-12"><!-- 댓글 -->
				<div class="col-8 replyWrap">
						<div class="replyTitle">
							<strong>댓글&nbsp;<span>${replyList.size() }</span></strong>
						</div>
						<form action="/review/regRely" method="post">
							<div class="write">
								<div class="writeForm">
									<input type="hidden" name="memberId"          value="${sessionScope.loginInfo.memberId}"> 
									<input type="hidden" name="reviewReplyWriter" value="${sessionScope.loginInfo.memberName}"> 
									<input type="hidden" name="reviewBoardCode"   value="${review.reviewBoardCode}"> 
									<textarea style="width:100%; resize: none;"class="replyContent" rows="3" cols="30" name="reviewReplyContent" required></textarea> <br>							
								<div class="regBtn">
									<input type="submit" value="등록" class="">
								</div>
								</div>
							</div>
						</form>	
				<div class="col-12">
					<c:choose>
						<c:when test="${!empty replyList}">
							<c:forEach items="${replyList }" var="reviewReplyVO">
									<div class="col-12 reviewList">
										<table class="reviewTable">
											<tr>
												<td>
													${reviewReplyVO.reviewReplyContent}												
												</td>
											</tr>
											<tr>
												<td>
													${reviewReplyVO.reviewReplyWriter } | ${reviewReplyVO.reviewReplyRegDate }
												</td>
											</tr>
											<tr>
												<td>
													<div>
													 &nbsp;
														<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' || sessionScope.loginInfo.memberId eq reviewReplyVO.memberId}">
															<form action="/review/deleteReply" method="get"id="deleteReply">
																<input type="hidden" name="reviewBoardCode"value="${reviewReplyVO.reviewBoardCode}"> 
																<input type="hidden" class="hiddenReviewReplyCode" name="reviewReplyCode"value="${reviewReplyVO.reviewReplyCode }">
															</form>
																<div class="deleteBtn">
																	<input type="button" onclick="deleteReply();" value="삭제">
																</div>
														 </c:if>
													</div>
												</td>
											</tr>
										</table>
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