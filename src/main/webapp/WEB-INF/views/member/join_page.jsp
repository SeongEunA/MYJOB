<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/member/js/join_page.js?ver=352"></script>
<style type="text/css">
.containerDiv{
	width: 700px;
	height: 700px;
	background-color: #EAEAEA;
	margin: 0 auto;
	margin-top: 30px;
	padding: 20px;
}
.containerDiv input[type="text"]{
	width: 70%;
}
.containerDiv input[type="password"]{
	width: 70%;
}
.memberIdDiv{
	width: 60%;
	display: inline-block;
}
.idCheckDiv{
	width: 30%;
	display: inline-block;
}
.selectTel1Div{
	width: 100px;
	display: inline-block;
}
.memberTel2Div{
	width: 200px;
	display: inline-block;
}
.memberTel3Div{
	width: 200px;
	display: inline-block;
}
.phoneCheckDiv{
	width: 100px;
	display: inline-block;
}
.memberEmail1Div{
	width: 25%;
	display: inline-block;
}
.memberEmail2Div{
	width: 25%;
	display: inline-block;
}
.memberAddr1Div{
	width: 500px;
	display: inline-block;
}
.searchAddrDiv{
	width: 100px;
	display: inline-block;
}
.memberAddr2Div{
	width: 500px;
	display: inline-block;
}
.memberEmail1Div{
	width: 200px;
	display: inline-block;
}
.memberEmail2Div{
	width: 200px;
	display: inline-block;
}
.emailCheckDiv{
	width: 200px;
	display: inline-block;
}

</style>
</head>
<body>
	<div>
		<div class="containerDiv">
			<div class="joinDiv">
				<form action="/member/join" method="post" id="joinForm">
					<div class="checkIdDiv" id="checkIdDiv">
						<div>ID</div>
						<div class="memberIdDiv">
							<input type="text" id="memberId" name="memberId" required>
						</div>
						<div class="idCheckDiv">
							<input type="button" id="idCheckbtn" value="중복확인" onclick="idCheck();">
						</div>
					</div>
					<div class="memberNameDiv">
						<div>NAME</div>
						<div>
							<input type="text" id="memberName" name="memberName" required>
						</div>
					</div>
					<div class="memberPwDiv">
						<div>PASSWORD</div>
						<div>
							<input type="password" id="memberPw" name="memberPw" required>
						</div>
					</div>
					<div class="confirmPwDiv">
						<div>CONFIRM PASSWORD</div>
						<div>
							<input type="password" id="confirmPw">
						</div>
					</div>
					<div class="memberTelsDiv" id="memberTelsDiv">
						<div class="selectTel1Div">
							<div>TEL</div>
							<div>
								<select id="memberTel1" name="memberTels">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
						</div>
						<div class="memberTel2Div">
							<input type="text" id="memberTel2" name="memberTels" required>
						</div>
						<div class="memberTel3Div">
							<input type="text" id="memberTel3" name="memberTels" required>
						</div>
						<div class="phoneCheckDiv">
							<input type="button" id="phoneCheck" value="휴대폰인증">
						</div>
					</div>
					<div class="memberAddresDiv">
						<div class="memberAddr1Div">
							<div>ADDRESS</div>
							<input type="text" id=memberAddr1 name="memberAddres" readonly placeholder="도로명/지번 주소">
						</div>
						<div class="searchAddrDiv">
							<button type="button" onclick="openPostCode();" id="memberAddrBtn">주소검색</button>
						</div>
						<div class="memberAddr2Div">
							<input type="text" id="memberAddr2" name="memberAddres" placeholder="상세 주소">
						</div>
					</div>
					<div class="memberEmailDiv" id="memberEmailDiv">
						<div class="memberEmail1Div">
							<div>EMAIL</div>
							<input type="text" id="memberEmail1" name="memberEmails">
						</div>
						<div class="memberEmail2Div">
							<select id="memberEmail2" name="memberEmails">
								<option value="naver.com" selected>naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
							</select>
						</div>
						<div class="emailCheckDiv">
							<input type="button" id="emailCheck" value="이메일인증">
						</div>
					</div>
					<div>
						<div>
							<div>GENDER</div>
						</div>
						<div>
							<input type="radio" name="memberGender" id="gender1" value="male" checked> 남자
							<input type="radio" name="memberGender" id="gender2" value="female"> 여자
						</div>
					</div>
					<div>
						<input type="submit" id="joinBtn" value="J o i n" disabled>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

















