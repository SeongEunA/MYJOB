<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/common/reset.css">
<style type="text/css">

.noticeSearchDiv{
	border: 1px solid blue;
	margin: 0 auto;
	margin-top: 20px;
	margin-bottom: 20px;
	
}
.noticeSearch{
	border: 1px solid black;
	margin:0 auto;
	margin-top: 20px;
	margin-bottom: 20px;
	padding: 20px;
	font-size: 13px;
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

.searchTable input[type="submit"]{
	width: 100%;
	height: 100%;
}
.noticeTableDiv{
	border: 1px solid blue;
	margin:0 auto;
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 13px;
}
.noticeTable{
	border: 1px solid black;
	margin:0 auto;
	margin-top: 20px;
	margin-bottom: 20px;
	padding: 20px;
	font-size: 13px;
}
.regNoticeBtnDiv{
	border: 1px solid purple;
	margin-bottom: 20px;
	margin-left: 0px;
	padding-left: 0px;
	text-align: right;
}
.regNoticeBtn{
	height: 30px;
	border: 1px solid red;
	margin-top: 20px;
	margin-bottom: 20px;
	margin-left: 0px;
	padding-left: 0px;
	
}
.regNoticeBtn input[type="button"]{
	width: 10%;
	height: 100%;
}
table{
	width: 100%;
	margin: 0 auto;
	margin-top: 10px;
	text-align: center;
}

tr{
	border: 1px solid black;
}

td{
	border: 1px solid black;
	padding: 10px;
}
.noticePagingDiv{
	border: 1px solid blue;
	margin:0 auto;
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 13px;
}
.noticePaging{
	border: 1px solid black;
	margin:0 auto;
	font-size: 10px;
}
.bodyContainer{
	border:1px solid black;
	min-height:1800px;
	height:auto;
}
</style>
</head>
<body>
<div class="row">
	<div class="col12 bodyContainer">
		<div class="col-8 noticeTitleDiv">
			<div class="col-12 noticeTitle">공지사항 페이지입니다.</div>
		</div>
		<div class="col-8 noticeSearchDiv">
			<div class="col-11 noticeSearch">
				<form action="/common/noticeBoard" method="post">
					<table class="searchTable">
					<colgroup>
						<col width="20%">
						<col width="*%">
						<col width="20%">
					</colgroup>
						<tr>
							<td>
								<select name="searchKeyword">
									<option value="BOARD_SUBJECT" <c:if test="${noticeBoardVO.searchKeyword eq 'BOARD_SUBJECT'}">selected</c:if>>제&nbsp;&nbsp;&nbsp;목</option>
									<option value="BOARD_CONTENT" <c:if test="${noticeBoardVO.searchKeyword eq 'BOARD_CONTENT'}">selected</c:if>>내&nbsp;&nbsp;&nbsp;용</option>
									<option value="BOARD_WRITER" <c:if test="${noticeBoardVO.searchKeyword eq 'BOARD_WRITER'}">selected</c:if>>작성자</option>
								</select>
							</td>
							<td>
								<input type="text" name="searchValue" value="${noticeBoardVO.searchValue }">
							</td>
							<td>
								<input type="submit" value="검색">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
		<div class="col-8 noticeTableDiv">
			<div class="col-11 noticeTable">
				<div class="col-12 regNoticeBtnDiv">
					<div class="col-12 regNoticeBtn">
					&nbsp;
						<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' }">
							<a href="/admin/goRegNoticeBoard"><input type="button" value="등록"></a>
						</c:if>
					</div>
				</div>
				
				총 ${noticeBoardList.size() } 건
				<div class="tableDiv">
					<table>
					<colgroup>
						<col width="5%">
						<col width="80%">
						<col width="5%">
						<col width="10%">
					</colgroup>
						<thead>
							<tr>
								<td>No</td>
								<td>공지사항 제목</td>
								<td>작성자</td>
								<td>등록일</td>
							</tr>
						</thead>
						<tbody>
							  <c:forEach items="${noticeBoardList }" var="noticeBoardInfo" varStatus="i">
								    <tr>
								      	<td><a  style="color: black; text-decoration-line: none;">${noticeBoardList.size() - i.index }</a></td>
								      	<td><a  style="color: black; text-decoration-line: none;" href="/common/detailNoticeBoard?noticeBoardCode=${noticeBoardInfo.noticeBoardCode }">${noticeBoardInfo.boardSubject }</a></td>
								      	<td><a  style="color: black; text-decoration-line: none;">${noticeBoardInfo.boardWriter }</a></td>
								      	<td><a  style="color: black; text-decoration-line: none;">${noticeBoardInfo.regDate }</a></td>
								    </tr>  
							  </c:forEach>
					  	</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="col-8 noticePagingDiv">
			<div class="col-2 noticePaging">
				<div class="row">
					<div class="col text-center">
						<nav aria-label="...">
							<ul class="pagination justify-content-center">
								<li class="page-item <c:if test="${!noticeBoardVO.prev }">disabled</c:if>">
									<a class="page-link" href="/common/noticeBoard?nowPage=${noticeBoardVO.beginPage - 1 }">Prev</a>
								</li>
								
								<c:forEach begin="${noticeBoardVO.beginPage }" end="${noticeBoardVO.endPage }" var="pageNumber">
									<li class="page-item <c:if test="${noticeBoardVO.nowPage eq pageNumber }">active</c:if>">
										<a class="page-link" href="/common/noticeBoard?nowPage=${pageNumber }&searchKeyword=${noticeBoardVO.searchKeyword}&searchValue=${noticeBoardVO.searchValue}">${pageNumber }</a>
									</li>
								</c:forEach>
								
								<li class="page-item <c:if test="${!noticeBoardVO.next }">disabled</c:if>">
									<a class="page-link" href="/common/noticeBoard?nowPage=${noticeBoardVO.endPage + 1 }">Next</a>
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






