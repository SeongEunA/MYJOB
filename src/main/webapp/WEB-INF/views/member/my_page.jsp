<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/my_page.js?ver=27"></script>
<style type="text/css">
.container{
	width: 1000px;
	background-color: #eaeaea;
	margin-top: 30px;
	padding: 30px;
	font-size: 12px;
}

table{
	width: 940px;
	margin: 0 auto;
	text-align: center;
}

tr{
	border: 1px solid black;
}

td{
	border: 1px solid black;
	padding: 10px;
	
}
.manageBtnDiv1{
	margin-bottom: 10px;
	text-align: right;
}
.manageBtnDiv2{
	margin-top: 10px;
	text-align: right;
}

.deleteMemberBtnDiv{
	display: inline-block;
}

.updateMyInfoBtnDiv{
	display: inline-block;
}

</style>
</head>
<body>
마이페이지입니다.
	<div class="container">
		<div>
			<div class="manageBtnDiv1">
				<div class="deleteMemberBtnDiv"><input type="button" id="deleteMember" value="회원탈퇴" onclick="deleteMember('${detailMyInfo.memberCode }');"></div>
			</div>
			<div id="detailMyInfo">
				<table>
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="10%">
						<col width="40%">
					</colgroup>
					<tr>
						<td>회원아이디</td>
						<td>${detailMyInfo.memberId }</td>
						<td>가입일</td>
						<td>${detailMyInfo.memberJoinDate }</td>
					</tr>
					<tr>
						<td>회원이름</td>
						<td>${detailMyInfo.memberName }</td>
						<td>성별</td>
						<td>${detailMyInfo.memberGender }</td>
					</tr>
					<tr>
						<td>회원비밀번호</td>
						<td id="memberPw">${detailMyInfo.memberPw }</td>
						<td>회원이메일</td>
						<td id="memberEmail">${detailMyInfo.memberEmail }</td>
					</tr>
					<tr>
						<td>회원연락처</td>
						<td id="memberTel">${detailMyInfo.memberTel }</td>
						<td>회원주소</td>
						<td id="memberAddr">${detailMyInfo.memberAddr }</td>
					</tr>
				</table>
				<div class="manageBtnDiv2">
					<div class="updateMyInfoBtnDiv">
						<input type="button" id="updateMyInfo" value="수정" onclick="updateMyInfo('${detailMyInfo.memberCode }');">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>






