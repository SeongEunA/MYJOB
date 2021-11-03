var okId = 0;
var okName = 0;
var okPw = 0;
var okCPw = 0;
var okTel = 0;
var okEmail = 0;
//화면 로딩 후 바로 실행 이벤트처리
$(document).ready(function(){
	//회원가입 화면으로 오면 ID입력란에 자동포커스
	$('#memberId').focus();
	
	//------------------이름관련 유효성검사----------------------//
	//이름관련 유효성검사 시작
	$(document).on('keyup', '#memberName', function() {
		//이름 정규표현식 공백 포함안함
		var nameJ = /^[가-힣]{2,7}$/; // 성씨(최대2글자)를 포함한 이름(최대5글자) 최소2~최대7자 이내로 생성.
		
		//memberName 변수 생성
		var memberName = $('#memberName').val();
		
		
		//이름 입력란 공백 유효성 검사
		if(memberName == ' '){
			$('#noticeName').text('이름을 입력하세요.');
			$('#noticeName').css('color', 'red');
			$('#memberName').focus();
			okName = 0;
		}
		//NAME입력값 양식에 맞지 않을 때
		else if(!nameJ.test(memberName)){
			$('#noticeName').text('성을 포함한 2~7자리의 한글 이름으로 다시 입력해주세요.');
			$('#noticeName').css('color', 'red');
			$('#memberName').focus();
			okName = 0;
		}
		//NAEM입력값 양식에 일치할 때
		else if(nameJ.test(memberName)){
			$('#noticeName').text('사용 가능한 이름입니다.');
			$('#noticeName').css('color', 'green');
			okName = 1;
		}
	});
	
	//------------------비밀번호관련 유효성검사----------------------//
	//PW관련 유효성검사 시작
	$(document).on('keyup', '#memberPw', function() {
		//------------------------정규표현식-------------------------//
		// 비밀번호 정규표현식
		var pwJ = /^[A-Za-z0-9]{4,12}$/; // 영어 대소문자 (A~Z or a~z), 숫자 0~9로 시작하는 4~12자리 비밀번호로 생성.
		
		//memberPw 변수 생성
		var memberPw = $('#memberPw').val();
		
		//PW입력란 공백 유효성 검사
		if(memberPw == ' '){
			$('#noticePw').text('비밀번호를 입력하세요');
			$('#noticePw').css('color', 'red');
			$('#memberPw').focus();
			okPw = 0;
		
		}
		//PW입력값 양식에 맞지 않을 때
		if(!pwJ.test(memberPw)){
			$('#noticePw').text('영어 대소문자, 숫자로 구성된 4~12자리로 다시 입력해주세요.');
			$('#noticePw').css('color', 'red');
			$('#memberPw').focus();
			okPw = 0;
		}
		//PW입력값이 양식에 맞을 때
		else{
			//PW와 ID중복 체크 여부
			if(memberPw == $('#memberId').val()){
				$('#noticePw').text('비밀번호는 아이디와 일치할 수 없습니다.');
				$('#noticePw').css('color', 'red');
				$('#memberPw').focus();
				okPw = 0;
			}
			else{
				$('#noticePw').text('사용가능한 비밀번호 입니다.');
				$('#noticePw').css('color', 'green');
				okPw = 1;
			}
		}
	});
	
	//CONFIRM PASSWORD의 PW일치여부 검사
	$(document).on('keyup', '#confirmPw', function() {
		//memberPw 변수 생성
		var memberPw = $('#memberPw').val();
		//confirmPw 변수 생성
		var confirmPw = $('#confirmPw').val();

		if(okPw == 0){
			$('#noticeCpw').text('비밀번호를 다시 한번 확인 해주세요.');
			$('#noticeCpw').css('color', 'red');
			$('#memberPw').focus();
			okCPw = 0;
		}
		//컨펌창 비밀번호일치
		else if(memberPw == confirmPw){
			$('#noticeCpw').text('비밀번호가 일치합니다.');
			$('#noticeCpw').css('color', 'green');
			okCPw = 1;
		}
		//컨펌창 비밀번호 불일치
		else{
			$('#noticeCpw').text('비밀번호가 일치하지 않습니다.');
			$('#noticeCpw').css('color', 'red');
			$('#confirmPw').focus();
			okCPw = 0;
		}
	});
	
	//------------------연락처 관련 유효성검사----------------------//
	//------------------가운데 연락처 관련 유효성검사----------------------//
	$(document).on('keyup', '#memberTel2', function() {
		// 휴대폰 번호 2번째 정규표현식
		var tel2J = /^([0-9]{3,4})$/; // - (3~4자리) - 의 형식으로만 생성.
		
		//memberTel2, membertel3 변수 생성
		var memberTel2 = $('#memberTel2').val();
		
		
		//memberTel입력란 공백 유효성 검사
		if(memberTel2 == ' '){
			$('#noticeTel').text('연락처를 입력하세요.');
			$('#noticeTel').css('color', 'red');
			$('#memberTel2').focus();
			okTel = 0;
		}
		//memberTel2,3입력란이 양식에 맞지 않을 때
		else if(!tel2J.test(memberTel2)){
			$('#noticeTel').text('올바르지 않은 연락처 입니다.');
			$('#noticeTel').css('color', 'red');
			$('#memberTel2').focus();
			okTel = 0;
		}
		//memverTel2,3 입력란이 양식에 맞을 때
		else{
			$('#noticeTel').text('사용 가능한 연락처 입니다.');
			$('#noticeTel').css('color', 'green');
			okTel = 1;
		}
		
	});
	//------------------마지막 연락처 관련 유효성검사----------------------//
	$(document).on('keyup', '#memberTel3', function() {
		// 휴대폰 번호 3번째 정규표현식
		var tel3J = /^([0-9]{4})$/; // - (4자리) - 의 형식으로만 생성.
		
		//memberTel2, membertel3 변수 생성
		var membertel3 = $('#memberTel3').val();
		
		
		//memberTel입력란 공백 유효성 검사
		if(memberTel3 == ' '){
			$('#noticeTel').text('연락처를 입력하세요.');
			$('#noticeTel').css('color', 'red');
			$('#memberTel3').focus();
			okTel = 0;
		}
		//memberTel2,3입력란이 양식에 맞지 않을 때
		else if(!tel3J.test(membertel3)){
			$('#noticeTel').text('올바르지 않은 연락처 입니다.');
			$('#noticeTel').css('color', 'red');
			$('#memberTel3').focus();
			okTel = 0;
		}
		//memverTel2,3 입력란이 양식에 맞을 때
		else{
			$('#noticeTel').text('사용 가능한 연락처 입니다.');
			$('#noticeTel').css('color', 'green');
			okTel = 1;
		}
		
	});
	
	//------------------이메일 관련 유효성검사----------------------//
	//Email의 유효성검사 시작
	$(document).on('keyup', '#memberEmail1', function() {
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
					$('#noticeEmail').text('중복된 이메일입니다.');
					$('#noticeEmail').css('color', 'red');
					$('#memberEmail1').focus();
					okEmail = 2;
				}
				else{
					$('#noticeEmail').text('사용 가능한 이메일입니다.');
					$('#noticeEmail').css('color', 'green');
					okEmail = 1;
				}
				
			},
			error: function(){
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
		
	});
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
					$('#noticeEmail').text('중복된 이메일입니다.');
					$('#noticeEmail').css('color', 'red');
					okEmail = 2;
				}
				else{
					$('#noticeEmail').text('사용 가능한 이메일입니다.');
	        		$('#noticeEmail').css('color', 'green');
	        		okEmail = 1;
				}
	            	
			},
			error: function(){
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
		
	});
   
});

