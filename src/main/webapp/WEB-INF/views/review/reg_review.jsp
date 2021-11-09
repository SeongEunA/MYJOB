<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/review/js/reg_review.js?ver=10"></script>
<style type="text/css">

.regContainer{
	height: 800px;
	margin: 0 auto;
}
.mainRegcontain{
	margin: 0 auto;
}

.introCourseDiv{
	width: 100%
}
.regContentDiv{
	margin: 0 auto;
}
.introCourseDiv .comment_textarea{
	width: 100%;
    min-height: 180px;
    text-align: left;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
.btn_center{
	text-align: center;
}
.btn_center .reg_btn,.reg_back_btn{
	display: inline-block;
    margin-top: 20px;
    padding: 8px 53px;
    border: 1px solid #13294b;
    background: #13294b;
    text-align: center;
    font-size: 16px;
    color: #fff;
}
.attachedDiv{
	height: 80px;
}
.reviewTitleContainer{
	border-bottom:2px solid black;
	height:50px;
	margin:0 auto;
	margin-top:50px;
}
.reviewTitleDiv{
	height:99%;
	font-size:35px;
	
}
.fileImgBox{
	max-width:100%;
	height:auto;
	display:flex;
	flex-direction: row;
	flex-wrap: wrap;
}
.placeName{
	display: inline-block;
	margin-bottom: 10px;
}
</style>
</head>
<body>

<div class="row">
	<div class="col-9 regContainer">
		<div class="col-9 mainRegcontain">
		<div class="reviewTitleContainer">
			<div class="col-6 reviewTitleDiv">
			후기등록
			</div>
		</div>
			<div class="regContentDiv">
				<form action="/review/regReview" method="post" enctype="multipart/form-data">
					<input type="hidden" name="reviewBoardWriter" value="${sessionScope.loginInfo.memberId }">
					<div class="headerDiv">코스선택
						<c:choose>
							<c:when test="${empty courseList }">
								<div>코스를 추가해주세요!</div>
							</c:when>
							<c:otherwise>
								<select id="selectCourseCode" name="courseCode">
									<c:forEach items="${courseList }" var="courseInfo">
										<option value="${courseInfo.courseCode }">${courseInfo.courseName }</option>
									</c:forEach>
								</select> 
							</c:otherwise>
						</c:choose>
					<div>제목 <input type="text" name="reviewBoardTitle" required></div>	
					</div>
					<c:choose>
						<c:when test="${empty courseListBycourseCode }">
							<div class="selectCourseDiv"></div>
						</c:when>
						<c:otherwise>
							<div class="selectCourseDiv">
								<c:forEach items="${courseListBycourseCode }" var="courseInfo">
									<div class="courseBox" id="courseBox">
										<c:forEach items="${courseInfo.coursePlaceList}" var="placeInfo" varStatus="cnt">
											<c:choose>
												<c:when test="${cnt.last }">
									      	 		<div class="placeName">
									      	 			${placeInfo.placeName  }
									      	 		</div>
												</c:when>
									      	 	<c:otherwise>
													<div class="placeName">
														${placeInfo.placeName  }
													</div> &#10140;
									      	 	</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
							     </c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
					
					<div class="introCourseDiv">
						<textarea name="reviewBoardContent" id="csdesc" maxlength="2000"
							class="comment_textarea" title="코스 소개" style="resize: none;"
							placeholder="코스에 대한 간략한 설명을 기재할 수 있습니다."></textarea>
					</div>
					<div>
						<section class="pr_img">
							<p>
								<label for="img"></label>
							</p>
							<div id="pr_img" class="fileImgBox" >
								<input type="file" id="img" name="file" class="fileImgDiv" required/>
							</div>
							<div id="pr_img_text"></div>
						</section>
					</div>
					<div class="btn_center">
						<input type="button" value="취소" class="reg_back_btn" onclick="location.href='/review/selectReviewList'"> 
						<input type="submit" value="등록" class="reg_btn">
					</div>
				</form>
			</div>
		</div>
		</div>
	</div>
</body>
</html>




