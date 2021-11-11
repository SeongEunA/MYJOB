//초기값이나 유효성검사 성공 0
//유효성검사 실패 1
//이메일 널값 2

var okTel = 0;
var okEmail = 0;
var okPw = 0;
var okCPw = 0;
//화면 로딩 후 바로 실행 이벤트처리
//$(document).ready(function(){	
//});

//이벤트처리
//연락처 2번째 자리 유효성 검사
$(document).on('keyup', '#memberTel2', function() {
	// 휴대폰 번호 2번째 정규표현식
	var tel2J = /^([0-9]{3,4})$/; // - (3~4자리) - 의 형식으로만 생성.
	
	//memberTel2 변수 생성
	var memberTel2 = $('#memberTel2').val();
		
	//memberTel2 입력란이 양식에 맞지 않을 때
	if(!tel2J.test(memberTel2 || memberTel2 == '')){
		$('#noticeTel').text('올바르지 않은 연락처 입니다.');
		$('#noticeTel').css('color', 'red');
		$('#memberTel2').focus();
		okTel = 1;
	}
	//memverTel2 입력란이 양식에 맞을 때
	else{
		$('#noticeTel').text('사용 가능한 연락처 입니다.');
		$('#noticeTel').css('color', 'green');
		okTel = 0;
	}
});

//연락처 3번째 자리 유효성 검사
$(document).on('keyup', '#memberTel3', function() {
	// 휴대폰 번호 3번째 정규표현식
	var tel3J = /^([0-9]{4})$/; // - (4자리) - 의 형식으로만 생성.
	
	//membertel3 변수 생성
	var memberTel3 = $('#memberTel3').val();
	
	//memberTel3 입력란이 양식에 맞지 않을 때
	if(!tel3J.test(memberTel3) || memberTel3 == ''){
		$('#noticeTel').text('올바르지 않은 연락처 입니다.');
		$('#noticeTel').css('color', 'red');
		$('#memberTel3').focus();
		okTel = 1;
	}
	//memberTel3 입력란이 양식에 맞을 때
	else{
		$('#noticeTel').text('사용 가능한 연락처 입니다.');
		$('#noticeTel').css('color', 'green');
		okTel = 0;
	}
	
});


