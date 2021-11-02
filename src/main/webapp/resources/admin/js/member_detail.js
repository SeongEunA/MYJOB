//함수선언영역

(function($){
	deleteMember = function(memberCode) {
		var result = confirm('정말로 삭제하시겠습니까?');
		if(result){
			location.href='/admin/deleteMember?memberCode=' + memberCode;
		}
	}
	
	
	
})(jQuery);