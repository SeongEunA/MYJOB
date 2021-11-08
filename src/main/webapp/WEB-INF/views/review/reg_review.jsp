<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/review/js/reg_review.js?ver=6"></script>


<style type="text/css">
.reviewContainer{

}

.container{
	width: 1300px;
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
.reviewTitleContainer{
	border:1px solid white;
	border-bottom:2px solid black;
	height:50px;
	margin:0 auto;
	margin-top:50px;
}
.reviewTitleDiv{
	border:1px solid white;
	height:99%;
	font-size:35px;
	
}
.fileImgBox{
	border:1px solid black;
	max-width:100%;
	height:auto;
	display:flex;
	flex-direction: row;
	flex-wrap: wrap;
}
.fileImgDiv{
	
}
</style>
</head>
<body>
<div class="row">
	<div class="col-12 bodyContainer">
		<div class="col-8 reviewTitleContainer">
			<div class="col-6 reviewTitleDiv">
			후기등록
			</div>
		</div>
		<div class="col-9 containerDiv">
			<div class="contentDiv">
				<form action="/review/regReview" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="reviewBoardWriter"
						value="${sessionScope.loginInfo.memberId }">
					<div class="headerDiv">
						코스선택 <select>
							<option></option>
						</select> 제목 <input type="text" name="reviewBoardTitle" required>
					</div>
					<div class="tableDiv"></div>
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
							<input type="file" id="img" name="file" class="fileImgDiv"/>
							

						</div>
						<div id="pr_img_text"></div>
					</section>
				</div>


					<div class="btn_center">
						<input type="button" value="취소" class="reg_back_btn" onclick="location.href='/review/SelectReviewList'"> 
						<input type="submit" value="등록" class="reg_btn">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>	
</body>
</html>




