<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteMember(memberCode) {
		var result = confirm('정말로 삭제하시겠습니까?');
		if(result){
			location.href='/admin/deleteMember?memberCode=' + memberCode;
		}
		
	}
</script>
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
.deleteMemberBtnDiv{
	margin-top: 10px;
	text-align: right;
}
</style>
</head>
<body>
회원 관리 상세페이지입니다.
	<div class="container">
		<div>
			<table>
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="40%">
			</colgroup>
				<tr>
					<td>회원코드</td>
					<td>${detailMember.memberCode }</td>
					<td>회원주소</td>
					<td>${detailMember.memberAddr }</td>
				</tr>
				<tr>
					<td>회원아이디</td>
					<td>${detailMember.memberId }</td>
					<td>회원이메일</td>
					<td>${detailMember.memberEmail }</td>
				</tr>
				<tr>
					<td>회원이름</td>
					<td>${detailMember.memberName }</td>
					<td>관리자여부</td>
					<td>${detailMember.memberIsAdmin }</td>
				</tr>
				<tr>
					<td>회원비밀번호</td>
					<td>${detailMember.memberPw }</td>
					<td>성별</td>
					<td>${detailMember.memberGender }</td>
				</tr>
				<tr>
					<td>회원연락처</td>
					<td>${detailMember.memberTel }</td>
					<td>가입일</td>
					<td>${detailMember.memberJoinDate }</td>
				</tr>
			</table>
			<div class="deleteMemberBtnDiv"><input type="button" id="deleteMemberBtn" value="삭제" onclick="deleteMember('${detailMember.memberCode }');"></div>
		</div>
	</div>
</body>
</html>






