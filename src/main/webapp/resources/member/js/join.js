//이벤트처리
//화면 로딩 후 바로 실행 이벤트처리
//$(document).ready(function(){
	//이벤트발생조건, ID, 함수호출
	//$(document).on('focus', '#memberName', function() {
		
	//});
	
	//커서가 사라지면 이벤트발생
	//$('#memberId').blur(function() {
		//alert('111');
	//});

//});


//함수선언영역
//(function($){
	//idCheck = function(){
	//};
//};


function openPostCode(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memberAddr1').value = data.address;
                $('#memberAddr2').focus();
	        }
	    }).open();
	}


//화면 로딩 후 바로 실행 이벤트처리
$(document).ready(function(){
	//회원가입 화면으로 오면 ID입력란에 자동포커스
	$('#memberId').focus();
	$('#checkIdDiv').after('<div id="insertId" style="color: red; font-size: 12px; margin-top: 7px;">아이디를 입력하세요.</div>');
	//회원가입 시 모든 데이터의 유효성 검사 진행 후 회원가입 진행//
	
	
	//------------------이름관련 유효성검사----------------------//
	//2. Name의 Input에서 다른 노드로 전환됬을 때 이름관련 유효성검사 시작
	$(document).on('change', '#memberName', function() {
		//------------------------정규표현식-------------------------//
		//이름 정규표현식 공백 포함안함
		var nameJ = /^[가-힣]{2,7}$/; // 성씨(최대2글자)를 포함한 이름(최대5글자) 최소2~최대7자 이내로 생성.
		//-----------------------------------------------------------//
		
		
		//memberName 변수 생성
		var memberName = $('#memberName').val();
		
		//모든 div문구값 리셋.
		$('#insertName').remove();
		$('#retryInsertName').remove();
		$('#useableName').remove();
		$('#insertPw').remove();
		$('#useablePw').remove();
		$('#retryInsertPw').remove();
		
		//ID입력란 공백 유효성 검사 <-처음에 안먹음 이름 패스한 후 지우고 넘어가면 걸리게 됨 이상함
		if(memberName == ''){
			alert(memberName);
			$('#memberName').after('<div id="insertName" style="color: red; font-size: 12px; margin-top: 7px;">이름을 입력하세요.</div>');
			$('#memberName').focus();
		}
		//NAME입력값 양식에 맞지 않을 때
		else if(!nameJ.test(memberName)){
			$('#memberName').after('<div id="retryInsertName" style="color: red; font-size: 12px; margin-top: 7px;">성을 포함한 2~7자리의 이름으로 다시 입력하세요.</div>');
			$('#memberName').focus();
		}
		//NAEM입력값 양식에 일치할 때
		else if(nameJ.test(memberName)){
			$('#memberName').after('<div id="useableName" style="color: green; font-size: 12px; margin-top: 7px;">사용 가능한 이름입니다.</div>');
			$('#memberPw').after('<div id="insertPw" style="color: red; font-size: 12px; margin-top: 7px;">패스워드를 입력하세요</div>');
			$('#memberPw').focus();
		}
	});
	
	//------------------비밀번호관련 유효성검사----------------------//
	//3. PASSWORD의 Input에서 다른 노드로 전환됬을 때 PW관련 유효성검사 시작
	$(document).on('change', '#memberPw', function() {
		//------------------------정규표현식-------------------------//
		// 비밀번호 정규표현식
		var pwJ = /^[A-Za-z0-9]{4,12}$/; // 영어 대소문자 (A~Z or a~z), 숫자 0~9로 시작하는 4~12자리 비밀번호로 생성.
		//-----------------------------------------------------------//
		
		
		//memberPw 변수 생성
		var memberPw = $('#memberPw').val();
		
		//모든 div문구값 리셋.
		$('#insertPw').remove();
		$('#retryInsertPw').remove();
		$('#useablePw').remove();
		$('#cantMatchPw').remove();
		$('#misMatchPw').remove();
		$('#matchPw').remove();
		$('#unuseableTels').remove();
		$('#insertConfirmPw').remove();
		$('#insertTels').remove();
		
		//PW입력값 양식에 맞지 않을 때
		if(!pwJ.test(memberPw)){
			$('#memberPw').after('<div id="retryInsertPw" style="color: red; font-size: 12px; margin-top: 7px;">영어 대소문자, 숫자로 구성된 4~12자리로 다시 입력하세요.</div>');	
			$('#memberPw').focus();
		}
		//PW입력값이 양식에 맞을 때
		else{
			//PW와 ID중복 체크 여부
			if(memberPw == $('#memberId').val()){
				$('#memberPw').after('<div id="cantMatchPw" style="color: red; font-size: 12px; margin-top: 7px;">PW는 ID와 일치할 수 없습니다.</div>');	
				$('#memberPw').focus();
			}
			else{
				$('#memberPw').after('<div id="useablePw" style="color: green; font-size: 12px; margin-top: 7px;">사용가능한 패스워드 입니다.</div>');
				$('#confirmPw').after('<div id="insertConfirmPw" style="color: red; font-size: 12px; margin-top: 7px;">패스워드를 확인해주세요.</div>');
				$('#confirmPw').focus();
			}
		}
	});
	
	//4. CONFIRM PASSWORD의 Input에서 다른 노드로 전환됬을 때 PW일치여부 검사
	$(document).on('change', '#confirmPw', function() {
		//memberPw 변수 생성
		var memberPw = $('#memberPw').val();
		//confirmPw 변수 생성
		var confirmPw = $('#confirmPw').val();
		
		//모든 div문구값 리셋.
		$('#matchPw').remove();
		$('#misMatchPw').remove();
		$('#cantMatchPw').remove();
		$('#retryInsertPw').remove();
		$('#insertConfirmPw').remove();
		$('#insertTels').remove();
		$('#useableTels').remove();
		$('#unuseableTels').remove();
		
		if(memberPw == confirmPw){
			$('#samePw').remove();
			$('#confirmPw').after('<div id="matchPw" style="color: green; font-size: 12px; margin-top: 7px;">비밀번호가 일치합니다.</div>');
			$('#memberTelsDiv').after('<div id="insertTels" style="color: red; font-size: 12px; margin-top: 7px;">연락처를 입력하세요.</div>');
			$('#memberTel1').focus();
		}
		else{
			$('#confirmPw').after('<div id="misMatchPw" style="color: red; font-size: 12px; margin-top: 7px;">비밀번호가 일치하지 않습니다.</div>');
			$('#confirmPw').focus();
		}
	});
	
	//------------------연락처2 관련 유효성검사----------------------//
	//5-1. TEL의 2번째 Input에서 다른 노드로 전환됬을 때 TEL 관련 유효성검사 시작
	$(document).on('change', '#memberTel2', function() {
		//------------------------정규표현식-------------------------//
		// 휴대폰 번호 2번째 정규표현식
		var tel2J = /^([0-9]{3,4})$/; // - (3~4자리) - 의 형식으로만 생성.
		//-----------------------------------------------------------//
		
		
		//membertel2 변수 생성
		var memberTel2 = $('#memberTel2').val();
		//모든 div문구값 리셋.
		$('#insertTels').remove();
		$('#useableTels').remove();
		$('#unuseableTels').remove();
		
		if(memberTel2 == ''|| !tel2J.test(memberTel2)){
			$('#memberTelsDiv').after('<div id="unuseableTels" style="color: red; font-size: 12px; margin-top: 7px;">양식에 맞지 않습니다. 연락처를 다시 입력해주세요.</div>');
			$('#memberTel2').focus();
		}
		else{
			$('#memberTel3').focus();
		}
		
	});
	
	//------------------연락처3 관련 유효성검사----------------------//
	//5-2. TEL의 3번째 Input에서 다른 노드로 전환됬을 때 TEL 관련 유효성검사 시작
	$(document).on('change', '#memberTel3', function() {
		//------------------------정규표현식-------------------------//
		// 휴대폰 번호 3번째 정규표현식
		var tel3J = /^([0-9]{4})$/; // - (4자리) - 의 형식으로만 생성.
		//-----------------------------------------------------------//
		
		
		//membertel3 변수 생성
		var membertel3 = $('#memberTel3').val();
		//모든 div문구값 리셋.
		$('#insertTels').remove();
		$('#useableTels').remove();
		$('#unuseableTels').remove();
		
		if(!tel3J.test(membertel3)){
			$('#memberTelsDiv').after('<div id="unuseableTels" style="color: red; font-size: 12px; margin-top: 7px;">양식에 맞지 않습니다. 연락처를 다시 입력해주세요.</div>');
			$('#memberTel3').focus();
		}
		else{
			$('#memberTelsDiv').after('<div id="useableTels" style="color: green; font-size: 12px; margin-top: 7px;">사용 가능한 연락처 입니다.</div>');
			$('#memberAddr1').focus();
		}
		
	});
	
	
	//------------------상세주소 관련 유효성검사----------------------//
	//6. ADDRESS의 memberAddr2의 값을 입력 후 다른 노드로 전환됬을 때 memberAddr2의 유효성검사 시작
	$(document).on('change', '#memberAddr2', function() {
		//------------------------정규표현식-------------------------//

		//상세주소 검사 정규표현식
		var addrJ = /^[가-힣0-9\s]+$/; // 한글, 숫자, 공백으로만 입력가능.
		//-----------------------------------------------------------//

		
		//membertel3 변수 생성
		var memberAddr2 = $('#memberAddr2').val();
		
		//모든 div문구값 리셋.
		$('#useableAddr').remove();
		$('#unuseableAddr').remove();
		
		if(!addrJ.test(memberAddr2)){
			$('#memberAddr2').after('<div id="unuseableAddr" style="color: red; font-size: 12px; margin-top: 7px;">양식에 맞지 않습니다. 주소를 다시 입력해주세요.</div>');
			$('#memberAddr2').focus();
		}
		else{
			$('#memberAddr2').after('<div id="useableAddr" style="color: green; font-size: 12px; margin-top: 7px;">사용 가능한 주소입니다.</div>');
			$('#memberEmail1').focus();
		}
		
		
		
		
		
		
	});	
	//------------------이메일 관련 유효성검사----------------------//
	//7. EMAIL의 select를 고른 후 다른 노드로 전환됬을 때 memberEmail1의 유효성검사 시작
	$(document).on('change', '#memberEmail1', function() {
		//------------------------정규표현식-------------------------//
		
		//이메일 검사 정규표현식
		var emailJ = /^[a-z0-9+]{4,12}$/; // 영어소문자 a~z 나 숫자 0~9로 시작하는 4~12자리로 생성.
		//-----------------------------------------------------------//
		
		//memberEmail1 변수 생성
		var memberEmail1 = $('#memberEmail1').val();
		
		//모든 div문구값 리셋.
		$('#useableEmail').remove();
		$('#unuseableEmail').remove();
		
		//양식에 맞지 않을 때
		if(!emailJ.test(memberEmail1)){
			$('#memberEmailDiv').after('<div id="unuseableEmail" style="color: red; font-size: 12px; margin-top: 7px;">양식에 맞지 않습니다. 이메일을 다시 입력해주세요.</div>');
			$('#memberEmail1').focus();
		}
		
		//양식에 맞을 때
		else{
			//이메일 중복체크
			var memberEmail = $('#memberEmail1').val() + '@' + $('#memberEmail2').val();
			$.ajax({
	            url: '/member/emailCheck', //요청경로
	            type: 'post',
	            data:{'memberEmail':memberEmail}, //필요한 데이터
	            success: function(result) {
	            	//기가입 : true, 미가입 : false
	            	//아이디 중복 일 때.
	            	if(result){
						$('#memberEmailDiv').after('<div id="unuseableEmail" style="color: red; font-size: 12px; margin-top: 7px;">중복된 이메일 입니다.</div>');
						$('#memberEmail1').focus();
					}
					else{
						$('#memberEmailDiv').after('<div id="unuseableEmail" style="color: green; font-size: 12px; margin-top: 7px;">사용 가능한 이메일입니다.</div>');
						alert(111);
						$('#joinBtn').removeClass('disabled');
						$('#joinBtn').prop('disabled', false);
					}
	            	
	            },
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패');
	            }
	      	});
			
			
			
		}
		$('#emailCheckDiv').after('<div id="useableEmail" style="color: green; font-size: 12px; margin-top: 7px;">사용 가능한 주소입니다.</div>');
		
		
		
		
		
	});	
   
});











