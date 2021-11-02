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

/* .row{
	margin-top: 30px;
} */
</style>
</head>
<body>
회원 관리 페이지입니다.
<div class="container">
	<div class="searchDiv">
		<form action="/admin/memberManage" method="post">
			<table class="searchTable">
			<colgroup>
				<col width="20%">
				<col width="*%">
				<col width="20%">
			</colgroup>
				<tr>
					<td>
						<select name="searchKeyword">
							<option selected value="all">전  체</option>
							<option value="MEMBER_ID" <c:if test="${memberVO.searchKeyword eq 'MEMBER_ID'}">selected</c:if>>아이디</option>
							<option value="MEMBER_NAME" <c:if test="${memberVO.searchKeyword eq 'MEMBER_NAME'}">selected</c:if>>이 름</option>
						</select>
					</td>
					<td>
						<input type="text" name="searchValue" value="${memberVO.searchValue }">
					</td>
					<td>
						<button type="submit">검색</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	총 ${memberList.size() } 건
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
					<td>회원아이디</td>
					<td>회원이름</td>
					<td>가입일</td>
				</tr>
			</thead>
			<tbody>
				  <c:forEach items="${memberList }" var="memberListInfo" varStatus="i">
					    <tr>
					      	<td><a  style="color: black; text-decoration-line: none;">${memberList.size() - i.index }</a></td>
					      	<td><a  style="color: black; text-decoration-line: none;" href="/admin/detailMember?memberCode=${memberListInfo.memberCode }">${memberListInfo.memberId }</a></td>
					      	<td><a  style="color: black; text-decoration-line: none;">${memberListInfo.memberName }</a></td>
					      	<td><a  style="color: black; text-decoration-line: none;">${memberListInfo.memberJoinDate }</a></td>
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
				<li class="page-item <c:if test="${!memberVO.prev }">disabled</c:if>">
					<a class="page-link" href="/admin/memberManage?nowPage=${memberVO.beginPage - 1 }">Prev</a>
				</li>
				
				<c:forEach begin="${memberVO.beginPage }" end="${memberVO.endPage }" var="pageNumber">
					<li class="page-item <c:if test="${memberVO.nowPage eq pageNumber }">active</c:if>">
						<a class="page-link" href="/admin/memberManage?nowPage=${pageNumber }&searchKeyword=${memberVO.searchKeyword}&searchValue=${memberVO.searchValue}">${pageNumber }</a>
					</li>
				</c:forEach>
				
				<li class="page-item <c:if test="${!memberVO.next }">disabled</c:if>">
					<a class="page-link" href="/admin/memberManage?nowPage=${memberVO.endPage + 1 }">Next</a>
				</li>
			</ul>
		</nav>
	</div>	
</div>


</body>
</html>