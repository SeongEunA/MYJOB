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
	padding: 15px;
	line-height: 170%;
}
.reviewPhotoContainer{
	border:1px solid white;
	min-height:300px;
	margin:0 auto;
	text-align: center;
	margin-top: 25px;
}
.reviewPhotoLayout{
	border:1px solid white;
	height:300px;
	display:flex;
	flex-direction: row;
	margin:0 auto;
	text-align: center;
}
.reviewPhotoDiv{
	border:1px solid white;
	width:250px;
	height:250px;
	border-radius:10px;
	margin:0 15px;
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
	margin:0 auto;
	
}
.textAreaLayout{
	border:2px solid #f7f7f7;
	display:flex;
	flex-direction: row;
	text-align:center; 
	
}
.textAreaDiv{
	border:1px solid #f7f7f7;
	width:85%;
	height:100%;
}

.regBtnDiv{
	border:1px solid green;
	border-radius:5px;
	margin-left:20px;
	width:10%;
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
.adminBtn{
	text-align: right;
}
.recommendInnerLayout > div{
	margin-top: 5px;
	border: 1px solid pink;
	display: inline-block;
}
.writerDiv{
	border: 1px solid green;
	margin-left: 700px;
}
.writer{
	margin-left: 10px;
	letter-spacing: 2px;
}
.dateDiv{
	letter-spacing: 2px;
}
.searchBtn{											
	width:100%;
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
	text-align:center;
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
				<div class="mainTitle">${review.reviewBoardTitle }
				</div>
			    <div class="subTitle">				
					<div class="recommendLayout">
						<div class="recommendInnerLayout">
							<div id="appendRecommendCnt" style="width: 4%">
								<c:choose>
									<c:when test="${reviewRecom.isRecommend eq 'Y'}">
										<img class="recomBtn" src="/resources/images/updateRecommend.PNG">${review.reviewBoardRecommendCnt }
									</c:when>
									<c:otherwise>
										<img class="recomBtn" onclick="updateRecommend();"src="/resources/images/nomalRecommend.PNG">${review.reviewBoardRecommendCnt }
									</c:otherwise>
								</c:choose>
							</div>
								조회수${review.reviewBoardReadCnt }
							<div style="width: 7%" id="markerXY">
								<c:forEach items="${placeLocaList }" var="place">
									<c:forEach items="${place.coursePlaceList}" var="placeXY">
											<input type="hidden" class="markerX" value="${placeXY.x }">
											<input type="hidden" class="markerY" value="${placeXY.y }">
									</c:forEach> 
								</c:forEach>
							</div>
							<div class="col-3 writerDiv">
								<div class="writer">글쓴이:&nbsp;${review.reviewBoardWriter }</div>														
							</div>
							<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' }">
								<div class="adminBtn" style="width: 88%">
									<input type="button" id="deleteReviewBoardBtn" value="삭제" onclick="deleteReviewBoard();">
								</div>	
							</c:if>
						</div>
						<div class="dateDiv">
							작성일:&nbsp;${review.reviewBoardRegDate }
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
				<script type="text/javascript"src="/resources/review/js/review_detail.js?ver=10"></script>
				<div></div>
			</div>
		</div> 
			<!-- 사진3개영역 -->
			<div class="reviewPhotoContainer col-8">
				<div class="reviewPhotoLayout col-8">
					<c:forEach items="${review.reviewImgList}" var="reviewImgVO">
						<div class="reviewPhotoDiv">
							<img src="/resources/images/${reviewImgVO.reviewImgAttachedName }" width="200" height="200" style="border-radius: 10px;">
						</div>					
					</c:forEach>
				</div>
			</div>
		
			<div class="col-12"><!-- 댓글 -->
				<div class="col-7 replyWrap">
						<div class="replyTitle">
							<strong>댓글&nbsp;<span>${replyList.size() }</span></strong>
						</div>
						<form action="/review/regRely" method="post">
							<div class="write col-12">
								<div class="writeForm col-12">
									<div class="textAreaLayout col-11">
										<div class="textAreaDiv">
											<input type="hidden" name="memberId"          value="${sessionScope.loginInfo.memberId}"> 
											<input type="hidden" name="reviewReplyWriter" value="${sessionScope.loginInfo.memberName}"> 
											<input type="hidden" name="reviewBoardCode"   value="${review.reviewBoardCode}"> 
											<textarea style="width:100%; resize: none;"class="replyContent" rows="3" cols="30" name="reviewReplyContent" required></textarea>						
										</div>
										<div class="regBtnDiv">
											<input type="submit" value="등록" class="searchBtn">
										</div>
									</div><!-- textAreaLayout -->
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