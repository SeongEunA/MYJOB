//함수선언영역

(function($){
	regNoticeBoard = function() {
		var result = confirm('등록하시겠습니까?');
		if(result){
			$('#regNoticeBoardForm').submit();
		}
	}
	
	
	
})(jQuery);