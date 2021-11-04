<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
.containerDiv{
	width: 700px;
	height: 750px;
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

.requiredDiv{
	margin-bottom: 30px;
	font-weight: bold;
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

.idCheckDiv{
	width: 25%;
	display: inline-block;
}

.memberTelDiv{
	width: 100%;
}

.memberTel1Div{
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

.memberTel2Div{
	width: 30%;
	display: inline-block;
	margin-right: 40px;
}

.memberTel2Div input[type="text"]{
	width: 100%
}

.memberTel3Div{
	width: 35%;
	display: inline-block;
}

.memberTel3Div input[type="text"]{
	width: 100%
}

.memberAddresDiv{
	width: 100%;
}

.memberAddr1Div{
	width: 70%;
	display: inline-block;
}

.memberAddr1Div input[type="text"]{
	width: 100%
}

.searchAddrDiv{
	width: 25%;
	display: inline-block;
}

.memberAddr2Div{
	margin-top: 10px;
}

.memberEmailDiv{
	width: 70%;
}

.memberEmail1Div{
	width: 50%;
	display: inline-block;
	margin-right: 15px;
}

.memberEmail1Div input[type="text"]{
	width: 100%;
}

.memberEmail2Div{
	width: 45%;
	display: inline-block;
}
.memberEmail2Div select{
	width: 100%;
}
.join{
	width: 100px;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 30px;
}
.required{
	color: red;
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
<script type="text/javascript" src="/resources/member/js/join_page.js?ver=17"></script>
</head>
<body>
	<div>
		<div class="containerDiv">
			<div class="requiredDiv">
				<span class="required">*</span>필수입력
			</div>
			<div class="joinDiv">
				<form action="/member/join" method="post" id="joinForm">
					<div class="memberIdDiv">
						<div><span class="required">*</span>아이디</div>
						<div>
							<div class="memberId"><input type="text" id="memberId" name="memberId" required></div>
							<div class="idCheckDiv"><input type="button" id="idCheckbtn" value="중복확인" onclick="idCheck();"></div>
						</div>
						<div id="noticeId">&nbsp;</div>
					</div>
					<div class="memberNameDiv">
						<div><span class="required">*</span>이름</div>
						<div>
							<input type="text" id="memberName" name="memberName" required>
						</div>
						<div id="noticeName">&nbsp;</div>
					</div>
					<div class="memberPwDiv">
						<div><span class="required">*</span>비밀번호</div>
						<div>
							<input type="password" id="memberPw" name="memberPw" required>
						</div>
						<div id="noticePw">&nbsp;</div>
					</div>
					<div class="confirmPwDiv">
						<div><span class="required">*</span>비밀번호 확인</div>
						<div>
							<input type="password" id="confirmPw" required>
						</div>
						<div id="noticeCpw">&nbsp;</div>
					</div>
					<div class="memberTelDiv">
						<div><span class="required">*</span>연락처</div>
						<div class="totalTel">
							<div class="memberTel1Div">
								<select id="memberTel1" name="memberTels">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<div class="memberTel2Div"><input type="text" id="memberTel2" name="memberTels" required></div>
							<div class="memberTel3Div"><input type="text" id="memberTel3" name="memberTels" required></div>
						</div>
							<div id="noticeTel">&nbsp;</div>
					</div>
					<div class="memberAddresDiv">
						<div>주소</div>
						<div class="memberAddr1Div"><input type="text" id=memberAddr1 name="memberAddres" readonly placeholder="도로명/지번 주소"></div>
						<div class="searchAddrDiv"><button type="button" onclick="openPostCode();" id="memberAddrBtn">주소검색</button></div>
						<div class="memberAddr2Div"><input type="text" id="memberAddr2" name="memberAddres" placeholder="상세 주소"></div>
						<div id="noticeAddres">&nbsp;</div>
					</div>
					<div class="memberEmailDiv">
						<div>EMAIL</div>
						<div class="memberEmail1Div"><input type="text" id="memberEmail1" name="memberEmails"></div>
						<div class="memberEmail2Div">
							<select id="memberEmail2" name="memberEmails">
								<option value="naver.com">naver.com</option>
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
						<input type="submit" id="joinBtn" value="회 원 가 입" onclick="goInsertMember();">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

