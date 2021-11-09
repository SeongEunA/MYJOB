<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.memberManageTitleDiv{
	padding:0px;
	margin-top: 80px;
	margin-left: 200px;
}
.memberManageTitle{
	border-bottom: 5px solid #f3f5f6;
	padding: 5px;
	font-size: 20pt;
}
.memberSearchDiv{
	margin-top: 10px;
	padding: 10px;
	margin-left: 200px;
}
.searchTable input[type="text"]{
	width: 100%;
}
.memberListDiv{
	margin-top: 10px;
	margin-left: 200px;
}
.memberList{
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
.memberContentList tr:hover{
	background-color: #f8f8f8;
}
td{
	padding: 10px;
}
.memberPagingDiv{
	margin-top: 30px;
	font-size: 13px;
	margin-left: 200px;
}
.memberPaging{
	margin: 0 auto;
	font-size: 10px;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-12 bodyContainer">
		<div class="col-7 memberManageTitleDiv">
			<div class="col-12 memberManageTitle">회원 관리</div>
		</div>
		<div class="col-7 memberSearchDiv">
			<div class="col-12 memberSearch">
				<form action="/admin/memberManage" method="post">
					<table class="searchTable">
					<colgroup>
						<col width="12%">
						<col width="*%">
						<col width="8%">
					</colgroup>
						<tr>
							<td>
								<select name="searchKeyword">
									<option value="MEMBER_ID" <c:if test="${memberVO.searchKeyword eq 'MEMBER_ID'}">selected</c:if>>아이디</option>
									<option value="MEMBER_NAME" <c:if test="${memberVO.searchKeyword eq 'MEMBER_NAME'}">selected</c:if>>이&nbsp;&nbsp;&nbsp;&nbsp;름</option>
								</select>
							</td>
							<td>
								<input type="text" name="searchValue" value="${memberVO.searchValue }">
							</td>
							<td>
								<input type="submit" value="검색">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
		<div class="col-7 memberListDiv">
			<div class="col-12 memberList">
				<div class="totalCnt">총 ${memberList.size() } 건</div>
				<div class="tableDiv">
					<table>
						<colgroup>
							<col width="5%">
							<col width="*">
							<col width="12%">
							<col width="12%">
						</colgroup>
						<thead>
							<tr>
								<td>No</td>
								<td>회원아이디</td>
								<td>회원이름</td>
								<td>가입일</td>
							</tr>
						</thead>
						<tbody class="memberContentList">
							<c:choose>
								<c:when test="${empty memberList }">
									<tr>
										<td colspan="4">등록된 회원이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${memberList }" var="memberListInfo" varStatus="i">
										<tr>
											<td><a style="color: black; text-decoration-line: none;">${memberList.size() - i.index }</a></td>
											<td><a style="color: black; text-decoration-line: none;" href="/admin/detailMember?memberCode=${memberListInfo.memberCode }">${memberListInfo.memberId }</a></td>
											<td><a style="color: black; text-decoration-line: none;">${memberListInfo.memberName }</a></td>
											<td><a style="color: black; text-decoration-line: none;">${memberListInfo.memberJoinDate }</a></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div class="col-7 memberPagingDiv">
			<div class="col-3 memberPaging">
				<div class="row">
					<div class="col text-center">
						<nav aria-label="...">
							<ul class="pagination justify-content-center">
								<li
									class="page-item <c:if test="${!memberVO.prev }">disabled</c:if>">
									<a class="page-link"
									href="/admin/memberManage?nowPage=${memberVO.beginPage - 1 }">&lt;&lt;</a>
								</li>
	
								<c:forEach begin="${memberVO.beginPage }"
									end="${memberVO.endPage }" var="pageNumber">
									<li
										class="page-item <c:if test="${memberVO.nowPage eq pageNumber }">active</c:if>">
										<a class="page-link"
										href="/admin/memberManage?nowPage=${pageNumber }&searchKeyword=${memberVO.searchKeyword}&searchValue=${memberVO.searchValue}">${pageNumber }</a>
									</li>
								</c:forEach>
	
								<li
									class="page-item <c:if test="${!memberVO.next }">disabled</c:if>">
									<a class="page-link"
									href="/admin/memberManage?nowPage=${memberVO.endPage + 1 }">&gt;&gt;</a>
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