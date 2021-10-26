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

.contentTr td {
	height: 200px;
	vertical-align: middle;
}

.manageBtnDiv{
	margin-top: 10px;
	text-align: right;
}

.updateNoticeBoardDiv{
	display: inline-block;
}

.deleteNoticeBoardDiv{
	display: inline-block;
}

</style>
</head>
<body>
공지사항 상세관리페이지 입니다.
<div class="container">
	<div>
		<table>
		<colgroup>
			<col width="85%">
			<col width="5%">
			<col width="10%">
		</colgroup>
			<tr>
				<td>제 목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>${detailNoticeBoard.boardSubject }</td>
				<td>${detailNoticeBoard.boardWriter }</td>
				<td>${detailNoticeBoard.regDate }</td>
			</tr>
			<tr>
				<td colspan="3">내 용</td>
			</tr>
			<tr class="contentTr">
				<td colspan="3">${detailNoticeBoard.boardContent }</td>
			</tr>
		</table>
		<div class="manageBtnDiv">
			<div class="updateNoticeBoardDiv"><input type="button" id="" value="수정" onclick=""></div>
			<div class="deleteNoticeBoardDiv"><input type="button" id="" value="삭제" onclick=""></div>
		</div>
	</div>
</div>
</body>
</html>




			






