<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/login_page.js?ver=29"></script>
<style type="text/css">
.container{
	width: 500px;
	background-color: #eaeaea;
	margin-top: 30px;
	padding: 30px;
}
.loginDiv{
	width: 440px;
	margin: 0 auto;
	background-color: #dddddd;
}
.checkIdDiv{
	padding: 10px;
}
.checkIdDiv input[type="text"]{
	width: 100%;
}
.checkPwDiv{
	padding: 10px;
}
.checkPwDiv input[type="password"]{
	width: 100%;
}
.loginDiv{
	padding: 10px;
}
.loginBtnDiv{
	padding: 10px;
	text-align: center;
}
.loginBtn{
	width: 100%;
}
#noticeLogin{
	margin-top: 7px;
	margin-bottom: 7px;
	font-size: 12px;
	padding-left:  10px;
}
</style>
</head>
<body>
<div class="container">
	<div class="loginDiv">
		<form action="/member/login" method="post" id="loginInfoForm">
			<input type="hidden" name="prevRequestUrl" value="${prevRequestUrl }">
			<div class="checkIdDiv" id="checkIdDiv">
				<div>ID</div>
				<div><input type="text" id="memberId" name="memberId"></div>
			</div>
			<div class="checkPwDiv" id="checkPwDiv">
				<div>PASSWORD</div>
				<div><input type="password" id="memberPw" name="memberPw"></div>
			</div>
			<div id="noticeLogin">&nbsp;</div>
			<div class="loginBtnDiv">
				<input type="button" class="loginBtn" value="L o g i n" onclick="loginCheck();">
			</div>
		</form>
	</div>
</div>
</body>
</html>