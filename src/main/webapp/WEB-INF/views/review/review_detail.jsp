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

}

.reviewTitleContanier {
	margin: 0 auto;
	margin-top: 45px;
}

.mainTitle {
	margin: 0 auto;
	text-align:center; 
	margin-top: 10px;
}

.subTitle {
	margin-top: 30px;
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
	width:1200px;
	margin:0 auto;
}
.replyContainer{
	border: 1px solid lime;
	margin:0 auto;
	margin-top: 30px;
}
.map_wrap{
	height:350px;
	width:100%;
	margin:0 auto;
}
.regTagContainer{
	border:1px solid black;
	height:50px;
	margin:0 auto;
	margin-top: 15px;
	margin-top: 35px;
}
.regReviewText{
	text-align: center;	
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
}
.replyWrap{
	margin: 0 auto;
}
.replyListForm{
	board: 1px solid blue;
}
.replyTitle{
	margin-top: 22px;
	border-bottom: 4px solid #e5e5e5;
	padding: 12px;
}
.replyTitle span{
	color: #0a97cd;
}
.replyTitle strong{
	font-size: 26px;
}
.replyWrap{
	margin: 0 auto;
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
.reviewEmpTable{
	width: 100%;
	text-align: left;
	border-bottom: 2px solid #eeeeee;
	text-align: center;
	padding: 30px;
}
.reviewEmpTable trm{
	padding-bottom: 30px;
}
.reviewTable tr, td{
	padding: 3px;
}
.reviewList{
	padding: 15px;
	margin-top: 20px;
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
	margin-top: 15px;
	display: inline-block;
	margin-left: 30px;
}
.writerDiv{
	text-align: right;
	margin-bottom: 13px;
}
.writer{
	margin-left: 10px;
	letter-spacing: 2px;
	margin-right: 5px;
}
.dateDiv{
	letter-spacing: 2px;
}
.reviewDeleteBtn{											
	width:5%;
	height:80%;
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
	margin-right: 15px;
}
.DeleteBtnDiv{
	margin-top: 15px;
	text-align: right;
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

.tagContainer{
border:1px solid white;
height:160px;
margin:0 auto;
margin-top: 20px;
height: 80px;
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
.subTitle{
	margin-top: 30px;
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
							<div id="appendRecommendCnt" style="width: 5%">
								<c:choose>
									<c:when test="${reviewRecom.isRecommend eq 'Y'}">
										<img class="recomBtn" src="/resources/images/updateRecommend.PNG">${review.reviewBoardRecommendCnt }
									</c:when>
									<c:otherwise>
										<img class="recomBtn" onclick="updateRecommend();"src="/resources/images/nomalRecommend.PNG">${review.reviewBoardRecommendCnt }
									</c:otherwise>
								</c:choose>
							</div>
								조회수&nbsp;${review.reviewBoardReadCnt }
							<div style="width: 7%" id="markerXY">
								<c:forEach items="${placeLocaList }" var="place">
									<c:forEach items="${place.coursePlaceList}" var="placeXY">
											<input type="hidden" class="markerX" value="${placeXY.x }">
											<input type="hidden" class="markerY" value="${placeXY.y }">
									</c:forEach> 
								</c:forEach>
							</div>
							
						</div>
						<div class="writerDiv">
								<div class="writer">글쓴이:&nbsp;${review.reviewBoardWriter }</div>														
						</div>
						<div class="dateDiv">
							작성일:&nbsp;${review.reviewBoardRegDate }
						</div>
					   </div>
				</div><!-- subtitle -->  
						<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' || sessionScope.loginInfo.memberId eq review.reviewBoardWriter}">
							<div class="DeleteBtnDiv" style="width: 100%">
								<input type="button" value="삭제" class="reviewDeleteBtn" onclick="deleteReviewBoard();">
							</div>	
						</c:if> 
			</div>
			<!-- 태그시작 -->
			<div class="row">
				<div class="col-12">
					<div class="tagContainer col-8">
						<div class="col-12 tagLayout">
							<div class="tag-li-container col-8">
								<ul>
									<li>#서울	</li>
									<li>#등산</li>
									<li>#100대명산</li>
									<li>#가을여행</li>
									<li>#단풍여행</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
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
		<script type="text/javascript"src="/resources/review/js/review_detail.js?ver=18"></script>
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
											<input type="hidden" name="courseCode" 		  value="${review.courseCode }">
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
					<div class="col-12 reviewList">
					<c:choose>
						<c:when test="${!empty replyList}">
							<c:forEach items="${replyList }" var="reviewReplyVO">
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
													<form action="/review/deleteReply" method="get" 	id="deleteReply">
														<input type="hidden" name="reviewBoardCode" value="${reviewReplyVO.reviewBoardCode}"> 
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
							</c:forEach>
						</c:when>
						<c:otherwise>
								<table class="reviewEmpTable">
									<tr>
										<td>
											등록된 댓글이 없습니다.													
										</td>
									</tr>
								</table>											
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>	
		</div>
		</div>
		</div>
</body>
</html>