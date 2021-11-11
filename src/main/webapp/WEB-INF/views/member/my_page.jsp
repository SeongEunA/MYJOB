<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/member/js/my_page.js?ver=53"></script>
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
	height: 500px;
	border: 2px solid #f3f5f6;
	margin: 0 auto;
	margin-top: 80px;
	padding: 20px;
}
.myPageTableDiv td{
	height: 100%;
	padding-top: 10px;
	padding-bottom: 10px;
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
table td{
	height: 30px;
	border: 2px solid #b4b4bc;
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
.manageMyInfoBtnDiv{
	margin-top: 20px;
}
.updateMyInfoBtn{
	text-align: right;
}
.updateMyInfoBtn input[type="button"]{
	width: 100px;
	height: 30px;
}
.cancelMyInfoBtn{
	display: inline-block;
	margin-left: 5px;
}
#memberTel1{
	width: 20%;
	margin-right: 10px;
}
#memberTel2{
	width: 20%;
	margin-right: 10px;
}
#memberTel3{
	width: 20%;
}
#memberEmail1{
	width: 40%;
	margin-right: 10px;
}
#memberEmail2{
	width: 40%;
	margin-right: 10px;
}
#memberPw{
	width: 40%;
}
#confirmPw{
	width: 40%;
}
#memberAddr1{
	width: 68%;
}
#memberAddr2{
	width: 95%;
}
#noticePw{
	margin-top: 7px;
	margin-bottom: 3px;
	font-size: 14px;
}
#noticeCpw{
	margin-top: 7px;
	margin-bottom: 3px;
	font-size: 14px;
}
#noticeTel{
	margin-top: 7px;
	margin-bottom: 3px;
	font-size: 14px;
}
#noticeEmail{
	margin-top: 7px;
	margin-bottom: 3px;
	font-size: 14px;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-12 bodyContainer">
		<div class="col-7 myPageTitleDiv">
			<div class="col-12 myPageTitle">마이페이지입니다.</div>
		</div>
		<div class="col-7 myPageTableDiv">
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
							<td><span id="memberId">${detailMyInfo.memberId }</span><div>&nbsp;</div></td>
							<td>가입일</td>
							<td><span>${detailMyInfo.memberJoinDate }</span><div>&nbsp;</div></td>
						</tr>
						<tr>
							<td>회원이름</td>
							<td><span>${detailMyInfo.memberName }</span><div>&nbsp;</div></td>
							<td>성별</td>
							<td><span>${detailMyInfo.memberGender }</span><div>&nbsp;</div></td>
						</tr>
						<tr>
							<td>회원연락처</td>
							<td><span id="memberTel">${detailMyInfo.memberTel}</span><div id="noticeTel">&nbsp;</div></td>
							<td>회원이메일</td>
							<td><span id="memberEmail">${detailMyInfo.memberEmail }</span><div id="noticeEmail">&nbsp;</div></td>
						</tr>
						<tr id="addTr">
							<td>회원비밀번호</td>
							<td><span id="memberPw">${detailMyInfo.memberPw }</span><div id="noticePw">&nbsp;</div></td>
							<td>회원주소</td>
							<td id="memberAddr"><span id="memberAddr1">${detailMyInfo.memberAddr1 }</span><span id="memberAddr2">${detailMyInfo.memberAddr2 }</span><div>&nbsp;</div></td>
						</tr>
					</table>
					<div class="manageMyInfoBtnDiv">
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






