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
width:1200px;
height:600px;
margin:0 auto;
display: flex;
flex-direction: row;
}

.courseLayoutLeft{

border:1px solid black;
width:500px;
height:500px;
display:flex;
flex-direction:column;
margin:0 auto;
margin-top:30px;

}
.courseLayoutRight{

border:1px solid black;
width:300px;
height:500px;
display:flex;
flex-direction:column;
margin:0 auto;
margin-top:30px;

}

.courseBox{

border:1px solid red;
width:100%;
height:20%;

}
.courseDisplay{

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
</style>
<script type="text/javascript"src="/resources/course/js/mycourse_list.js?ver=8"></script>
 <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
function clickRecommendCourse(btnValue){
   if(btnValue=='추천코스보기'){
      document.getElementById("courseDisplay").style="visibility:visible";
      document.getElementById("courseRecommendBtn").value="코스추천닫기";
      console.log("if");
      console.log(btnValue);
   }
   else{
      document.getElementById("courseDisplay").style="visibility:hidden";
      document.getElementById("courseRecommendBtn").value="추천코스보기";
      console.log("else");
      console.log(btnValue);
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
	<div class="courseLayoutLeft">
		<c:forEach items="${courseList }" var="courseInfo">
			<div class="courseBox">
				<div class="courseName">코스이름:${courseInfo.courseName }</div>
				<c:forEach items="${courseInfo.coursePlaceList}" var="placeInfo" varStatus="cnt">
					<c:choose>
						<c:when test="${cnt.last }">
			      	 		<div class="placeName">
			      	 			${placeInfo.placeName  } <input type="button" value="x" class="deletePlaceBtn">
			      	 		</div>
						</c:when>
			      	 	<c:otherwise>
							<div class="placeName">
								<input type="hidden" name="savePlaceCode" value="${placeInfo.savePlaceCode }">
								${placeInfo.placeName  } <input type="button" value="x" class="deletePlaceBtn">
								<div class="hiddenPlaceInfo">
									<input type="hidden" name="placeAddr" value="${placeInfo.placeAddr }">
									<input type="hidden" name="placeTel" value="${placeInfo.placeTel }">
									<input type="hidden" name="cateCode" value="${placeInfo.cateCode }">
									<input type="hidden" name="courseCode" value="${placeInfo.courseCode }">
								</div>
							</div> &#10140;
			      	 	</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
	     </c:forEach>
	</div>
	<div class="courseLayoutRight" id="courseLayoutRight">
	</div>
   <div>
      <span>
      <input type="button" value="추천코스보기" onClick="clickRecommendCourse(this.value);" id="courseRecommendBtn">
      </span>
   </div>
 <!--   <div class="courseLayoutLeft courseDisplay" id="courseDisplay">
      
         추천코스동선
   
   </div>
   <p>이미지</p> -->
</div>



</body>
</html>