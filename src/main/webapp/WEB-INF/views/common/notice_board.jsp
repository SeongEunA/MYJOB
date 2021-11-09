<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.noticeTitleDiv{
	margin:0 auto;
	padding:0px;
	margin-top: 80px;
}
.noticeTitle{
	border-bottom: 5px solid #f3f5f6;
	padding: 5px;
	margin: 0 auto;
	font-size: 20pt;
}
.noticeSearchDiv{
	margin: 0 auto;
	margin-top: 10px;
	padding: 10px;
}
.noticeSearchDiv input[type="text"]{
	width: 100%;
}
.noticeListDiv{
	margin: 0 auto;
	margin-top: 10px;
}
.noticeList{
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
	margin: 0 auto;
	width: 100px;
	height: 30px;
}
/* .noticeSubject{
	text-align: left;
} */
.noticeContentList tr:hover{
	background-color: #f8f8f8;
}
td{
	padding: 10px;
}
.regNoticeBtnDiv{
	margin: 0 auto;
	margin-top: 20px;
	margin-bottom: 0px;
	text-align: center;
	padding-right: 10px;
}
.regNoticeBtn [type="button"]{
	margin: 0 auto;
	margin-left: 0px;
	margin-bottom: 0px;
	text-align: center;
	width: 100px;
	height: 30px;
}
.noticePagingDiv{
	border: 1px solid white;
	margin:0 auto;
	margin-top: 20px;
	font-size: 13px;
}
.noticePaging{
	margin:0 auto;
	font-size: 10px;
}
</style>
</head>
<body>
<div class="row">
	<div class="col12 bodyContainer">
		<div class="col-6 noticeTitleDiv">
			<div class="col-12 noticeTitle">공지사항</div>
		</div>
		<div class="col-6 noticeSearchDiv">
			<div class="col-12 noticeSearch">
				<form action="/common/noticeBoard" method="post">
					<table class="searchTable">
					<colgroup>
						<col width="15%">
						<col width="75%">
						<col width="5%">
					</colgroup>
						<tr>
							<td>
								<select name="searchKeyword">
									<option value="BOARD_SUBJECT" <c:if test="${noticeBoardVO.searchKeyword eq 'BOARD_SUBJECT'}">selected</c:if>>제&nbsp;&nbsp;&nbsp;&nbsp;목</option>
									<option value="BOARD_CONTENT" <c:if test="${noticeBoardVO.searchKeyword eq 'BOARD_CONTENT'}">selected</c:if>>내&nbsp;&nbsp;&nbsp;&nbsp;용</option>
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
		
		<div class="col-6 noticeListDiv">
			<div class="col-12 noticeList">
				<div class="totalCnt">총 ${noticeBoardList.size() } 건</div>
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
						<tbody class="noticeContentList">
							<c:choose>
								<c:when test="${empty noticeBoardList }">
									<tr>
										<td colspan="4">등록된 공지사항 게시물이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${noticeBoardList }" var="noticeBoardInfo" varStatus="i">
							   			<tr>
									     	<td><a  style="color: black; text-decoration-line: none;">${noticeBoardList.size() - i.index }</a></td>
									     	<td class="noticeSubject"><a  style="color: black; text-decoration-line: none;" href="/common/detailNoticeBoard?noticeBoardCode=${noticeBoardInfo.noticeBoardCode }">${noticeBoardInfo.boardSubject }</a></td>
									     	<td><a  style="color: black; text-decoration-line: none;">${noticeBoardInfo.boardWriter }</a></td>
									     	<td><a  style="color: black; text-decoration-line: none;">${noticeBoardInfo.regDate }</a></td>
							  			 </tr>  
									</c:forEach>
								</c:otherwise>
							</c:choose>
					  	</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div class="col-6 regNoticeBtnDiv">
			<div class="col-12 regNoticeBtn">
			&nbsp;
				<c:if test="${sessionScope.loginInfo.memberIsAdmin eq 'Y' }">
					<a href="/common/goRegNoticeBoard"><input type="button" value="등록"></a>
				</c:if>
			</div>
		</div>

		<div class="col-6 noticePagingDiv">
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






