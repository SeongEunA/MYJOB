<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/review/js/review_reply.js?ver=1"></script>
</head>
<body>
<div class="container">
	<form action="/review/detailReview" id="regSubmit" method="post" >
		<input type="hidden"  name="memberId" value="${sessionScope.loginInfo.memberId}">
		<input type="hidden"  name="reviewReplyWriter" value="${sessionScope.loginInfo.memberName}">
	<%-- 	<input type="hidden"  name="reviewBoardCode" value="${review.reviewBoardCode}"> --%>
		<input type="hidden"  name="reviewBoardCode" value="${reviewVO.reviewBoardCode}">
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
							<input type="button" value="등록" onclick="regReply();" class="btn pull-right btn-secondary">
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
        	 	<c:when test="${!empty reviewList}">
        	 		<c:forEach items="${reviewList }" var="reviewVO">
			        	<div>
			        		<div>
			        			<table class="table">
			        				<h6><strong>${reviewVO.reviewReplyWriter }</strong></h6>
			        				${reviewVO.reviewReplyContent  }
			        				<tr>
			        					<td>
			        						<input type="button" onclick="deleteReply();">
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
</body>
</html>