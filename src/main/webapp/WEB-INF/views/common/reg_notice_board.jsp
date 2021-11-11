<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/reg_notice_board.js?ver=2"></script>
<link rel="stylesheet" href="/resources/common/reset.css">
<style type="text/css">
.regNoticeTitleDiv{
	padding:0px;
	margin: 0 auto;
	margin-top: 80px;
}
.regNoticeTitle{
	border-bottom: 5px solid #f3f5f6;
	padding: 5px;
	font-size: 20pt;
}
.regNoticeWriteDiv{
	border: 2px solid #f3f5f6;
	margin: 0 auto;
	margin-top: 80px;
	padding: 20px;
	padding-bottom: 20px;
}
.regNoticeWriteDiv td{
	padding-top: 16px;
	padding-bottom: 16px;
	background-color: #ffffff;
	margin-left: 200px;
}
.regNoticeWrite{
	text-align: center;
	padding-left: 0px;
	padding-right: 0px;
}
table td:nth-child(odd){
	background-color: #f8f8f8;
}
table{
	width: 100%;
	margin: 0 auto;
	padding-left: 20px;
}
table td{
	border: 2px solid #b4b4bc;
	padding: 15px;
}

table td:first-child{
	text-align: center;
}
.boardWriter input[type="text"]{
	border: white;
	outline-color: white;
}
.regDate input[type="text"]{
	border: white;
	outline-color: white;
}
.boardWriter{
	text-align: left;
}
.regDate{
	text-align: left;
}
.boardSubject input[type="text"]{
	width: 100%;
}
textarea{
	width: 100%;
}
.manageNoticeBtnDiv{
	margin-top: 20px;
	text-align: center;
}
.regNoticeBtn{
	margin: 0 auto;
	display: inline-block;
	margin-right: 5px;
	width: 100px;
	height: 30px;
}
.regNoticeBtn input[type="button"]{
	width: 100%;
	height: 100%;
}
.cencelNoticeBtn{
	margin: 0 auto;
	display: inline-block;
	width: 100px;
	height: 30px;
}
.cencelNoticeBtn input[type="button"]{
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-12 bodyContainer">
		<div class="col-6 regNoticeTitleDiv">
			<div class="col-12 regNoticeTitle">공지사항 등록페이지</div>
		</div>
		<div class="col-6 regNoticeWriteDiv">
			<div class="col-12 regNoticeWrite">
				<form action="/common/regNoticeBoard" method="post" id="regNoticeBoardForm">
					<table>
						<tr>
							<td>작성자</td>
							<td class="boardWriter"><input type="text" name="boardWriter" value="${sessionScope.loginInfo.memberId }" readonly></td>
						</tr>
						<tr>
							<td>등록일</td>
							<td class="regDate"><input type="text" name="regDate" value="${nowDate }" readonly></td>
						</tr>
						<tr>
							<td>제목</td>
							<td class="boardSubject"><input id="boardSubject" type="text" name="boardSubject" required></td>
						</tr>
						<tr>
							<td style="vertical-align: top;">내용</td>
							<td><textarea cols="70" rows="10" id="boardContent" name="boardContent" style="resize: none;"></textarea></td>
						</tr>
					</table>
					<div class="manageNoticeBtnDiv">
						<div class="regNoticeBtn">
							<input type="button" value="등록" onclick="regNoticeBoard();">
						</div>
						<div class="cencelNoticeBtn">
							<input type="button" value="취소" onclick="cencelNoticeBoard();">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>