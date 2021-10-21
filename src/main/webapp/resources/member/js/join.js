//화면 로딩 후 바로 실행
$(document).ready(function(){
	//ID INPUT태그 클릭 시 빨간 글자 지우기
	//$(document).on('click', '#memberId', function() { 
		//$('#confirmId').remove();
	//});
   
   
   
});

//함수 선언 영역
(function($){
	//회원가입 시 모든 데이터의 유효성 검사 진행 후 회원가입 진행
	idCheckbtn = function(){
		alert('성공');
		//----------- 데이터 유효성 검사------------------//
		
		
		//모든 공백 체크 정규식
		var empJ = /\s/;
		//아이디 정규식
		var idJ = /^[a-z0-9]{4,12}$/; // a~z, 0~9로 시작하는 4~12자리 아이디를 만들 수 있다.
		// 비밀번호 정규식
		var pwJ = /^[A-Za-z0-9]{4,12}$/; // A~Z, a~z, 0~9로 시작하는 4~12자리 비밀번호를 설정할 수 있다.
		// 이름 정규식
		var nameJ = /^[가-힣]{2,6}$/; // 가~힣, 한글로 이뤄진 문자만으로 2~6자리 이름을 적어야 한다.
		// 이메일 검사 정규식
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //위와 비슷한데 - _ 특수문자가 가능하며 중앙에 @ 필수 그리고, 뒤에 2~3글자가 필요하다.
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // - 생략하고 01?(3글자) 방식으로 나머지 적용해서 보면 된다.
		
		
		//1. ID 관련 유효성 검사
		var memberId = $('#memberId').val();
		//ID입력란 공백 유효성 검사
		if(memberId == ''){
			$('#insertId').remove();
			$('#memberId').after('<div id="insertId" style="color: red; font-size: 12px; margin-top: 2px;">아이디를 입력하세요.</div>');
			$('#memberId').focus();
		}
		//ID입력값 사이의 공백 유효성 검사
		else if(empJ.test(memberId)){
			$('#memberId').val('');
			$('#insertId').remove();
			$('#retryInsertId').remove();
			$('#memberId').after('<div id="retryInsertId" style="color: red; font-size: 12px; margin-top: 2px;">아이디를 다시 입력하세요.</div>');
			$('#memberId').focus();
		}
		
		//ID양식 유효성 검사
		else if(memberId != '' || !empJ.test(memberId)){
			if(!idJ.test(memberId)){
				$('#memberId').val('');
				$('#insertId').remove();
				$('#retryInsertId').remove();
				$('#memberId').after('<div id="retryInsertId" style="color: red; font-size: 12px; margin-top: 2px;">한글 또는 특수문자를 제외한 영어소문자, 숫자로만 구성된 4~12자리로 다시 입력하세요.</div>');
				$('#memberId').focus();
			}
			else{
				$('#insertId').remove();
				$('#retryInsertId').remove();
				$('#memberId').after('<div id="retryInsertId" style="color: green; font-size: 12px; margin-top: 2px;">사용가능한 아이디입니다.</div>');
			}
		}
		
		
		
		//회원가입으로 가기
		
		
	};
	
	//ID 중복 체크
	checkId = function(){
		var id = $('#id').val();
		
		if(id == ''){
			var aaa = $('#checkIdDiv').next().attr('id');
			
			if(aaa != 'aaa'){
				//선택한 태그 뒤에 html코드를 넣는다.
				$('#checkIdDiv').after('<div id="aaa" style="color: red; font-size: 20px; margin-top: 2px;">아이디를 입력하세요.</div>');
			}
			
			return ;
		}
		
		//
		$.ajax({
            url: '/member/checkId', //요청경로
            type: 'post',
            data:{'id':id}, //필요한 데이터
            success: function(result) {
            	//기가입 : true, 미가입 : false
            	
            	//아이디 중복 일 때.
            	if(result){
					$('#checkIdDiv').after('<div id="aaa" style="color: red; font-size: 20px; margin-top: 2px;">아이디가 중복입니다.</div>');
				}
				else{
					$('#checkIdDiv').after('<div id="aaa" style="color: blue; font-size: 20px; margin-top: 2px;">사용 가능한 아이디입니다.</div>');
					//$('#joinBtn').addClass('aaa');
					$('#joinBtn').removeClass('disabled');
				}
            	
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      	});
		
		
	};
	
})(jQuery);







































