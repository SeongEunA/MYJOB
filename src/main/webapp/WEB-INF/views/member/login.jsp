<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn-primary {
    background-color: #EAEAEA;
    border-color: white;
    color: #FFF;
    outline: none;
}
.btn-primary:hover, .btn-primary:focus {
    border-color: white;
    background-color: #FFA200;
    color: #FFF;
    outline: none;
}
.btn-primary:active,
.btn-primary:visited,
.btn-primary:active:focus,
.btn-primary:active:hover {
    border-color: #FFA200;
    background-color: #FFA200;
    color: #FFF;
    outline:none;
}

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
</body>
</html>