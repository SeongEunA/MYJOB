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
	//등록버튼 누르면 등록하러가기
	regNoticeBoard = function() {
		var boardSubject = $('#boardSubject').val();
		var boardContent = $('#boardContent').val();
		
		if((boardSubject == '' || boardContent == '') || (boardSubject == '' && boardContent == '')){
			//alert(boardSubject);
			//alert(boardContent);
			alert('내용을 입력해주세요.');
			$('#boardSubject').focus();
		}
		else if((boardSubject == ' ' || boardContent == ' ') || (boardSubject == ' ' && boardContent == ' ')){
			//alert(boardSubject);
			//alert(boardContent);
			alert('빈칸이 입력되었습니다.');
			$('#boardSubject').focus();
		}
		else{
			var result = confirm('등록하시겠습니까?');
			if(result){
				$('#regNoticeBoardForm').submit();
			}
		}
	}
	
	//취소버튼 누르면 공지사항리스트 페이지로 이동
	cencelNoticeBoard = function() {
		location.href = "/common/noticeBoard"
	}
	
	
	
})(jQuery);