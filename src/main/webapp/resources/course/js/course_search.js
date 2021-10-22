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
               $('#lowLocation').empty(); //하위태그만 삭제
               var str='';
           
               
              $(result).each(function(index,element){
              
             	str += '<option>';
             	str +=element.lowLocationName;
             	str+='</option>';
           
              
              });
               
               $('#lowLocation').prepend(str);
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