<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/join.js?ver=70"></script>
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
		<div class="col-7">
			<form class="row g-3" action="/member/join" method="post" id="joinForm">
				<div class="col-9">
					<label for="id" class="form-label">ID</label>
					<input type="text" class="form-control" id="memberId" name="memberId" required>
				</div>
				<div class="col-3 d-grid" id="checkIdDiv">
					<label for="idCheck" class="form-label">&nbsp;</label>
					<button type="button" class="btn btn-primary" id="idCheckbtn" onclick="idCheckbtn();">중복확인</button>
				</div>
				<div class="col-12">
					<label for="name" class="form-label">NAME</label>
					<input type="text" class="form-control" id="memberName" name="memberName" required>
				</div>
				<div class="col-12">
					<label for="pw" class="form-label">PASSWORD</label>
					<input type="password" class="form-control" id="memberPw" name="memberPw" required>
				</div>
				<div class="col-12">
					<label for="c_pw" class="form-label">CONFIRM PASSWORD</label>
					<input type="password" class="form-control" id="c_pw" disabled>
				</div>
				<div class="col-4">
					<label for="tel1" class="form-label">TEL</label>
					<select id="tel1" class="form-select" name="memberTels">
						<option value="010" selected>010</option>
						<option value="011">011</option>
					</select>
				</div>
				<div class="col-4">
					<label for="tel2" class="form-label">&nbsp;</label>
					<input type="text" class="form-control" id="tel2" name="memberTels" required>
				</div>
				<div class="col-4">
					<label for="tel3" class="form-label">&nbsp;</label>
					<input type="text" class="form-control" id="tel3" name="memberTels" required>
				</div>
				<div class="col-9">
					<label for="addr1" class="form-label">ADDRESS</label>
					<input type="text" class="form-control" id="addr1" name="memberAddres">
				</div>
				<div class="col-3 d-grid">
					<label for="search" class="form-label">&nbsp;</label>
					<button type="submit" class="btn btn-primary" id="btn2">검색</button>
				</div>
				<div class="col-12 mt-3">
					<input type="text" class="form-control" id="addr2" name="memberAddres">
				</div>
				<div class="col-4">
					<label for="email1" class="form-label">EMAIL</label>
					<input type="text" class="form-control" id="tel2" name="memberEmails">
				</div>
				<div class="col-8">
					<label for="email2" class="form-label">&nbsp;</label>
					<select id="email2" class="form-select" name="memberEmails">
						<option value="naver.com" selected>naver.com</option>
						<option value="google.com">google.com</option>
					</select>
				</div>
				<div class="col-12">
					<div class="col">
						<label for="" class="form-label">GENDER</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="memberGender" id="genderRadioBtn1" value="male" checked>
						<label class="form-check-label" for="genderRadioBtn1">남자</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="memberGender" id="genderRadioBtn2" value="female">
						<label class="form-check-label" for="genderRadioBtn2">여자</label>
					</div>
				</div>
				<div class="col-12 d-grid">
					<input type="submit" id="joinBtn" class="btn btn-primary" value="J o i n" disabled>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

