//Email의 유효성검사 시작
$(document).on('keyup', '#memberEmail1', function() {
	//이메일 첫번째자리 유효성검사 정규표현식
	var emailJ = /^[a-z0-9+]{4,12}$/; // 영어소문자 a~z, 숫자 0~9로 시작하는 4~12자리로 생성.
	
	//이메일 변수 생성
	var memberEmail1 = $('#memberEmail1').val();
	var memberEmail2 = $('#memberEmail2').val();
	
	//memberEmail1 입력란 공백 유효성 검사
	if(memberEmail1 == ''){
		$('#noticeEmail').text('');
		$('#memberEmail1').focus();
		okEmail = 0;
	}
	
	//양식에 맞지 않을 때
	else if(!emailJ.test(memberEmail1)){
		$('#noticeEmail').text('영어소문자, 숫자로만 구성된 4~12자리로 입력하세요.');
		$('#noticeEmail').css('color', 'red');
		$('#memberEmail1').focus();
		okEmail = 1;
	}
	//양식에 맞으면 중복체크
	else{
		//이메일 중복체크 첫번째자리
		var memberEmail = memberEmail1 + '@' + memberEmail2;
		$.ajax({
			url: '/member/emailCheck', //요청경로
			type: 'post',
			data:{'memberEmail':memberEmail}, //필요한 데이터
			success: function(result) {
				//기가입 : true, 미가입 : false
				//아이디 중복 일 때.
				if(result){
					$('#noticeEmail').text('중복된 이메일입니다.');
					$('#noticeEmail').css('color', 'red');
					$('#memberEmail1').focus();
					okEmail = 1;
				}
				else{
					$('#noticeEmail').text('사용 가능한 이메일입니다.');
					$('#noticeEmail').css('color', 'green');
					okEmail = 0;
				}
				
			},
			error: function(){
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	}
	
	
});
//이메일 중복체크 두번째자리
$(document).on('change', '#memberEmail2', function() {
	var memberEmail1 = $('#memberEmail1').val();
	var memberEmail2 = $('#memberEmail2').val();
	//이메일 중복체크
	var memberEmail = memberEmail1 + '@' + memberEmail2;
	$.ajax({
		url: '/member/emailCheck', //요청경로
		type: 'post',
		data:{'memberEmail':memberEmail}, //필요한 데이터
		success: function(result) {
			//기가입 : true, 미가입 : false
			//아이디 중복 일 때.
			if(result){
				alert(result);
				$('#noticeEmail').text('중복된 이메일입니다.');
				$('#noticeEmail').css('color', 'red');
				okEmail = 1;
			}
			else{
				$('#noticeEmail').text('사용 가능한 이메일입니다.');
				$('#noticeEmail').css('color', 'green');
				okEmail = 0;
			}
			if($('#memberEmail1').val() == ''){
				$('#noticeEmail').text('');
				$('#memberEmail1').focus();
				okEmail = 2;
			}
		},
		error: function(){
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
	
});


//PW관련 유효성검사 시작
$(document).on('keyup', '#memberPw', function() {
	//------------------------정규표현식-------------------------//
	// 비밀번호 정규표현식
	var pwJ = /^[A-Za-z0-9]{4,12}$/; // 영어 대소문자 (A~Z or a~z), 숫자 0~9로 시작하는 4~12자리 비밀번호로 생성.
	
	//memberPw 변수 생성
	var memberPw = $('#memberPw input[type="text"]').val();
	
	//PW입력란 공백 유효성 검사
	if(memberPw == ''){
		$('#noticePw').text('비밀번호를 입력하세요');
		$('#noticePw').css('color', 'red');
		$('#memberPw').focus();
		okPw = 1;
	
	}
	//PW입력값 양식에 맞지 않을 때
	else if(!pwJ.test(memberPw)){
		$('#noticePw').text('영어 대소문자, 숫자로 구성된 4~12자리로 다시 입력해주세요.');
		$('#noticePw').css('color', 'red');
		$('#memberPw').focus();
		okPw = 1;
	}
	//PW입력값이 양식에 맞을 때
	else{
		//PW와 ID중복 체크 여부
		if(memberPw == $('#memberId').val()){
			$('#noticePw').text('비밀번호는 아이디와 일치할 수 없습니다.');
			$('#noticePw').css('color', 'red');
			$('#memberPw').focus();
			okPw = 1;
		}
		else{
			$('#noticePw').text('사용가능한 비밀번호 입니다.');
			$('#noticePw').css('color', 'green');
			okPw = 0;
		}
	}
});

//CONFIRM PASSWORD의 PW일치여부 검사
$(document).on('keyup', '#confirmPw', function() {
	//memberPw 변수 생성
	var memberPw = $('#memberPw input[type="text"]').val();
	//alert(memberPw);
	//confirmPw 변수 생성
	var confirmPw = $('#confirmPw').val();
	//alert(confirmPw);

	if(confirmPw == ''){
		$('#noticeCpw').text('비밀번호를 확인해주세요');
		$('#noticeCpw').css('color', 'red');
		okCPw = 1;
	}
	//컨펌창 비밀번호일치
	else if(memberPw == confirmPw){
		$('#noticeCpw').text('비밀번호가 일치합니다.');
		$('#noticeCpw').css('color', 'green');
		okCPw = 0;
	}
	//컨펌창 비밀번호 불일치
	else{
		$('#noticeCpw').text('비밀번호가 일치하지 않습니다.');
		$('#noticeCpw').css('color', 'red');
		$('#confirmPw').focus();
		okCPw = 1;
	}
});


//함수선언영역
(function($){
	
	//주소찾기 팝업창 api
	openPostCode = function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memberAddr1').value = data.address;
                $('#memberAddr2').focus();
	        }
	    }).open();
	}
	
	
	//회원 탈퇴 버튼을 누르면 탈퇴하기
	deleteMember = function(memberCode){
		var result = confirm('정말로 탈퇴하시겠습니까?');
		if(result){
			location.href='/member/deleteMember?memberCode=' + memberCode;
		}
	}
	
	
	//수정 버튼을 누르면 수정하기
	updateMyInfo = function(memberCode){
		
		//버튼의 글자가 수정일때
		if($('#updateMyInfo').val() == '수정'){
			
			
			//회원 정보 삽입
			
			//연락처 자르기
			var memberTel = $('#memberTel').text();
			var memberTels = memberTel.split('-');
			//alert(memberTels[0]);
			//alert(memberTels[1]);
			
			//연락처 데이터 삽입
			$('#memberTel').empty();
			var str = '';
			str += '<select id="memberTel1" name="memberTels">';
			str += '	<option value="010">010</option>';
			str += '	<option value="011">011</option>';
			str += '	<option value="016">016</option>';
			str += '	<option value="017">017</option>';
			str += '	<option value="018">018</option>';
			str += '	<option value="019">019</option>';
			str += '</select>';
			str += '<input type="text" id="memberTel2" name="memberTels" maxlength="4" value="' + memberTels[1] + '">';
			str += '<input type="text" id="memberTel3" name="memberTels" maxlength="4" value="' + memberTels[2] + '">';
			$('#memberTel').append(str);
			
			//가져온 벨류값에 따른 샐랙트박스 선택하기
			$('#memberTel1 > option').each(function(index, element){
				if($(element).val() == memberTels[0]){
					$(element).attr('selected', true);
				}
				
			});
			
			//이메일 자르기
			var memberEmail = $('#memberEmail').text();
			var memberEmails = memberEmail.split('@');
			//alert(memberEmails[0]);
			//alert(memberEmails[1]);
						
			//이메일 데이터 삽입
			$('#memberEmail').empty();
			var str = '';
			str += '<input type="text" id="memberEmail1" name="memberEmails" value="' + memberEmails[0] + '">';
			str += '<select id="memberEmail2" name="memberEmails">';
			str += '	<option value="naver.com">naver.com</option>';
			str += '	<option value="daum.net">daum.net</option>';
			str += '	<option value="gmail.com">gmail.com</option>';
			str += '	<option value="nate.com">nate.com</option>';
			str += '</select>';
			$('#memberEmail').append(str);
			
			$('#memberEmail2 > option').each(function(index, element){
				if($(element).val() == memberEmails[1]){
					$(element).attr('selected', true);
				}
				
			});
			
			//비밀번호
			var memberPw = $('#memberPw').text();
			
			//패스워드 데이터 삽입
			$('#memberPw').html('<input type="text" id="memberPw" name="memberPw" maxlength="12" value="' + memberPw + '">');
			
			//주소값
			var memberAddr1 = $('#memberAddr1').text();
			var memberAddr2 = $('#memberAddr2').text();	
			//alert(memberAddr1);
			//alert(memberAddr2);
			
			//주소 데이터 삽입
			$('#detailMyInfo tr:nth-child(4) td:nth-child(3)').text('도로명/지번주소');
			$('#memberAddr').html('<input type="text" id="memberAddr1" name="memberAddr1" value="' + memberAddr1 + '"readonly>&nbsp;&nbsp;<input type="button" id="memberAddrBtn" onclick="openPostCode();" value="주소검색">');
			
			//비밀번호확인창, 상세주소창 삽입
			var str = '';
			str += '	<tr>';
			str += '		<td>비밀번호확인</td>';
			str += '		<td><input type="text" id="confirmPw" maxlength="12"><div id="noticeCpw">&nbsp;</div></td>';
			str += '		<td>상세주소</td>';
			str += '		<td><input type="text" id="memberAddr2" name="memberAddr2" value="' + memberAddr2 + '"></td>';
			str += '	</tr>';
			$('#addTr').after(str);
			
			//버튼의 글자를 수정으로 변경하고 취소버튼 추가
			$('#updateMyInfo').val('확인');
			var str = '';
			str += '	<div class="cancelMyInfoBtn"><input type="button" value="취소" onclick="history.go();"></div>';
			$('.updateMyInfoBtn').append(str);
			
			
			
		}
		//확인 버튼을 누르면 수정된 정보를 업데이트
		else if($('#updateMyInfo').val() == '확인'){
			//연락처
			var memberTel = $('#memberTel1').val() + '-' + $('#memberTel2').val() + '-' + $('#memberTel3').val();
			//alert(memberTel);
			//이메일
			var memberEmail = $('#memberEmail1').val() + '@' + $('#memberEmail2').val();
			//alert(memberEmail);
			//alert($('#memberAddr1').val());
			//alert($('#memberAddr2').val());
			var memberPw = $('#memberPw input[type="text"]').val();
			var memberAddr1 = $('#memberAddr1').val();
			var memberAddr2 = $('#memberAddr2').val();
			//alert(memberPw);
			//alert(memberCode);
			
						
			var result = confirm('정보를 수정하시겠습니까?');
			if(result){
				var email1 = $('#memberEmail1').val();
				if(email1 == '' || email1 == null) {
					okEmail = 2;
				}
				if(okTel == 0 && (okEmail == 0 ||okEmail == 2) && okPw == 0 && okCPw == 0){
					if(okEmail == 2){
						memberEmail = '';
					}
					//alert(memberAddr1);
					//alert(memberAddr2);
					$.ajax({
			            url: '/member/updateMyInfo', //요청경로
			            type: 'post',
			            data:{'memberCode':memberCode
			            		, 'memberPw':memberPw
			            		, 'memberEmail':memberEmail
			            		, 'memberTel':memberTel
			            		, 'memberAddr1':memberAddr1
			            		, 'memberAddr2':memberAddr2
			            		}, //필요한 데이터
			            success: function(result) {
			               	if(result){
								alert('회원정보가 수정되었습니다.');
								//updatedDetailMember(memberCode);
								location.href="/member/myPage";
								
								
								
						   	}
			            },
			            error: function(){
			             //ajax 실행 실패 시 실행되는 구간
			               alert('실패');
			           	}
			    	});
						
						
					
				}
				else{
					alert('회원정보가 올바르게 입력되지 않았습니다.')
					return;
				}
			}
		}	
	}
	
		 
//	//회원정보 상세조회
//	updatedDetailMember = function(memberCode){
//		
//		$.ajax({
//			url: '/member/updatedDetailMember', //요청경로
//			type: 'post',
//			data:{'memberCode':memberCode}, //필요한 데이터
//			success: function(result) {
//				$('#detailMyInfo').empty();
//				
//				var str = '';
//				str += '	<table>';
//				str += '		<colgroup>';
//				str += '			<col width="14%">';
//				str += '			<col width="36%">';
//				str += '			<col width="14%">';
//				str += '			<col width="36%">';
//				str += '		</colgroup>';
//				str += '		<tr>';
//				str += '			<td>회원아이디</td>';
//				str += '			<td>' + result.memberId + '<div>&nbsp;</div></td>';
//				str += '			<td>가입일</td>';
//				str += '			<td>' + result.memberJoinDate + '<div>&nbsp;</div></td>';
//				str += '		</tr>';
//				str += '		<tr>';
//				str += '			<td>회원이름</td>';
//				str += '			<td>' + result.memberName + '<div>&nbsp;</div></td>';
//				str += '			<td>성별</td>';
//				str += '			<td>' + result.memberGender + '<div>&nbsp;</div></td>';
//				str += '		</tr>';
//				str += '		<tr>';
//				str += '			<td>회원연락처</td>';
//				str += '			<td id="memberTel">' + result.memberTel + '<div id="noticeTel">&nbsp;</div></td>';
//				str += '			<td>회원이메일</td>';
//				str += '			<td id="memberEmail">' + result.memberEmail + '<div id="noticeEmail">&nbsp;</div></td>';
//				str += '		</tr>';
//				str += '		<tr>';
//				str += '			<td>회원비밀번호</td>';
//				str += '			<td id="memberPw">' + result.memberPw + '<div id="noticePw">&nbsp;</div></td>';
//				str += '			<td>회원주소</td>';
//				str += '			<td id="memberAddr">' + result.memberAddr1 + ' ' + result.memberAddr2 +'<div>&nbsp;</div></td>';
//				str += '		</tr>';
//				str += '	</table>';
//				str += '	<div class="manageMyInfoBtnDiv">';
//				str += '		<div class="updateMyInfoBtn">';
//				str += '			<input type="button" id="updateMyInfo" value="수정" onclick="updateMyInfo(\'' + result.memberCode + '\');">';
//				str += '		</div>';
//				str += '	</div>';
//				
//				$('#detailMyInfo').append(str);
//				
//			},
//			error: function(){
//				//ajax 실행 실패 시 실행되는 구간
//				alert('실패');
//			}
//		});
//	}	
		
			
	
	
	
	
})(jQuery);