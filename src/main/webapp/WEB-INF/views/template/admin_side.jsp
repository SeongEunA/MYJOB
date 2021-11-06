<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.adminSideDiv{
	margin: 0 auto;
	text-align: center;
	padding: 40px;
	width: 100%;
	letter-spacing: 6.0px;
}
.memberManageDiv{
	border: 1px solid blue;
	height: 30px;
	background-color: #efefef;
	margin-top: 60px;
	margin-bottom: 30px;
}
.replyManageDiv{
	border: 1px solid blue;
	height: 30px;
	background-color: #efefef;
	margin-top: 30px;
}
.row{
	margin: 0px;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-9 adminSideDiv">
			<div class="col-10 memberManageDiv">
				<div class="memberManage"><a href="/admin/memberManage" style="color: black; text-decoration-line: none;">회원 관리</a></div>
			</div>
			<div class="col-10 replyManageDiv">
				<div class="replyManage"><a href="/admin/replyManage" style="color: black; text-decoration-line: none;">댓글 관리</a></div>
			</div>
		</div>
	</div>
</body>
</html>















