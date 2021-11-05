<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.courseContainer{

border:1px solid black;
width:1500px;
height:auto;
margin:0 auto;
display: flex;
flex-direction: row;
padding: 30px;
}

.courseLayoutLeft{

border:1px solid black;
width:800px;
height:auto;
display:flex;
flex-direction:column;
margin:0 auto;

}
.courseLayoutRight{

border:1px solid black;
width:500px;
height:500px;
margin:0 auto;

}

.courseBox{

border:1px solid red;
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
border: 1px solid black;
}

.deletePlaceBtn:hover {
color: #FF0000;
border: 1px solid #FF0000;;
}

.deletePlaceBtn:active {
color: #FF8000;
border: 1px solid #FF8000;;
}
.deletePlace{
width: auto;
}
</style>
<script type="text/javascript"src="/resources/course/js/mycourse_list.js?ver=8"></script>
 <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
function clickRecommendCourse(btnValue){
   if(btnValue=='추천코스보기'){
	   
      document.getElementById("courseDisplay").style="visibility:visible";
      document.getElementById("courseRecommendBtn").value="코스추천닫기";
      
   }
   else{
	   
      document.getElementById("courseDisplay").style="visibility:hidden";
      document.getElementById("courseRecommendBtn").value="추천코스보기";
      
   }
}

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
	<div class="courseLayoutLeft" id="courseLayoutLeft">
	<form action="/course/theShortestCourse" method="post">
		<input type="hidden" name="memberId" id="memberId" value="${sessionScope.loginInfo.memberId }">
		<c:forEach items="${courseList }" var="courseInfo">
			<div class="courseBox" id="courseBox">
				<div class="courseName">
					<input type="radio" name="courseCode" value="${courseInfo.courseCode }">코스이름:${courseInfo.courseName }
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
		<div>
			<span>
				<input type="submit" value="추천코스보기" onClick="clickRecommendCourse(this.value);" id="courseRecommendBtn">
			</span>
		</div>
	</form>
	</div>
	<div class="courseLayoutRight" id="courseLayoutRight">
		<select id="selectCourseCode">
			<option>코스선택</option>
		<c:forEach items="${courseList }" var="courseInfo">
			<option value="${courseInfo.courseCode }">${courseInfo.courseName }</option>
		</c:forEach>
		</select>
		
		<input type="button" value="코스저장" id="saveCourseBtn">
		<input type="button" value="선택삭제" id="deleteCourseBtn">
      	<!-- 임시저장코스 출력Div -->
		<c:forEach items="${tempSaveCourseList }" var="tempSaveCourseInfo">
		<div id="testTwo">
			<div class="deletePlaceDiv row">
				<div class="checkbox">
					<div class="deletePlace col-11" style="border:1px solid red"><input type="checkbox" class="checkbox">${tempSaveCourseInfo.placeName }
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
	<c:if test="${resultCourseList ne null}">
	<div class="courseLayoutBottom">
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
	</div>
	</c:if>
</div>



</body>
</html>