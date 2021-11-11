<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/member_detail.js?ver=3"></script>
<style type="text/css">
.memberDetailTitleDiv{
	padding:0px;
	margin-top: 80px;
	margin-left: 200px;
}
.memberDetailTitle{
	border-bottom: 5px solid #f3f5f6;
	padding: 5px;
	font-size: 20pt;
}
.memberContentDiv{
	border: 2px solid #f3f5f6;
	margin-top: 80px;
	margin-left: 200px;
	padding: 20px;
}
.memberContentDiv td{
	padding-top: 16px;
	padding-bottom: 16px;
	background-color: #ffffff;
}
.memberContent{
	text-align: center;
	padding-left: 0px;
	padding-right: 0px;
}
table{
	width: 100%;
}
table td:nth-child(odd){
	background-color: #f8f8f8;
}
table td{
	border: 2px solid #b4b4bc;
	padding: 10px;
}

.deleteMemberBtnDiv{
	margin-top: 10px;
	text-align: right;
}
.deleteMemberBtn{
	display: inline-block;
	text-align: right;
}
.deleteMemberBtn input[type="button"]{
	margin: 0 auto;
	border: 3px solid #1F50B5;
	border-radius: 5px;
	color: #fff;
	background:#1F50B5;
	text-transform: uppercase;
	font-size: 1em;
	font-weight: bold;
	letter-spacing: .1em;
	font-family: "Roboto Condensed", sans-serif;
	cursor: pointer;
	transition: all .5s;
	text-align:center;
	box-shadow:inset 0 0 0 0 gray;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-12 bodyContainer">
		<div class="col-7 memberDetailTitleDiv">
			<div class="col-12 memberDetailTitle">회원 상세페이지</div>
		</div>
		<div class="col-7 memberContentDiv">
			<div class="col-12 memberContent">
				<table>
				<colgroup>
					<col width="14%">
					<col width="*%">
					<col width="14%">
					<col width="*%">
				</colgroup>
					<tr>
						<td>회원코드</td>
						<td>${detailMember.memberCode }</td>
						<td>회원주소</td>
						<td>${detailMember.memberAddr1 }&nbsp;${detailMember.memberAddr2 }</td>
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
				<div class="deleteMemberBtnDiv">
					<div class="deleteMemberBtn">
						<input type="button" id="deleteMemberBtn" value="삭제" onclick="deleteMember('${detailMember.memberCode }');">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>






