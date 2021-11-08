<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.joinTitleDiv{
	margin:0 auto;
	margin-top:80px;
}
.joinTitle{
	border-bottom: 5px solid #f3f5f6;
	padding: 5px;
	margin: 0 auto;
	font-size: 20pt;
}
.joinInfoDiv{
	margin: 0 auto;
	margin-top: 80px;
	background-color: #f3f5f6;
	padding: 20px;
}
.requiredDiv{
	padding-bottom: 20px;
}
.required{
	color: red;
}
.memberId{
	display: inline-block;
	margin-right: 8px;
}
.idCheck{
	display: inline-block;
}
.idCheck input[type="button"]{
	width: 100px;
	height: 25px;
	color: #ffffff;
	background-color: #000080;
	border: white;
}
.joinInfoDiv input[type="text"]{
	width: 300px;
}
.memberIdDiv input[type="text"]{
	width: 300px;
}
.memberPwDiv input[type="password"]{
	width: 300px;
}
.confirmPwDiv input[type="password"]{
	width: 300px;
}
.totalTel input[type="text"]{
	width: 100px;
}
.totalTel{
	width: 300px;
}
.memberTel1Div{
	width: 24%;
	display: inline-block;
	margin-right: 8px;
}
.memberTel1Div select{
	width: 100%;
}
.memberTel2Div{
	display: inline-block;
	margin-right: 8px;
}
.memberTel3Div{
	display: inline-block;
}
.memberIdDiv div:first-child{
	padding-bottom: 10px;
}
.memberNameDiv div:first-child{
	padding-bottom: 10px;
}
.memberPwDiv div:first-child{
	padding-bottom: 10px;
}
.confirmPwDiv div:first-child{
	padding-bottom: 10px;
}
.memberTelDiv div:first-child{
	padding-bottom: 10px;
}
.memberAddresDiv div:first-child{
	padding-bottom: 10px;
}
.memberEmailDiv div:first-child{
	padding-bottom: 10px;
}
.memberGenderDiv div:first-child{
	padding-bottom: 10px;
}
.memberAddr1Div{
	display: inline-block;
	margin-bottom: 20px;
	margin-right: 8px;
}
.searchAddrDiv{
	display: inline-block;
}
.searchAddrDiv input[type="button"]{
	width: 100px;
	height: 25px;
	color: #ffffff;
	background-color: #000080;
	border: white;
}
.memberEmailDiv{
	width: 300px;
}
.memberEmail1Div{
	width: 50%;
	margin-right: 8px;
	display: inline-block;
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
.joinBtnDiv{
	margin-top: 20px;
}
.joinBtn{
	margin: 0 auto;
	text-align: center;
}
.joinBtn input[type="button"]{
	width: 100%;
	height: 50px;
	color: #ffffff;
	background-color: #000080;
	border: white;
	
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
<script type="text/javascript" src="/resources/member/js/join_page.js?ver=9"></script>
</head>
<body>
<div class="row">
	<div class="col-12 bodyContainer">
		<div class="col-5 joinTitleDiv">
			<div class="col-12 joinTitle">회원가입</div>
		</div>
		<div class="col-4 joinInfoDiv">
			<div class="col-12 joinInfo">
				<div class="requiredDiv">
					<span class="required">*</span>&nbsp;는 필수입력입니다.
				</div>
				<form action="/member/join" method="post" id="joinForm">
					<div class="memberIdDiv">
						<div><span class="required">*</span>&nbsp;아이디</div>
						<div class="memberId"><input type="text" id="memberId" name="memberId" required></div>
						<div class="idCheck"><input type="button" id="idCheckbtn" value="중복확인" onclick="idCheck();"></div>
						<div id="noticeId">&nbsp;</div>
					</div>
					<div class="memberNameDiv">
						<div><span class="required">*</span>&nbsp;이름</div>
						<div>
							<input type="text" id="memberName" name="memberName" required>
						</div>
						<div id="noticeName">&nbsp;</div>
					</div>
					<div class="memberPwDiv">
						<div><span class="required">*</span>&nbsp;비밀번호</div>
						<div>
							<input type="password" id="memberPw" name="memberPw" required>
						</div>
						<div id="noticePw">&nbsp;</div>
					</div>
					<div class="confirmPwDiv">
						<div><span class="required">*</span>&nbsp;비밀번호 확인</div>
						<div>
							<input type="password" id="confirmPw" required>
						</div>
						<div id="noticeCpw">&nbsp;</div>
					</div>
					<div class="memberTelDiv">
						<div><span class="required">*</span>&nbsp;연락처</div>
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
						<div class="searchAddrDiv"><input type="button" id="memberAddrBtn" onclick="openPostCode();" value="주소검색"></div>
						<div class="memberAddr2Div"><input type="text" id="memberAddr2" name="memberAddres" placeholder="상세 주소"></div>
						<div id="noticeAddres">&nbsp;</div>
					</div>
					<div class="memberEmailDiv">
						<div>이메일</div>
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
					<div class="memberGenderDiv">
						<div>성별</div>
						<div>
							<input type="radio" name="memberGender" id="gender1" value="male" checked> 남자
							<input type="radio" name="memberGender" id="gender2" value="female"> 여자
						</div>
					</div>
					<div class="joinBtnDiv">
						<div class="joinBtn"><input type="button" id="joinBtn" value="회 원 가 입" onclick="goInsertMember();"></div>
					</div>
				</form>
			</div>
		</div>
	</div><!-- bodyContainer -->
</div>
</body>
</html>

