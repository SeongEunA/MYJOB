<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/review/js/reg_review.js?ver=1"></script>
<style type="text/css">
.container{
	width: 1100px;
	margin: 0 auto;
}
.container.regCourseDiv{
	width: 100%;
}

.tableDiv{
	width: 100%;
}
.tableDiv td{
	padding-top: 50px;
	padding-bottom: 50px;
	padding-left: 30px;
}
.tableDiv tr{
	border-top: 1.5px soild #f2f2f2;
	border-bottom: 1.5px solid #f2f2f2;
}

</style>
</head>
<body>
	<div class="container">
		<div class="regCourseDiv">
			<div>
				<a href="/review/regReview"><img src="/resources/images/banner_cos_top3.gif"></a>
			</div>
		</div>
		<div class="tableDiv">
			<table>
				<thead>
					<tr>
						<td>
							총list.size건
						</td>
					</tr>	
				</thead>
				
				<tr>
					<td><a href="/review/detailReview"><img src="/resources/images/picture1.jpg"></a></td>
					<td><a href="/review/detailReview">역사공부에 아름다운 자연풍광까지! 두마리 토끼</a></td>
				</tr>
				<tr>
					<td><a href="/review/detailReview"><img src="/resources/images/picture2.jpg"></a></td>
					<td><a href="/review/detailReview">울산 시티투어 테마형 코스</a></td>
				</tr>
				<tr>
					<td><a href="review/detailReview"><img src="/resources/images/picture3.jpg"></a></td>
					<td><a href="review/detailReview">울산 시티투어 순환형코스</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>