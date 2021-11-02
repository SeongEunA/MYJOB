<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/reg_notice_board.js?ver=1"></script>
</head>
<body>
공지사항 등록페이지
<form action="/admin/regNoticeBoard" method="post" id="regNoticeBoardForm">
	<table>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="boardWriter" value="${sessionScope.loginInfo.memberId }" readonly></td>
		</tr>
		<tr>
			<td>등록일</td>
			<td><input type="text" name="regDate" value="${nowDate }" readonly></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="boardSubject" required></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="140" rows="15" name="boardContent" style="resize: none;"></textarea></td>
		</tr>
	</table>
	<div>
		<input type="button" value="등록" onclick="regNoticeBoard();">
	</div>
</form>
</body>
</html>