<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Kakao 지도 시작하기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d7b169893841eb187f9823a06d83f4"></script>
<script type="text/javascript" src="/resources/review/js/review_detail.js?ver=26"></script>
<style type="text/css">
</style>
</head>
<body>
	<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' }">
		<div class="manageBtnDiv">
			<div class="deleteReviewBoardBtnDiv">
				<input type="button" id="deleteReviewBoardBtn" value="삭제" onclick="deleteReviewBoard();">
			</div>
		</div>
	</c:if>
	<div class="row justify-center">
		<div class="col-12" id="appendRecommendCnt">
			<c:choose>
				<c:when test="${reviewRecom.isRecommend eq 'Y'}">
					<img id="recomBtn" src="/resources/images/updateRecommend.PNG">	${review.reviewBoardRecommendCnt }
				</c:when>
				<c:otherwise>
					<img id="recomBtn" onclick="updateRecommend();"  src="/resources/images/nomalRecommend.PNG">${review.reviewBoardRecommendCnt }
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<div class="contentDiv">
		<div id="map" style="width:900px;height:350px;"></div>
		<div>
			${review.reviewBoardCode}
			${review.reviewBoardWriter}
			${review.reviewBoardContent}
			${sessionScope.loginInfo.memberId}
		</div>	
	</div>
	<input type="hidden" class="reviewReplyIsAdmin" value="${sessionScope.loginInfo.memberIsAdmin}">
	<input type="hidden" class="reviewReplyId" value="${sessionScope.loginInfo.memberId}">
	<input type="hidden" class="reviewReplyWriter" value="${sessionScope.loginInfo.memberName}">
	<input type="hidden" class="reviewBoardCode" value="${reviewReplyVO.reviewBoardCode}">
	<%-- <%@ include file="../review/review_reply.jsp" %>	 --%>
	<div class="container">
	<form action="/review/regRely"  method="post" >
		<input type="hidden"  name="memberId" value="${sessionScope.loginInfo.memberId}">
		<input type="hidden"  name="reviewReplyWriter" value="${sessionScope.loginInfo.memberName}">
		<input type="hidden" name="reviewBoardCode" value="${review.reviewBoardCode}">
	<br><br>
		<div>
			<strong>댓글</strong>	
		</div>
		<div class="replyFormDiv">
			<table class="replyTable">
				<tr>
					<td>
						<textarea style="width: 1100px; resize: none;" class="replyContent" rows="3" cols="30" name="reviewReplyContent" required></textarea>
						<br>
						<div>
							<input type="submit" value="등록" class="btn pull-right btn-secondary">
						</div>
					</td>
				</tr>
			</table>
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
			        				<h6><strong>${reviewReplyVO.reviewReplyWriter }</strong></h6>
			        				${reviewReplyVO.reviewReplyContent  }
			        				<tr>
			        					<td>
			        						<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' || sessionScope.loginInfo.memberId eq reviewReplyVO.memberId}">
									        	<form action="/review/deleteReply" method="get" id="deleteReply">
							        		    <input type="hidden" name="reviewBoardCode" value="${reviewReplyVO.reviewBoardCode}">
			        							<input type="hidden" class="hiddenReviewReplyCode" name="reviewReplyCode" value="${reviewReplyVO.reviewReplyCode }">
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
        	 		<div>
        	 			<div>
        	 				<table>
        	 					<h6><strong>등록된 댓글이 없습니다</strong></h6>
        	 				</table>
        	 			</div>
        	 		</div>
        	 	</c:otherwise>
    		</c:choose>
        </div>
    </div>
</div>
	</div>
</body>
</html>