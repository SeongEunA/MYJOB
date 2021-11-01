<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt" %>

<%@ taglib prefix="fmt3" uri="http://java.sun.com/jstl/fmt_rt" %>

<jsp:useBean id="today" class="java.util.Date"/>

<jsp:useBean id="sysdate" class="java.util.Date"/>

<fmt2:formatDate value="${today }" pattern="yyyy-MM-dd" var="today"/>

<fmt3:formatDate value="${sysdate }" pattern="HH:mm:ss" var="sysdate"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
공지사항 등록페이지
<form action="/admin/regNoticeBoard" method="post">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="BOARD_SUBJECT" required></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="BOARD_WRITER" value="${sessionScope.loginInfo.memberId }" readonly></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><input type="date" name="REG_DATE" value="${today }" readonly></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="60" rows="5" name="BOARD_CONTENT"></textarea></td>
		</tr>
	</table>
	<div class="btnDiv">
		<input type="submit" class="btn" value="등록">
	</div>
</form>
</body>
</html>