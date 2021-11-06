<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	width: 100%;
	background-color: #eaeaea;
	margin-top: 30px;
	padding: 30px;
	font-size: 12px;
	
}

.searchDiv{
	margin-bottom: 30px;
}

.tableDiv{
	margin-top: 10px;
}

.searchTable td{
	height: 30px;
}

.searchTable select{
	width: 100%;
	height: 100%;
}

.searchTable input[type="text"]{
	width: 100%;
	height: 100%;
}

.searchTable button[type="button"]{
	width: 100%;
	height: 100%;
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

</style>
</head>
<body>
댓글 관리 페이지입니다.
	<div class="col-12 bodyContainer">
		<div class="col-8 containerDiv">
			<div class="container">
				<div class="searchDiv">
					<form action="/admin/replyManage" method="post">
						<table class="searchTable">
							<colgroup>
								<col width="20%">
								<col width="*%">
								<col width="20%">
							</colgroup>
							<tr>
								<td><select name="searchKeyword">
										<option value="REVIEW_REPLY_CONTENT"
											<c:if test="${reviewReplyVO.searchKeyword eq 'REVIEW_REPLY_CONTENT'}">selected</c:if>>내&nbsp;&nbsp;&nbsp;용</option>
										<option value="REVIEW_REPLY_WRITER"
											<c:if test="${reviewReplyVO.searchKeyword eq 'REVIEW_REPLY_WRITER'}">selected</c:if>>작성자</option>
								</select></td>
								<td><input type="text" name="searchValue"
									value="${reviewReplyVO.searchValue }"></td>
								<td>
									<button type="submit">검색</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
				총 ${replyList.size() } 건
				<div class="tableDiv">
					<table>
						<colgroup>
							<col width="5%">
							<col width="*">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<td>No</td>
								<td>내용</td>
								<td>작성자</td>
								<td>작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${replyList }" var="replyListInfo"
								varStatus="i">
								<tr>
									<td><a style="color: black; text-decoration-line: none;">${replyList.size() - i.index }</a></td>
									<td><a style="color: black; text-decoration-line: none;"
										href="/admin/detailReply?reviewReplyCode=${replyListInfo.reviewReplyCode }">${replyListInfo.reviewReplyContent }</a></td>
									<td><a style="color: black; text-decoration-line: none;">${replyListInfo.reviewReplyWriter }</a></td>
									<td><a style="color: black; text-decoration-line: none;">${replyListInfo.reviewReplyRegDate }</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>


			<div class="row">
				<div class="col-8 noticePagingDiv">
					<div class="col-2 noticePaging">
						<div class="col text-center">
							<nav aria-label="...">
								<ul class="pagination justify-content-center">
									<li
										class="page-item <c:if test="${!reviewReplyVO.prev }">disabled</c:if>">
										<a class="page-link"
										href="/admin/replyManage?nowPage=${reviewReplyVO.beginPage - 1 }">Prev</a>
									</li>

									<c:forEach begin="${reviewReplyVO.beginPage }"
										end="${reviewReplyVO.endPage }" var="pageNumber">
										<li
											class="page-item <c:if test="${reviewReplyVO.nowPage eq pageNumber }">active</c:if>">
											<a class="page-link"
											href="/admin/replyManage?nowPage=${pageNumber }&searchKeyword=${reviewReplyVO.searchKeyword}&searchValue=${reviewReplyVO.searchValue}">${pageNumber }</a>
										</li>
									</c:forEach>

									<li
										class="page-item <c:if test="${!reviewReplyVO.next }">disabled</c:if>">
										<a class="page-link"
										href="/admin/replyManage?nowPage=${reviewReplyVO.endPage + 1 }">Next</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>