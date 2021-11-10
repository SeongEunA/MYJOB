<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'Mini_handwriting';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/naverfont_08@1.0/Mini_handwriting.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{

}
.courseContainer{

border:1px solid white;
border-radius:20px;
width:1500px;
height:auto;
min-height:1200px;
margin:0 auto;
margin-top:30px;
display: flex;
flex-direction: row;
padding: 30px;
background-image: url("/resources/images/3557b1c3aa0869f17f06b2691ef0900c.jpg");
background-repeat: no-repeat;
background-size: contain;
background-position: right top;
background-color:#8FBAE5;
font-family: 'Mini_handwriting';
font-size:23px;
font-weight:bold;
color:#474747;
margin-bottom:300px;
}

.courseLayoutLeft{

border:1px solid white;
border-radius:10px;
background-color:white;
width:800px;
height:auto;
display:flex;
flex-direction:column;
margin:0 auto;
margin-top:20px;

}
.courseLayoutRight{

border:1px solid white;
border-radius:10px;
background-color:white;
width:500px;
height:500px;
margin:0 auto;
margin-top:20px;
}

.courseBox{

border:1px solid white;
border-bottom:2px dashed #e6e5e5;
width:100%;
height:auto;
margin-top: 10px;
margin-bottom: 10px;
}
.courseDisplay{
border:1px solid black;
width:100px;
height:100px;
visibility:hidden;

}

.courseName{
margin-top: 5px;
margin-bottom: 10px;
}

.placeName{
display: inline-block;
margin-bottom: 10px;
}

.deletePlaceBtn{
display: inline-block;
cursor: pointer;
border: 1px solid #F6F5F5;
height:26px;
background-color:pink;
}

.deletePlaceBtn:hover {
color: #FF0000;
}

.deletePlaceBtn:active {
color: #FF8000;

}
.deletePlace{
width: auto;
}
.recommendCourse{
border: 1px solid white;
padding-top:10px;
padding-bottom:10px;
}
.recommendCourse:before{
content:'추천코스 : ';
}
.resultCourse{
display: inline-block;
margin-bottom: 10px;
}
.checkbox{
padding-top:10px;
padding-bottom:10px;
margin-left:10px;
margin-top:10px;
margin-bottom:10px;
}
.deleteCourseBtn{
border:1px solid #F6F6F6;
border-radius:5px;
background-color:#B2CCFF;
color:#5D5D5D;
font-weight:bold;
padding:5px 10px;

}
.deleteRecommendBtn{
border:1px solid #F6F6F6;
border-radius:5px;
background-color:#B2CCFF;
color:#5D5D5D;
font-weight:bold;
padding:5px 10px;
}
.leftTitle{
padding-bottom:10px;
font-weight:bold;
font-size:40px;
}
.rightTitle{
padding-bottom:10px;
font-weight:bold;
font-size:40px;
}
.letftTitleContainer{
margin-right:30px;
}
</style>
<script type="text/javascript"src="/resources/course/js/mycourse_list.js?ver=16"></script>
 <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">


$.ajax({
    method: "GET",
    url: "https://dapi.kakao.com/v2/search/image",
    data: { 
        query:"부산맛집"
     },
    headers:{ Authorization: "KakaoAK c54597009debc59db49dfb8d3e509e1f"
     },
}) 
 .done(function (msg) {
    
    console.log(msg.documents[0].image_url);
    console.log(msg.documents[0].x);
    $("p").append("<img src ="+msg.documents[0].image_url+" width='100' height='100'>");

 });
</script>
</head>
<body>
<div class="courseContainer">