//함수 선언 영역


//1. 중복확인 버튼을 누르면 ID관련 유효성 검사 시작
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
	
	idCheck = function(){
		//모든 공백 체크 정규표현식
		var empJ = /\s/;
		//아이디 정규표현식
		var idJ = /^[a-z0-9]{4,12}$/; // 영어소문자 a~z 나 숫자 0~9로 시작하는 4~12자리 아이디를 생성.
		//memberId 변수 생성
		var memberId = $('#memberId').val();
		
		//ID입력란 공백 및 ID사이 공백여부 유효성 검사
		if(memberId == ' '){
			$('#noticeId').text('아이디를 입력하세요.');
			$('#noticeId').css('color', 'red');
			$('#memberId').focus();
			okId = 0;
		}
		
		//ID양식 유효성 검사 후 ID중복체크
		else {
			//ID입력값이 ID입력양식에 어긋날 때
			if(!idJ.test(memberId) || empJ.test(memberId)){
				$('#noticeId').text('한글 또는 특수문자를 제외한 영어소문자, 숫자로만 구성된 4~12자리로 다시 입력하세요.');
				$('#noticeId').css('color', 'red');
				$('#memberId').focus();
				okId = 0;
			}
			//ID입력값이 ID입력양식에 일치할 때
			else{
				//ID중복체크
				$.ajax({
		            url: '/member/idCheck', //요청경로
		            type: 'post',
		            data:{'memberId':memberId}, //필요한 데이터
		            success: function(result) {
		            	//기가입 : true, 미가입 : false
		            	//아이디 중복 일 때.
		            	if(result){
		            		alert('중복된 아이디 입니다.')
		            		$('#noticeId').text('중복된 아이디 입니다.');
		    				$('#noticeId').css('color', 'red');
							$('#memberId').focus();
							okId = 0;
						}
						else{
							alert('사용 가능한 아이디입니다.')
							$('#noticeId').text('사용 가능한 아이디입니다.');
		    				$('#noticeId').css('color', 'green');
		    				$('#memberName').focus();
							okId = 1;
						}
		            	
		            },
		            error: function(){
		             //ajax 실행 실패 시 실행되는 구간
		               alert('실패');
		            }
		      	});
			}
		}
	};
	
	//모든 정보가 제대로 입력됬을 경우에만 submit
	goInsertMember = function(){
		if(okId == 1 && okName == 1 && okPw == 1 && okCPw == 1 && okTel == 1 && (okEmail == 0 || okEmail == 1)){
			$('#joinForm').submit
		}
		else{
			alert('회원정보가 올바르게 입력되지 않았습니다.')
			return;
		}
	}
	
})(jQuery);











