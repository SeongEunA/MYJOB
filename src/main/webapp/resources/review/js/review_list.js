//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	//이벤트 처리
	//$(document).on('click', '#id', function() {
    //});
   
	//ajax 사용
//	$.ajax({
//        url: '', //요청경로
//        type: 'post',
//        data:{}, //필요한 데이터
//        success: function(result) {
//        	//ajax 실행 성공 시 실행되는 구간
//        	alert('성공');
//        },
//        error: function(){
//        	//ajax 실행 실패 시 실행되는 구간
//        	alert('실패');
//        }
//  });
	
	
});

//함수 선언 영역
(function($){
	noticeCod= function(memberId, courseListSize, courseCode){
		
			if(courseListSize == 0){
				alert('담은 코스가 없습니다');
				alert('코스를 담은 후에 후기를 작성해주세요');
				location.href = '/course/courseSearch' 
			}
			else{
				location.href = '/review/regReview?memberId=' + memberId + '&courseCode=' + courseCode; 
			}
		}
   
})(jQuery);
























