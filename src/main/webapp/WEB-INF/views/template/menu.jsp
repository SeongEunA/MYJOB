<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.userInterface{
	font-size: 15px;
}
span{
   cursor: pointer;
}
</style>
</head>
<body>
<div class="row">
	<div class="col text-end userInterface">
		<c:choose>
			<c:when test="${not empty sessionScope.loginInfo }">
				<div>
					${sessionScope.loginInfo.memberName }님 반가워요~!
					<a href="/member/logout" style="color: black; text-decoration-line: none;">Logout</a>
					<div>&nbsp;</div>
					<c:choose>
						<c:when test="${sessionScope.loginInfo.memberIsAdmin eq 'N' }">
							<a href="/member/myPage" style="color: black; text-decoration-line: none;">마이페이지</a>
						</c:when>
						<c:otherwise>
							<a href="/admin/adminPage" style="color: black; text-decoration-line: none;">관리자페이지</a>
						</c:otherwise>
					</c:choose>
				</div>
			</c:when>
			<c:otherwise>
				<a href="/member/join" style="color: black; text-decoration-line: none;">Join</a> |
				<a href="/member/login" style="color: black; text-decoration-line: none;">Login</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<div class="row">
   <div class="col-12 text-center">
      <h1><a href="/common/main" style="color: black; text-decoration-line: none;">Travel course</a></h1>
   </div>
</div>
	<div class="row">
		<div class="col-12 text-center mb-3">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="#">여행</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
						aria-controls="navbarNavAltMarkup" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
						<div class="navbar-nav">
							<c:choose>
								<c:when test="${empty sessionScope.loginInfo or sessionScope.loginInfo.memberIsAdmin eq 'N'}">
									<a class="nav-link light" aria-current="page" href="#">Home</a>
									<a class="nav-link light" aria-current="page" href="/course/courseSearch">코스검색</a>
									<a class="nav-link light" aria-current="page" href="/course/myCourseList">내코스보기</a>
									<a class="nav-link light" aria-current="page" href="/review/selectReviewList">코스후기</a>
									<a class="nav-link light" aria-current="page" href="#">커뮤니티</a>
									<a class="nav-link light" aria-current="page" href="/admin/noticeBoard">공지사항</a>
								</c:when>
								<c:otherwise>
									<a class="nav-link light" aria-current="page" href="/admin/memberManage">회원 관리</a>
									<a class="nav-link light" aria-current="page" href="/">게시물 관리</a>
									<a class="nav-link light" aria-current="page" href="#">댓글기능 관리</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
</body>
</html>











