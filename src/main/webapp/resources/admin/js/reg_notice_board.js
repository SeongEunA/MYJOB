//화면 로딩 후 바로 실행 이벤트처리
$(document).ready(function(){
	$('#boardSubject').focus();
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
	regNoticeBoard = function() {
		var result = confirm('등록하시겠습니까?');
		if(result){
			$('#regNoticeBoardForm').submit();
		}
	}
	
	
	
})(jQuery);