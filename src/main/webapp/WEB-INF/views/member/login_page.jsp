<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/common/css/reset.css">
<script type="text/javascript" src="/resources/member/js/login_page.js?ver=31"></script>
<style type="text/css">
.loginTitleDiv{
	margin:0 auto;
	margin-top: 80px;
}
.loginTitle{
	border-bottom: 5px solid #f3f5f6;
	padding: 5px;
	margin: 0 auto;
	font-size: 20pt;
}
.loginInfoDiv{
	margin: 0 auto;
	margin-top: 80px;
}
.loginInfo{
	background-color: #f3f5f6;
}
.memberIdDiv div:first-child{
	padding-top: 30px;
	padding-bottom: 10px;
	width: 30%;
	margin: 0 auto;
}
.memberIdDiv div:last-child{
	text-align: center;
}
.memberIdDiv div:last-child input[type="text"]{
	width: 30%;
	height: 40px;
	font-size: 20px;
	border: white;
}
.memberPwDiv div:first-child{
	padding-top: 10px;
	padding-bottom: 10px;
	width: 30%;
	margin: 0 auto;
}
.memberPwDiv div:last-child{
	text-align: center;
}
.memberPwDiv div:last-child input[type="password"]{
	width: 30%;
	height: 40px;
	font-size: 20px;
	border: white;
}
.loginBtnDiv{
	padding-bottom: 30px;
}
.loginBtn{
	width: 30%;
	margin: 0 auto;
}
.loginBtn input[type="button"]{
	width: 100%;
	height: 50px;
	color: #ffffff;
	background-color: #000080;
	border: 3px solid white;
	outline-color: black;
	
}
#noticeLogin{
	width: 30%;
	margin: 0 auto;
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 15px;
}

</style>
</head>
<body>
	<div class="row">
		<div class="col12 bodyContainer">
			<div class="col-5 loginTitleDiv">
				<div class="col-12 loginTitle">로그인</div>
			</div>
			<div class="col-12 loginInfoDiv">
				<div class="col-12 loginInfo">
					<form action="/member/login" method="post" id="loginInfoForm">
						<input type="hidden" name="prevRequestUrl" value="${prevRequestUrl }">
						<div class="memberIdDiv">
							<div>아이디</div>
							<div><input type="text" id="memberId" name="memberId"></div>
						</div>
						<div class="memberPwDiv">
							<div>비밀번호</div>
							<div><input type="password" id="memberPw" name="memberPw"></div>
						</div>
						<div id="noticeLogin">&nbsp;</div>
						<div class="loginBtnDiv">
							<div class="loginBtn" ><input type="button" value="놀 러 가 기" onclick="loginCheck();"></div>
						</div>
					</form>
				</div>
			</div>
		</div><!-- bodyContainer -->
	</div><!-- row -->
</body>
</html>