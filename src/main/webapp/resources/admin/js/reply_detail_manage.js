//함수선언영역

(function($){
	deleteReviewReply = function(reviewReplyCode) {
		var result = confirm('정말로 삭제하시겠습니까?');
		if(result){
			location.href='/admin/deleteReviewReply?reviewReplyCode=' + reviewReplyCode;
		}
	}
	
	
	
})(jQuery);