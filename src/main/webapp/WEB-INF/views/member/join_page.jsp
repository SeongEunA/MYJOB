<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/member/js/join_page.js?ver=009"></script>
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
	width: 100%;
}

.memberId{
	width: 70%;
	display: inline-block;
}

.memberId input[type="text"]{
	width: 100%
}

.idCheck{
	width: 25%;
	display: inline-block;
}

.memberTelDiv{
	width: 100%;
}

.memberTel1{
	width: 15%;
	display: inline-block;
	margin-right: 40px;
}

.memberTelDiv select{
	width: 100%;
}

.totalTel{
	width: 70%;
}

.memberTel2{
	width: 30%;
	display: inline-block;
	margin-right: 40px;
}

.memberTel2 input[type="text"]{
	width: 100%
}

.memberTel3{
	width: 35%;
	display: inline-block;
}

.memberTel3 input[type="text"]{
	width: 100%
}

.memberAddresDiv{
	width: 100%;
}

.memberAddr1{
	width: 70%;
	display: inline-block;
}

.memberAddr1 input[type="text"]{
	width: 100%
}

.searchAddr{
	width: 25%;
	display: inline-block;
}

.memberAddr2{
	margin-top: 30px;
}

.memberEmailDiv{
	width: 70%;
}

.memberEmail1{
	width: 50%;
	display: inline-block;
	margin-right: 15px;
}

.memberEmail1 input[type="text"]{
	width: 100%;
}

.memberEmail2{
	width: 45%;
	display: inline-block;
}
.memberEmail2 select{
	width: 100%;
}
.join{
	margin-top: 30px;
	margin-bottom: 30px;
}


#noticeId{
	margin-top: 7px;
	margin-bottom: 7px;
	font-size: 12px;
}
#noticeName{
	margin-top: 7px;
	margin-bottom: 7px;
	font-size: 12px;
}
#noticePw{
	margin-top: 7px;
	margin-bottom: 7px;
	font-size: 12px;
}
#noticeCpw{
	margin-top: 7px;
	margin-bottom: 7px;
	font-size: 12px;
}
#noticeTel{
	margin-top: 7px;
	margin-bottom: 7px;
	font-size: 12px;
}
#noticeAddres{
	margin-top: 7px;
	margin-bottom: 7px;
	font-size: 12px;
}
#noticeEmail{
	margin-top: 7px;
	margin-bottom: 7px;
	font-size: 12px;
}
</style>
</head>
<body>
	<div>
		<div class="containerDiv">
			<div class="joinDiv">
				<form action="/member/join" method="post" id="joinForm">
					<div class="memberIdDiv">
						<div>ID</div>
						<div>
							<div class="memberId"><input type="text" id="memberId" name="memberId" required></div>
							<div class="idCheck"><input type="button" id="idCheckbtn" value="중복확인" onclick="idCheck();"></div>
						</div>
						<div id="noticeId">&nbsp;</div>
					</div>
					<div class="memberNameDiv">
						<div>NAME</div>
						<div>
							<input type="text" id="memberName" name="memberName" required>
						</div>
						<div id="noticeName">&nbsp;</div>
					</div>
					<div class="memberPwDiv">
						<div>PASSWORD</div>
						<div>
							<input type="password" id="memberPw" name="memberPw" required>
						</div>
						<div id="noticePw">&nbsp;</div>
					</div>
					<div class="confirmPwDiv">
						<div>CONFIRM PASSWORD</div>
						<div>
							<input type="password" id="confirmPw">
						</div>
						<div id="noticeCpw">&nbsp;</div>
					</div>
					<div class="memberTelDiv">
						<div>TEL</div>
						<div class="totalTel">
							<div class="memberTel1">
								<select id="memberTel1" name="memberTels">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<div class="memberTel2"><input type="text" id="memberTel2" name="memberTels" required></div>
							<div class="memberTel3"><input type="text" id="memberTel3" name="memberTels" required></div>
						</div>
							<div id="noticeTel">&nbsp;</div>
					</div>
					<div class="memberAddresDiv">
						<div>ADDRESS</div>
						<div class="memberAddr1"><input type="text" id=memberAddr1 name="memberAddres" readonly placeholder="도로명/지번 주소"></div>
						<div class="searchAddr"><button type="button" onclick="openPostCode();" id="memberAddrBtn">주소검색</button></div>
						<div class="memberAddr2"><input type="text" id="memberAddr2" name="memberAddres" placeholder="상세 주소"></div>
						<div id="noticeAddres">&nbsp;</div>
					</div>
					<div class="memberEmailDiv">
						<div>EMAIL</div>
						<div class="memberEmail1"><input type="text" id="memberEmail1" name="memberEmails"></div>
						<div class="memberEmail2">
							<select id="memberEmail2" name="memberEmails">
								<option value="naver.com" selected>naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
							</select>
						</div>
						<div id="noticeEmail">&nbsp;</div>
					</div>
					<div class="genderDiv">
						<div>GENDER</div>
						<div>
							<input type="radio" name="memberGender" id="gender1" value="male" checked> 남자
							<input type="radio" name="memberGender" id="gender2" value="female"> 여자
						</div>
					</div>
					<div class="join">
						<input type="submit" id="joinBtn" value="J o i n" disabled>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

















