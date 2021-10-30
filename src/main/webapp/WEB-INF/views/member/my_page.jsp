<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteMember(memberCode) {
		var result = confirm('정말로 탈퇴하시겠습니까?');
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
.manageBtnDiv{
	margin-top: 10px;
	text-align: right;
}
.UpdateDetailMyInfoBtnDiv{
	display: inline-block;
}

.DeleteDetailMyInfoBtnDiv{
	display: inline-block;
}

</style>
</head>
<body>
마이페이지입니다.
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
					<td>회원아이디</td>
					<td>${detailMyInfo.memberId }</td>
					<td>회원주소</td>
					<td>${detailMyInfo.memberAddr }</td>
				</tr>
				<tr>
					<td>회원이름</td>
					<td>${detailMyInfo.memberName }</td>
					<td>회원이메일</td>
					<td>${detailMyInfo.memberEmail }</td>
				</tr>
				<tr>
					<td>회원비밀번호</td>
					<td>${detailMyInfo.memberPw }</td>
					<td>성별</td>
					<td>${detailMyInfo.memberGender }</td>
				</tr>
				<tr>
					<td>회원연락처</td>
					<td>${detailMyInfo.memberTel }</td>
					<td>가입일</td>
					<td>${detailMyInfo.memberJoinDate }</td>
				</tr>
			</table>
			<div class="manageBtnDiv">
				<div class="UpdateDetailMyInfoBtnDiv"><input type="button" id="deleteMemberBtn" value="수정"></div>
				<div class="DeleteDetailMyInfoBtnDiv"><input type="button" id="deleteMemberBtn" value="회원탈퇴" onclick="deleteMember('${detailMyInfo.memberCode }');"></div>
			</div>
		</div>
	</div>
</body>
</html>






