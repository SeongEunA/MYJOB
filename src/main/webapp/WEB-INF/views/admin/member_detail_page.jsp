<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	width: 1000px;
	background-color: #eaeaea;
	margin-top: 30px;
	padding: 30px;
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
.deleteMemberBtnDiv{
	margin-top: 10px;
	text-align: right;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<table>
				<tr>
					<td>회원코드</td>
					<td>${selectDetailMember.memberCode }</td>
					<td>회원주소</td>
					<td>${selectDetailMember.memberAddr }</td>
				</tr>
				<tr>
					<td>회원아이디</td>
					<td>${selectDetailMember.memberId }</td>
					<td>회원이메일</td>
					<td>${selectDetailMember.memberEmail }</td>
				</tr>
				<tr>
					<td>회원이름</td>
					<td>${selectDetailMember.memberName }</td>
					<td>관리자여부</td>
					<td>${selectDetailMember.memberIsAdmin }</td>
				</tr>
				<tr>
					<td>회원비밀번호</td>
					<td>${selectDetailMember.memberPw }</td>
					<td>성별</td>
					<td>${selectDetailMember.memberGender }</td>
				</tr>
				<tr>
					<td>회원연락처</td>
					<td>${selectDetailMember.memberTel }</td>
					<td>가입일</td>
					<td>${selectDetailMember.memberJoinDate }</td>
				</tr>
			</table>
			<div class="deleteMemberBtnDiv"><input type="button" id="deleteMemberBtn" value="삭제" onclick="location.href='/admin/deleteMember?memberCode=${selectDetailMember.memberCode }';"></div>
		</div>
	</div>
</body>
</html>






