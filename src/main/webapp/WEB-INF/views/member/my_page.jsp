<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/my_page.js?ver=32"></script>
<style type="text/css">
.myPageTitleDiv{
	border: 1px solid red;
	padding-top: 30px;
	padding-bottom: 30px;
	margin:0 auto;
}
.myPageTitle{
	border: 1px solid orange;
	padding: 0 20px;
	margin: 0 auto;
	font-size: 20pt;
}
.myPageTableDiv{
	border: 1px solid blue;
	margin: 0 auto;
}
.myPageTable{
	border: 1px solid black;
	margin:0 auto;
	margin-top: 30px;
	margin-bottom: 30px;
	padding: 20px;
	font-size: 13px;
}
table{
	width: 100%;
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
	padding-bottom: 20px;
}
.deleteMemberBtn{
	border: 1px solid red;
	text-align: right;
}
.updateMyInfoBtnDiv{
	padding-top: 20px;
}
.updateMyInfoBtn{
	border: 1px solid red;
	text-align: right;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-12">
		<div class="col-8 myPageTitleDiv">
			<div class="col-12 myPageTitle">마이페이지입니다.</div>
		</div>
		<div class="col-8 myPageTableDiv">
			<div class="col-8 myPageTable">
				<div class="col-12 deleteMemberBtnDiv">
					<div class="deleteMemberBtn"><input type="button" id="deleteMember" value="회원탈퇴" onclick="deleteMember('${detailMyInfo.memberCode }');"></div>
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
					<div class="updateMyInfoBtnDiv">
						<div class="updateMyInfoBtn">
							<input type="button" id="updateMyInfo" value="수정" onclick="updateMyInfo('${detailMyInfo.memberCode }');">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>






