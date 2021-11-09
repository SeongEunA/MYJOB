<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.replyManageTitleDiv{
	padding:0px;
	margin-top: 80px;
	margin-left: 200px;
}
.replyManageTitle{
	border-bottom: 5px solid #f3f5f6;
	padding: 5px;
	font-size: 20pt;
}
.replySearchDiv{
	margin-top: 10px;
	padding: 10px;
	margin-left: 200px;
}
.searchTable input[type="text"]{
	width: 100%;
}
.replyListDiv{
	margin-top: 10px;
	margin-left: 200px;
}
.replyList{
	border: 2px solid #f3f5f6;
	padding: 20px;
	text-align: center;
}
thead{
	background-color: #f3f5f6;
	border-top: 2px solid #61616d;
}
.totalCnt{
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}
.searchTable select{
	width: 100%;
}
.searchTable input[type="submit"]{
	width: 100px;
	height: 30px;
}
.replyContentList tr:hover{
	background-color: #f8f8f8;
}
td{
	padding: 10px;
}
.replyPagingDiv{
	margin-top: 30px;
	font-size: 13px;
	margin-left: 200px;
}
.replyPaging{
	margin: 0 auto;
	font-size: 10px;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-12 bodyContainer">
		<div class="col-7 replyManageTitleDiv">
			<div class="col-12 replyManageTitle">댓글 관리</div>
		</div>
		<div class="col-7 replySearchDiv">
			<div class="col-12 replySearch">
				<form action="/admin/replyManage" method="post">
					<table class="searchTable">
					<colgroup>
						<col width="12%">
						<col width="*%">
						<col width="8%">
					</colgroup>
						<tr>
							<td><select name="searchKeyword">
									<option value="REVIEW_REPLY_CONTENT" <c:if test="${reviewReplyVO.searchKeyword eq 'REVIEW_REPLY_CONTENT'}">selected</c:if>>내&nbsp;&nbsp;&nbsp;&nbsp;용</option>
									<option value="REVIEW_REPLY_WRITER" <c:if test="${reviewReplyVO.searchKeyword eq 'REVIEW_REPLY_WRITER'}">selected</c:if>>작성자</option>
								</select>
							</td>
							<td>
								<input type="text" name="searchValue" value="${reviewReplyVO.searchValue }">
							</td>
							<td>
								<input type="submit" value="검색">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
		<div class="col-7 replyListDiv">
			<div class="col-12 replyList">
				<div class="totalCnt">총 ${replyList.size() } 건</div>
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
						<tbody class="replyContentList">
							<c:choose>
								<c:when test="${empty replyList }">
									<tr>
										<td colspan="4">등록된 후기 댓글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${replyList }" var="replyListInfo" varStatus="i">
										<tr>
											<td><a style="color: black; text-decoration-line: none;">${replyList.size() - i.index }</a></td>
											<td><a style="color: black; text-decoration-line: none;" href="/admin/detailReply?reviewReplyCode=${replyListInfo.reviewReplyCode }">${replyListInfo.reviewReplyContent }</a></td>
											<td><a style="color: black; text-decoration-line: none;">${replyListInfo.reviewReplyWriter }</a></td>
											<td><a style="color: black; text-decoration-line: none;">${replyListInfo.reviewReplyRegDate }</a></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div class="col-7 replyPagingDiv">
			<div class="col-3 replyPaging">
				<div class="row">
					<div class="col text-center">
						<nav aria-label="...">
							<ul class="pagination justify-content-center">
								<li class="page-item <c:if test="${!reviewReplyVO.prev }">disabled</c:if>">
									<a class="page-link" href="/admin/replyManage?nowPage=${reviewReplyVO.beginPage - 1 }">&lt;&lt;</a>
								</li>
	
								<c:forEach begin="${reviewReplyVO.beginPage }" end="${reviewReplyVO.endPage }" var="pageNumber">
									<li class="page-item <c:if test="${reviewReplyVO.nowPage eq pageNumber }">active</c:if>">
										<a class="page-link" href="/admin/replyManage?nowPage=${pageNumber }&searchKeyword=${reviewReplyVO.searchKeyword}&searchValue=${reviewReplyVO.searchValue}">${pageNumber }</a>
									</li>
								</c:forEach>
	
								<li class="page-item <c:if test="${!reviewReplyVO.next }">disabled</c:if>">
									<a class="page-link" href="/admin/replyManage?nowPage=${reviewReplyVO.endPage + 1 }">&gt;&gt;</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div><!-- bodyContainer -->
</div>

</body>
</html>