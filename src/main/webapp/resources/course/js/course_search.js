//화면 로딩 후 바로 실행
$(document).ready(function(){

	//셀렉트 박스의 값이 변경 되면..
	$(document).on('change', '#highLocation', function() { 
		var highLocationName = $('#highLocation').val();
		$.ajax({
            url: '/course/lowLocationListAjax', //요청경로
            type: 'post',
            data:{'highLocationName':highLocationName}, //필요한 데이터
            success: function(result) {
               //ajax 실행 성공 후 실행할 코드 작성
               alert('성공');
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
		});
	
    });
       
       
	


//함수 선언 영역
(function($){
	
	
	
	
	
         });
      
		
	

	
	
	
})(jQuery);