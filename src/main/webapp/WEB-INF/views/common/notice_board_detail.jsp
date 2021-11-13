<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/common/js/notice_board_detail.js?ver=5"></script>
<style type="text/css">
.noticeDetailTitleDiv{
	margin:0 auto;
	padding:0px;
	margin-top: 80px;
}
.noticeDetailTitle{
	border-bottom: 5px solid #f3f5f6;
	padding: 5px;
	margin: 0 auto;
	font-size: 20pt;
}
.noticeContentDiv{
	border: 2px solid #f3f5f6;
	margin: 0 auto;
	margin-top: 80px;
	padding: 20px;
}
.noticeContentDiv td{
	padding-top: 16px;
	padding-bottom: 16px;
	background-color: #ffffff;
}
.noticeContent{
	text-align: center;
	padding-left: 0px;
	padding-right: 0px;
}
.firstLine td{
	background-color: #f8f8f8;
}
.thirdLine td{
	background-color: #f8f8f8;
}
#boardSubject{
	padding: 5px;
}
#boardContent{
	padding-left: 10px;
}
table td{
	border: 2px solid #b4b4bc;
	padding: 10px;
}
.contentTr td {
	height: 200px;
	text-align: left;
}

.manageBtnDiv{
	margin-top: 10px;
	text-align: right;
}

.updateNoticeBoardBtnDiv{
	display: inline-block;
	margin-right: 5px;
}
.updateNoticeBoardBtnDiv input[type="button"]{
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
.deleteNoticeBoardBtnDiv{
	display: inline-block;
}
.deleteNoticeBoardBtnDiv input[type="button"]{
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
.cancelNoticeBoardBtnDiv{
	display: inline-block;
}
.cancelNoticeBoardBtnDiv input[type="button"]{
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
	<div class="bodyContainer col-12">
		<div class="col-7 noticeDetailTitleDiv">
			<div class="col-12 noticeDetailTitle">공지사항 상세페이지</div>
		</div>
		<div class="col-7 noticeContentDiv">
			<div class="col-12 noticeContent">
				<table>
				<colgroup>
					<col width="*%">
					<col width="10%">
					<col width="10%">
				</colgroup>
					<tr class="firstLine">
						<td>제 목</td>
						<td>작성자</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td id="boardSubject">${detailNoticeBoard.boardSubject }</td>
						<td>${detailNoticeBoard.boardWriter }</td>
						<td>${detailNoticeBoard.regDate }</td>
					</tr>
					<tr class="thirdLine">
						<td colspan="3">내 용</td>
					</tr>
					<tr class="contentTr">
						<td colspan="3" id="boardContent"><pre>${detailNoticeBoard.boardContent }</pre></td>
					</tr>
				</table>
				<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' }">
					<div class="manageBtnDiv">
						<div class="updateNoticeBoardBtnDiv"><input type="button" id="updateNoticeBoard" value="수정" onclick="updateNoticeBoard('${detailNoticeBoard.noticeBoardCode }');"></div>
						<div class="deleteNoticeBoardBtnDiv"><input type="button" id="deleteNoticeBoard" value="삭제" onclick="deleteNoticeBoard('${detailNoticeBoard.noticeBoardCode }');"></div>
						<div><input id="memberIsAdmin" type="hidden" value="${sessionScope.loginInfo.memberIsAdmin}"></div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>
</body>
</html>




			






