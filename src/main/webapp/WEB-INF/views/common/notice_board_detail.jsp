<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/common/css/reset.css?ver=1">
<script type="text/javascript" src="/resources/common/js/notice_board_detail.js?ver=4"></script>
<style type="text/css">
.container{
	width: 1000px;
	background-color: #eaeaea;
	margin-top: 100px;
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

.updateNoticeBoardBtnDiv{
	display: inline-block;
}

.deleteNoticeBoardBtnDiv{
	display: inline-block;
}

</style>
</head>
<body>
공지사항 상세페이지 입니다.
	<div class="bodyContainer col-12">
		<div class="containerDiv col-8">
			<div id="detailNoticeBoard" class="container">
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
						<td id="boardSubject">${detailNoticeBoard.boardSubject }</td>
						<td>${detailNoticeBoard.boardWriter }</td>
						<td>${detailNoticeBoard.regDate }</td>
					</tr>
					<tr>
						<td colspan="3">내 용</td>
					</tr>
					<tr class="contentTr">
						<td colspan="3" id="boardContent">${detailNoticeBoard.boardContent }</td>
					</tr>
				</table>
				<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' }">
					<div class="manageBtnDiv">
						<div class="updateNoticeBoardBtnDiv">
							<input type="button" id="updateNoticeBoard" value="수정"
								onclick="updateNoticeBoard('${detailNoticeBoard.noticeBoardCode }');">
						</div>
						<div class="deleteNoticeBoardBtnDiv">
							<input type="button" id="deleteNoticeBoard" value="삭제"
								onclick="deleteNoticeBoard('${detailNoticeBoard.noticeBoardCode }');">
						</div>
						<div>
							<input id="memberIsAdmin" type="hidden"
								value="${sessionScope.loginInfo.memberIsAdmin}">
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>




			






