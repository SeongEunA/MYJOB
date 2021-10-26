<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-4">
		<form class="row g-3" action="/member/login" method="post">
			<div class="col-12">
				<label for="id" class="form-label">ID</label>
				<input type="text" class="form-control" id="id" name="memberId" required>
			</div>
			<div class="col-12">
				<label for="pw" class="form-label">PASSWORD</label>
				<input type="password" class="form-control" id="pw" name="memberPw" required>
			</div>
			<div class="col-12 d-grid">
				<input type="submit" id="joinBtn" class="btn btn-primary" value="L o g i n">
			</div>
		</form>
	</div>
</div>

<!-- <div class="container">
	<form action="/member/login" method="post">
		<div>
			<div>ID</div>
			<div><input type="text" id="insertId" name="memberId"></div>
		</div>
		<div>
			<div>PASSWORD</div>
			<div><input type="password" id="insertPw" name="memberPw"></div>
		</div>
		<div>
			<input type="submit" id="loginBtn" value="L o g i n">
		</div>
	</form>
</div> -->
</body>
</html>