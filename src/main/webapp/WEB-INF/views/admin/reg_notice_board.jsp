<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/reg_notice_board.js?ver=1"></script>
<link rel="stylesheet" href="/resources/common/reset.css">
<style type="text/css">
.regNoticeTitleDiv{
	padding-top: 30px;
	padding-bottom: 30px;
}
.regNoticeTitle{
	border-bottom: 3px solid #AFDDFA;
	padding: 20px;
	font-size: 20pt;
}
.regNoticeWriteDiv{
	border: 1px solid blue;
	margin-top: 20px;
	margin-bottom: 20px;
}
.regNoticeWrite{
	border: 1px solid black;
	margin:0 auto;
	margin-top: 50px;
	margin-bottom: 50px;
	padding: 20px;
	font-size: 13px;
}
table{
	width: 100%;
	margin: 0 auto;
	padding-left: 20px;
}
tr{
	border: 1px solid black;
}
td{
	border: 1px solid black;
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
.boardSubject input[type="text"]{
	width: 100%;
}
.regNoticeBtnDiv{
	border: 1px solid red;
	margin-top: 20px;
}
.regNoticeBtn{
	border: 1px solid green;
	margin: 0 auto;
	text-align: center;
	width: 100px;
	height: 30px;
}
.regNoticeBtn input[type="button"]{
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-12 bodyContainer">
		<div class="col-10 regNoticeTitleDiv">
			<div class="col-12 regNoticeTitle">공지사항 등록페이지</div>
		</div>
		<div class="col-10 regNoticeWriteDiv">
			<div class="col-11 regNoticeWrite">
				<form action="/admin/regNoticeBoard" method="post" id="regNoticeBoardForm">
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
							<td class="boardSubject"><input type="text" name="boardSubject" required></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea cols="120%" rows="15" name="boardContent" style="resize: none;"></textarea></td>
						</tr>
					</table>
					<div class="regNoticeBtnDiv">
						<div class="regNoticeBtn">
							<input type="button" value="등록" onclick="regNoticeBoard();">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>