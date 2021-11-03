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
코스후기 관리 페이지입니다.
<div class="container">
	<div class="searchDiv">
		<form action="/admin/reviewManage" method="post">
			<table class="searchTable">
			<colgroup>
				<col width="20%">
				<col width="*%">
				<col width="20%">
			</colgroup>
				<tr>
					<td>
						<select name="searchKeyword">
							<option value="REVIEW_BOARD_TITLE" <c:if test="${reviewVO.searchKeyword eq 'REVIEW_BOARD_TITLE'}">selected</c:if>>제&nbsp;&nbsp;&nbsp;목</option>
							<option value="REVIEW_BOARD_CONTENT" <c:if test="${reviewVO.searchKeyword eq 'REVIEW_BOARD_CONTENT'}">selected</c:if>>내&nbsp;&nbsp;&nbsp;용</option>
							<option value="REVIEW_BOARD_WRITER" <c:if test="${reviewVO.searchKeyword eq 'REVIEW_BOARD_WRITER'}">selected</c:if>>작성자</option>
						</select>
					</td>
					<td>
						<input type="text" name="searchValue" value="${reviewVO.searchValue }">
					</td>
					<td>
						<button type="submit">검색</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	총 ${reviewList.size() } 건
	<div class="tableDiv">
		<table>
		<colgroup>
			<col width="5%">
			<col width="75%">
			<col width="10%">
			<col width="10%">
		</colgroup>
			<thead>
				<tr>
					<td>No</td>
					<td>제 목</td>
					<td>작성자</td>
					<td>가입일</td>
				</tr>
			</thead>
			<tbody>
				  <c:forEach items="${reviewList }" var="reviewListInfo" varStatus="i">
					    <tr>
					      	<td><a  style="color: black; text-decoration-line: none;">${reviewList.size() - i.index }</a></td>
					      	<td><a  style="color: black; text-decoration-line: none;" href="/review/detailReview?reviewBoardCode=${reviewListInfo.reviewBoardCode }">${reviewListInfo.reviewBoardTitle }</a></td>
					      	<td><a  style="color: black; text-decoration-line: none;">${reviewListInfo.reviewBoardWriter }</a></td>
					      	<td><a  style="color: black; text-decoration-line: none;">${reviewListInfo.reviewBoardRegDate }</a></td>
					    </tr>  
				  </c:forEach>
		  	</tbody>
		</table>
	</div>
</div>


<div class="row">
	<div class="col text-center">
		<nav aria-label="...">
			<ul class="pagination justify-content-center">
				<li class="page-item <c:if test="${!reviewVO.prev }">disabled</c:if>">
					<a class="page-link" href="/admin/reviewManage?nowPage=${reviewVO.beginPage - 1 }">Prev</a>
				</li>
				
				<c:forEach begin="${reviewVO.beginPage }" end="${reviewVO.endPage }" var="pageNumber">
					<li class="page-item <c:if test="${reviewVO.nowPage eq pageNumber }">active</c:if>">
						<a class="page-link" href="/admin/reviewManage?nowPage=${pageNumber }&searchKeyword=${reviewVO.searchKeyword}&searchValue=${reviewVO.searchValue}">${pageNumber }</a>
					</li>
				</c:forEach>
				
				<li class="page-item <c:if test="${!reviewVO.next }">disabled</c:if>">
					<a class="page-link" href="/admin/reviewManage?nowPage=${reviewVO.endPage + 1 }">Next</a>
				</li>
			</ul>
		</nav>
	</div>	
</div>


</body>
</html>