//함수 선언 영역


//1. 중복확인 버튼을 누르면 ID관련 유효성 검사 시작
(function($){
	idCheck = function(){
		//------------------------정규표현식-------------------------//
		//모든 공백 체크 정규표현식
		var empJ = /\s/;
		//아이디 정규표현식
		var idJ = /^[a-z0-9+]{4,12}$/; // 영어소문자 a~z 나 숫자 0~9로 시작하는 4~12자리 아이디를 생성.
		//-----------------------------------------------------------//
		
		
		//memberId 변수 생성
		var memberId = $('#memberId').val();
		
		//모든 div문구값 리셋.
		$('#insertId').remove();
		$('#joinedId').remove();
		$('#retryInsertId').remove();
		$('#useableId').remove();
		$('#insertName').remove();
		$('#retryInsertName').remove();
		$('#useableName').remove();
		$('#retryInsertPw').remove();
		$('#useableTels').remove();
		$('#unuseableTels').remove();
		
		//ID입력란 공백 유효성 검사
		if(memberId == ''){
			$('#checkIdDiv').after('<div id="insertId" style="color: red; font-size: 12px; margin-top: 7px;">아이디를 입력하세요.</div>');
			$('#memberId').focus();
		}
		
		//ID입력값 사이의 공백 유효성 검사
		else if(empJ.test(memberId)){
			$('#checkIdDiv').after('<div id="retryInsertId" style="color: red; font-size: 12px; margin-top: 7px;">아이디를 다시 입력하세요.</div>');
			$('#memberId').focus();
		}
		
		//ID양식 유효성 검사 후 ID중복체크
		//ID입력값이 빈값이 아니거나 ID입력값 사이의 공백이 없으면 아래의 IF문 안으로 접근.
		else if(memberId != '' || !empJ.test(memberId)){
			//ID입력값이 ID입력양식에 어긋날 때
			if(!idJ.test(memberId)){
				$('#checkIdDiv').after('<div id="retryInsertId" style="color: red; font-size: 12px; margin-top: 7px;">한글 또는 특수문자를 제외한 영어소문자, 숫자로만 구성된 4~12자리로 다시 입력하세요.</div>');
				$('#memberId').focus();
			}
			//ID입력값이 ID입력양식에 일치할 때
			else{
				$('#insertId').remove();
				$('#retryInsertId').remove();
				
				//ID중복체크
				$.ajax({
		            url: '/member/idCheck', //요청경로
		            type: 'post',
		            data:{'memberId':memberId}, //필요한 데이터
		            success: function(result) {
		            	//기가입 : true, 미가입 : false
		            	//아이디 중복 일 때.
		            	if(result){
		            		$('#retryInsertName').remove();
							$('#checkIdDiv').after('<div id="joinedId" style="color: red; font-size: 12px; margin-top: 7px;">아이디가 중복입니다.</div>');
							$('#memberId').focus();
						}
						else{
							$('#retryInsertName').remove();
							$('#checkIdDiv').after('<div id="useableId" style="color: green; font-size: 12px; margin-top: 7px;">사용 가능한 아이디입니다.</div>');
							$('#memberName').after('<div id="insertName" style="color: red; font-size: 12px; margin-top: 7px;">이름을 입력하세요.</div>');
							$('#memberName').focus();
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
	
	
	
})(jQuery);







































