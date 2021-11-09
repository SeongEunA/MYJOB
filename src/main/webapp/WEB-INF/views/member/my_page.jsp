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
	padding:0px;
	margin: 0 auto;
	margin-top: 80px;
}
.myPageTitle{
	border-bottom: 5px solid #f3f5f6;
	padding: 5px;
	font-size: 20pt;
}
.myPageTableDiv{
	border: 2px solid #f3f5f6;
	margin: 0 auto;
	margin-top: 80px;
	padding: 20px;
}
.myPageTableDiv td{
	padding-top: 16px;
	padding-bottom: 16px;
	background-color: #ffffff;
}
.myPageTable{
	text-align: center;
	padding-left: 0px;
	padding-right: 0px;
}
table{
	width: 100%;
	margin: 0 auto;
	text-align: center;
}
table td:nth-child(odd){
	background-color: #f8f8f8;
}
#memberPw{
	padding: 5px;
}
#memberEmail{
	padding: 5px;
}
#memberTel{
	padding: 5px;
}
#memberAddr{
	padding: 5px;
}
table td{
	border: 2px solid #b4b4bc;
	padding: 10px;
}
.deleteMemberBtnDiv{
	margin: 0 auto;
	margin-bottom: 20px;
}
.deleteMemberBtn{
	text-align: right;
}
.deleteMemberBtn input[type="button"]{
	width: 100px;
	height: 30px;
}
.updateMyInfoBtnDiv{
	margin-top: 20px;
}
.updateMyInfoBtn{
	text-align: right;
}
.updateMyInfoBtn input[type="button"]{
	width: 100px;
	height: 30px;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-12 bodyContainer">
		<div class="col-6 myPageTitleDiv">
			<div class="col-12 myPageTitle">마이페이지입니다.</div>
		</div>
		<div class="col-6 myPageTableDiv">
			<div class="col-12 myPageTable">
			<div class="col-12 deleteMemberBtnDiv">
				<div class="col-12 deleteMemberBtn">
					<input type="button" id="deleteMember" value="회원탈퇴" onclick="deleteMember('${detailMyInfo.memberCode }');">
				</div>
			</div>
				<div id="detailMyInfo">
					<table>
						<colgroup>
							<col width="14%">
							<col width="36%">
							<col width="14%">
							<col width="36%">
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






