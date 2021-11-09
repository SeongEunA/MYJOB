<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/reply_detail_manage.js?ver=5"></script>
<style type="text/css">
.replyDetailTitleDiv{
	padding:0px;
	margin-top: 80px;
	margin-left: 200px;
}
.replyDetailTitle{
	border-bottom: 5px solid #f3f5f6;
	padding: 5px;
	font-size: 20pt;
}
.replyContentDiv{
	border: 2px solid #f3f5f6;
	margin-top: 80px;
	padding: 20px;
	margin-left: 200px;
}
.replyContentDiv td{
	padding-top: 16px;
	padding-bottom: 16px;
	background-color: #ffffff;
	margin-left: 200px;
}
.replyContent{
	text-align: center;
	padding-left: 0px;
	padding-right: 0px;
}
table tr:first-child td:nth-child(odd){
	background-color: #f8f8f8;
}
table tr:nth-child(2) td:nth-child(1){
	background-color: #f8f8f8;
}
table tr:nth-child(2) td:nth-child(2){
	background-color: #f8f8f8;
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
	margin-left: 200px;
}

.deleteReplyBtn{
	display: inline-block;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-12 bodyContainer">
		<div class="col-7 replyDetailTitleDiv">
			<div class="col-12 replyDetailTitle">댓글 상세페이지</div>
		</div>
		<div class="col-7 replyContentDiv">
			<div class="col-12 replyContent">
				<table>
				<colgroup>
					<col width="13%">
					<col width="*%">
					<col width="13%">
					<col width="15%">
					<col width="12%">
					<col width="12%">
				</colgroup>
					<tr>
						<td>댓글코드</td>
						<td>${detailReply.reviewReplyCode }</td>
						<td>리뷰코드</td>
						<td>${detailReply.reviewBoardCode }</td>
						<td>작성일</td>
						<td>${detailReply.reviewReplyRegDate }</td>
					</tr>
					<tr>
						<td colspan="4">내 용</td>
						<td>작성자</td>
						<td>${detailReply.reviewReplyWriter }</td>
					</tr>
					<tr class="contentTr">
						<td colspan="6">${detailReply.reviewReplyContent }</td>
					</tr>
				</table>
				<div class="manageBtnDiv">
					<div class="deleteReplyBtn">
						<input type="button" value="삭제" onclick="deleteReviewReply('${detailReply.reviewReplyCode }');">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>




			






