<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

}

.courseLayout{

border:1px solid black;
width:500px;
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
display:flex;
flex-direction:column;

}
.courseDisplay{

visibility:hidden;

}

</style>
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
   <div class="courseLayout">
      <div class="courseBox">
        as
      </div>
      <div class="courseBox">
         11
      </div>
      <div class="courseBox">
        22
      </div>
   </div>
   <div>
      <span>
      <input type="button" value="추천코스보기" onClick="clickRecommendCourse(this.value);" id="courseRecommendBtn">
      </span>
   </div>
   <div class="courseLayout courseDisplay" id="courseDisplay">
      
         추천코스동선
   
   </div>
   <p>이미지</p>
</div>



</body>
</html>