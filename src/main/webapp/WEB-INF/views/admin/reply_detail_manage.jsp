<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/js/reply_detail_manage.js?ver=5"></script>
<style type="text/css">
.container{
	width: 100%;
	background-color: #eaeaea;
	margin-top: 30px;
	padding: 30px;
	font-size: 12px;
}

table{
	width: 100%;
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
	height: 100px;
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
댓글 관리 상세페이지 입니다.
	<div class="col-12 bodyContainer">
		<div class="col-8 containerDiv">
			<div class="container">
				<div>
					<table>
						<colgroup>
							<col width="10%">
							<col width="30%">
							<col width="10%">
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
						<div class="deleteNoticeBoardBtnDiv">
							<input type="button" id="deleteNoticeBoardBtn" value="삭제"
								onclick="deleteReviewReply('${detailReply.reviewReplyCode }');">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>




			






