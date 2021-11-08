//화면 로딩 후 바로 실행 이벤트처리
$(document).ready(function(){
	$('#memberId').focus();
	//이벤트발생조건, ID, 함수호출
	//$(document).on('focus', '#memberName', function() {
		
	//});
	
	//커서가 사라지면 이벤트발생
	//$('#memberId').blur(function() {
		//alert('111');
	//});

});


//함수선언영역
(function($){
	loginCheck = function(){
		var memberId = $('#memberId').val();
		var memberPw = $('#memberPw').val();
//		alert(memberId);
//		alert(memberPw);
		
		$.ajax({
			url: '/member/loginCheck', //요청경로
			type: 'post',
			data:{'memberId':memberId
					, 'memberPw':memberPw}, //필요한 데이터
			success: function(result) {
				//로그인체크
				if(!result){
//					alert('확인');
//					alert(result);
					$('#noticeLogin').text('아이디 또는 비밀번호를 확인해주세요.');
					$('#noticeLogin').css('color', 'red');
					$('#memberId').focus();
				}
				else{
//					alert('확인');
//					alert(result);
					$('#loginInfoForm').submit();
				}
				
			},
			error: function(){
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
			
		});
		
	};
	
	



})(jQuery);


//로그인 엔터키
$(document).on('keypress', '#loginInfoForm', function(e) {
	if (e.keyCode === 13) {
    	loginCheck();
    }
});














