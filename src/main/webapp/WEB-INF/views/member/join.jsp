<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/join.js?ver=321"></script>
<style type="text/css">
/* .btn-primary {
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
} */

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
					<button type="button" class="btn btn-primary" id="idCheckbtn" onclick="idCheck();">중복확인</button>
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
					<input type="password" class="form-control" id="confirmPw">
				</div>
				<div class="col-4">
					<label for="memberTel1" class="form-label">TEL</label>
					<select id="memberTel1" class="form-select" name="memberTels">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>
				<div class="col-4">
					<label for="memberTel2" class="form-label">&nbsp;</label>
					<input type="text" class="form-control" id="memberTel2" name="memberTels" required>
				</div>
				<div class="col-4" id="memberTelsDiv">
					<label for="memberTel3" class="form-label">&nbsp;</label>
					<input type="text" class="form-control" id="memberTel3" name="memberTels" required>
				</div>
				<div class="col-12 d-grid">
					<input type="button" id="phoneCheck" class="btn btn-primary" value="휴대폰인증">
				</div>
				<div class="col-9">
					<label for="memberAddr1" class="form-label">ADDRESS</label>
					<input type="text" class="form-control" id=memberAddr1 name="memberAddres" readonly placeholder="도로명/지번 주소">
				</div>
				<div class="col-3 d-grid">
					<label for="memberAddres" class="form-label">&nbsp;</label>
					<button type="submit" class="btn btn-primary" id="memberAddrBtn">주소검색</button>
				</div>
				<div class="col-12 mt-3">
					<input type="text" class="form-control" id="memberAddr2" name="memberAddres" readonly placeholder="상세 주소">
				</div>
				<div class="col-4">
					<label for="memberEmail1" class="form-label">EMAIL</label>
					<input type="text" class="form-control" id="memberEmail1" name="memberEmails">
				</div>
				<div class="col-8" id="memberEmailDiv">
					<label for="memberEmail2" class="form-label">&nbsp;</label>
					<select id="memberEmail2" class="form-select" name="memberEmails">
						<option value="naver.com" selected>naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
					</select>
				</div>
				<div class="col-12 d-grid">
					<input type="button" id="emailCheck" class="btn btn-primary" value="이메일인증">
				</div>
				<div class="col-12">
					<div class="col">
						<label for="" class="form-label">GENDER</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="memberGender" id="genderRadio1" value="male" checked>
						<label class="form-check-label" for="genderRadioBtn1">남자</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="memberGender" id="genderRadio2" value="female">
						<label class="form-check-label" for="genderRadioBtn2">여자</label>
					</div>
				</div>
				<div class="col-12 d-grid">
					<input type="button" id="joinBtn" class="btn btn-primary" value="J o i n" disabled>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

















