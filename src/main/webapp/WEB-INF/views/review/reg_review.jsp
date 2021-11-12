<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/review/js/reg_review.js?ver=5"></script>
<style type="text/css">

.regContainer{
	height: 1300px;
	margin: 0 auto;
}
.mainRegcontain{
	margin: 0 auto;
}

.introCourseDiv{
	width: 100%;
	margin-top: 35px;
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
	border: 1px solid pink;
	text-align: center;
	margin-top: 18px;
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
}

.imgDiv {
	display: inline-block; 
/* 	margin:0 auto;  */
	text-align:center; 
	width:300px;
	margin-left:20px;
	margin-right:15px;
}
.headerDiv{
	/* border: 1px solid black; */
	margin-top: 35px;
}
/* .title {
	line-height:1; 
	color:red; 
	position:absolute; 
	left:50%; 
	transform:translateX(-50%); 
	top:200px; 
	height:120px; 
	transition:0.5s all;
} */
.title {
	line-height:1; 
	color:red; 
	position:relative;
	left:100px;
	/* transform:translateX(-50%); */
	top:-170px; 
	/* height:120px;  */
	transition:0.5s all;
}
.title h3 {
	font-size:30px;  
	margin:0;
}
.title p {
	font-size:14px; 
	margin-top:15px;
}
.more {
	display:block; 
	font-size:18x; 
	color:#fff;
	background-color: transparent;
	line-height:40px; 
	width:120px; 
	/* margin-top:30px; */ 
	opacity:0; 
	transition:0.5s all;
}

/* .imgDiv:hover .more {
	opacity:0; 
	top:150px ;
}
*/
.totalCos{
	border: 1px solid blue;
	margin: 0 auto;
	text-align: center;
	padding: 15px;	
}

.selectCourseDiv{
	border: 1px solid red;
	font-size: 20px;
	margin-left: 48px;
}
.courseDetail{
	margin-top: 15px;
	/* display: inline-block; */
	/* margin-left: 400px; */

}

.imgDiv:hover .title {
	top: -200px ;
}
.imgDiv:hover .more {
	 opacity:1;
	 cursor: pointer; 
	 color:  white;
}
.imgDiv:hover > img {
	 filter: brightness(50%);   
}
.selCos{
	/* border: 1px solid blue; */
	display: inline-block;
	margin-left: 10px;
	margin-right: 15px;
}
.reviewTitle{
	padding: 10px;
	font-size: 22px;
	margin-bottom: 5px;
}
textarea{
	padding: 10px;
}
.preImgList{
	margin-left: 50px;
	margin-right: 50px;
}


.searchBtn{
   width:12%; 
   margin: 0 auto;
   border: 3px solid #1F50B5;
   border-radius: 5px;
   color: #fff;
   background:#1F50B5;
   text-transform: uppercase;
   font-size: 1em;
   font-weight: bold;
   letter-spacing: .1em;
   font-family: "Roboto Condensed", sans-serif;
   cursor: pointer;
   transition: all .5s;
   text-align:center;
   box-shadow:inset 0 0 0 0 gray;
   padding: 10px;
   margin-left: 10px;
}
.searchBtn1{
   width:12%; 
   margin: 0 auto;
   border: 3px solid #1F50B5;
   border-radius: 5px;
   color: #1F50B5;
   background:#fff;
   text-transform: uppercase;
   font-size: 1em;
   font-weight: bold;
   letter-spacing: .1em;
   font-family: "Roboto Condensed", sans-serif;
   cursor: pointer;
   transition: all .5s;
   text-align:center;
   box-shadow:inset 0 0 0 0 gray;
   padding: 10px;
}
.textareaInfo{
	text-align: right;	
}
</style>
</head>
<body>

<div class="row">
	<div class="col-9 regContainer">
		<div class="col-9 mainRegcontain">
		<div class="reviewTitleContainer">
			<div class="col-12 reviewTitleDiv">
			후기등록
			</div>
		</div>
			<div class="regContentDiv">
				<form action="/review/regReview" method="post" enctype="multipart/form-data">
					<input type="hidden" name="reviewBoardWriter" value="${sessionScope.loginInfo.memberId }">
					<div class="col-12 headerDiv">
						<div class="totalCos">
							<div class="selCos" >코스선택
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
							</div>
							<div class="courseDetail">
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
							</div>
						</div>
					</div>
					
					<div class="introCourseDiv">
						<div class="reviewTitle">제목&nbsp;&nbsp;<input type="text" name="reviewBoardTitle" required></div>	
						<textarea name="reviewBoardContent" id="test" maxlength="2000" class="comment_textarea" title="코스 소개" style="resize: none;"placeholder="코스에 대한 간략한 설명을 기재할 수 있습니다."></textarea>
						 <div id="test_cnt" class="textareaInfo">(0 / 1000)</div>
					</div>
					<div>
					</div>
					<div>
						<section class="pr_img">
							<p>
								<label for="img"></label>
							</p>
							<div id="pr_img" class="fileImgBox" ></div>
							<div id="pr_img_input">
								<input type="file" id="img_file1" name="file" value="1" class="fileImgDiv" required/>
							</div>
						</section>
					</div>
					<div class="btn_center">
						<input type="button" value="취&nbsp;소" class="searchBtn1" onclick="location.href='/review/selectReviewList'"> 
		              	<input type="submit" value="등&nbsp;록" class="searchBtn">
					</div>
				</form>
			</div>
		</div>
		</div>
	</div>
</body>
</html>