<div class="letftTitleContainer">
	<div class="leftTitle">코스목록</div>
	<div class="courseLayoutLeft" id="courseLayoutLeft">
	<form action="/course/theShortestCourse" method="post" onsubmit="return checkCourseCode();">
		<input type="hidden" name="memberId" id="memberId" value="${sessionScope.loginInfo.memberId }">
		<c:forEach items="${courseList }" var="courseInfo">
			<div class="courseBox" id="courseBox">
				<div class="courseName">
					<input type="radio" name="courseCode" value="${courseInfo.courseCode }">코스이름 : <label for="${courseInfo.courseCode }">${courseInfo.courseName }</label>
				</div>
				<c:forEach items="${courseInfo.coursePlaceList}" var="placeInfo" varStatus="cnt">
					<c:choose>
						<c:when test="${cnt.last }">
			      	 		<div class="placeName">
								<input type="hidden" name="savePlaceCode" value="${placeInfo.savePlaceCode }">
			      	 			${placeInfo.placeName  } <input type="button" value="x" class="deletePlaceBtn">
								<div class="hiddenPlaceInfo">
									<input type="hidden" name="placeName" value="${placeInfo.placeName }">
									<input type="hidden" name="placeAddr" value="${placeInfo.placeAddr }">
									<input type="hidden" name="cateCode" value="${placeInfo.cateCode }">
									<input type="hidden" name="x" value="${placeInfo.x }">
									<input type="hidden" name="y" value="${placeInfo.y }">
								</div>
			      	 		</div>
						</c:when>
			      	 	<c:otherwise>
							<div class="placeName">
								<input type="hidden" name="savePlaceCode" value="${placeInfo.savePlaceCode }">
								${placeInfo.placeName  } <input type="button" value="x" class="deletePlaceBtn">
								<div class="hiddenPlaceInfo">
									<input type="hidden" name="placeName" value="${placeInfo.placeName }">
									<input type="hidden" name="placeAddr" value="${placeInfo.placeAddr }">
									<input type="hidden" name="cateCode" value="${placeInfo.cateCode }">
									<input type="hidden" name="x" value="${placeInfo.x }">
									<input type="hidden" name="y" value="${placeInfo.y }">
								</div>
							</div> &#10140;
			      	 	</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
	     </c:forEach>
	     <c:if test="${courseList ne null }">
			<div>
				<input type="submit" value="추천코스보기" onClick="clickRecommendCourse(this.value);" id="courseRecommendBtn" class="deleteRecommendBtn">
				<input type="button" value="코스삭제" class="deleteCourseBtn" onclick="deleteCourse();">
			</div>
	     </c:if>
	</form>
	<!-- 추천코스 출력 DIV -->
		<c:if test="${resultCourseList ne null}">
		<div class="recommendCourse">
			<c:forEach items="${resultCourseList}" var="resultCourseInfo" varStatus="cnt">
				<c:choose>
					<c:when test="${cnt.last }">
		      	 		<div class="resultCourse">
		      	 			${resultCourseInfo }
		      	 		</div>
					</c:when>
		      	 	<c:otherwise>
						<div class="resultCourse">
							${resultCourseInfo }
						</div> &#10140;
		      	 	</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		</c:if>
	</div>
	</div>
	<div class="RightTitleContainer">
		<div class="rightTitle">임시저장목록</div>
	<div class="courseLayoutRight" id="courseLayoutRight">
		<select id="selectCourseCode">
			<option>코스선택</option>
		<c:forEach items="${courseList }" var="courseInfo">
			<option value="${courseInfo.courseCode }">${courseInfo.courseName }</option>
		</c:forEach>
		</select>
		
		<input type="button" value="코스저장" id="saveCourseBtn" class="deleteRecommendBtn">
		<input type="button" value="선택삭제" id="deleteCourseBtn" class="deleteRecommendBtn">
      	<!-- 임시저장코스 출력Div -->
		<c:forEach items="${tempSaveCourseList }" var="tempSaveCourseInfo">
		<div id="testTwo">
			<div class="deletePlaceDiv row">
				<div>
					<div class="deletePlace col-11"><input type="checkbox" class="checkbox">${tempSaveCourseInfo.placeName }
						<input type="hidden" class="placeName" value="${tempSaveCourseInfo.placeName }">
						<input type="hidden" class="placeAddr" value="${tempSaveCourseInfo.placeAddr }">
						<input type="hidden" class="cateCode" value="${tempSaveCourseInfo.cateCode }">
						<input type="hidden" class="x" value="${tempSaveCourseInfo.x }">
						<input type="hidden" class="y" value="${tempSaveCourseInfo.y }">
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<div id="testOne"></div>
	</div>
	</div>
</div>



</body>
</html>