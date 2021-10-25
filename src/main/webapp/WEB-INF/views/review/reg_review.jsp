<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/review/js/reg_review.js?ver=1"></script>
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script> 
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">


<style type="text/css">
.container{
	width: 1100px;
	margin: 0 auto;
}
.tableDiv{
	width: 100%;
	height: 80px;
}
.tableDiv td{
	padding-top: 50px;
	padding-bottom: 50px;
	padding-left: 30px;
}
.tableDiv tr{
	border-top: 1.5px soild #f2f2f2;
	border-bottom: 1.5px solid #f2f2f2;
}
.introCourseDiv{
	width: 100%
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
</style>
</head>
<body>
	<div class="contentDiv">
		<form action="/review/regReview" method="post">
		<input type="hidden" name="reviewBoardWriter" value="${sessionScope.loginInfo.memberId }">
		<div class="headerDiv">
			코스선택 
			<select>
				<option></option>	
			</select>
			제목
			<input type="text" name="reviewBoardTitle" required>
		</div>
		<div class="tableDiv">
		</div>
		<div class="introCourseDiv">
			<textarea name="reviewBoardContent" id="csdesc" maxlength="2000" class="comment_textarea" title="코스 소개" style="" placeholder="코스에 대한 간략한 설명을 기재할 수 있습니다.">
			</textarea>
		</div>
<!-- 		<form name="fname"> <div class="dropzone" id="fileDropzone"></div> <button id="btn-upload-file">서버전송</button> </form>
 -->
		<div class="btn_center">
			<input type="button" value="취소" class="reg_back_btn" onclick="location.href='/review/SelectReviewList'">
			<input type="submit" value="등록" class="reg_btn" >
		</div>
		</form>
	</div>
</body>
</html>




