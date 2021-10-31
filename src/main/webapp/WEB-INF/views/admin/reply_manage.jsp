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
	width: 1000px;
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

</style>
</head>
<body>
댓글 관리 페이지입니다.
<div class="container">
	<div class="searchDiv">
		<form action="">
			<table class="searchTable">
			<colgroup>
				<col width="20%">
				<col width="*%">
				<col width="20%">
			</colgroup>
				<tr>
					<td>
						<select name="searchKeyword">
								<option selected>전  체</option>
							<option value="REVIEW_REPLY_WRITER">작성자</option>
							<option value="REVIEW_REPLY_CONTENT">내 용</option>
							<option value="REVIEW_REPLY_REG_DATE">작성일</option>
						</select>
					</td>
					<td>
						<input type="text" name="searchValue" value="">
					</td>
					<td>
						<button type="button">검색</button>
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
		</colgroup>
			<thead>
				<tr>
					<td>No</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				  <c:forEach items="${replyList }" var="replyListInfo" varStatus="i">
					    <tr>
					      	<td><a  style="color: black; text-decoration-line: none;">${replyList.size() - i.index }</a></td>
					      	<td><a  style="color: black; text-decoration-line: none;" href="/admin/detailReply?reviewReplyCode=${replyListInfo.reviewReplyCode }">${replyListInfo.reviewReplyWriter }</a></td>
					      	<td><a  style="color: black; text-decoration-line: none;">${replyListInfo.reviewReplyRegDate }</a></td>
					    </tr>  
				  </c:forEach>
		  	</tbody>
		</table>
	</div>
</div>
</body>
</html>