//화면 로딩 후 바로 실행
$(document).ready(function(){
	    
	    var img_count = 0;
	        
	    //input 파일첨부 버튼 클릭하면 실행되는 change 메서드
	    //$("#img").change(function fileadd() {
	   // $('[id^="img"]').change(function fileadd() {
	    $(document).on('change', '[id^="img"]', function() {
	        var reader = new FileReader;
	    //이미지 파일 정보와 화면출력을 위해 <img> 태그를 변수로 만듦
	        var str = "<img id='img_"+(img_count)+"' src=''/  style='margin-left:20px;margin-bottom:20px;'>";
	    //파일 경로에 넣기 위해 String으로 변환시켜줌
	        var img_count_string = img_count.toString();
	        
	    //jQuery append 메서드를 사용해 <div id="pr_img"> 안에 <img> 태그 변수를 추가해줌
	        $("#pr_img").append(str);
	    //<img src=""> 사용자가 업로드한 이미지 파일 경로를 src로 저장해줌(data.target.result) 
	        
	    //onload는 파일이 업로드 완료된 시점에 function을 발생시키는 메서드
	        reader.onload = function(data) {
	    //태그 안의 속성을 입력할 수 있는 jQuery attr 메서드를 사용 
           $('#img_' + img_count_string).attr('src', data.target.result).width(300).height(300);
	       };
	      
	   //    $('#img_' + img_count).attr('src', data.target.result).width(150).height(150);
	   //   };	
	        	
	        
	    //화면에 이미지를 출력해주는 FileReader 객체 인스턴스 reader.readAsDataURL();
	    //this.files는 <input type="file">을 통해 업로드한 파일의 정보를 저장하고 있는 배열이다.
	    //첨부하기 1회당 file 하나만 업로드해서 <img_0,1,2...>에 각각의 파일들을
	    //할당시켜줄 것이기 때문에 files[0]로 index 고정
	        reader.readAsDataURL(this.files[0]);
	        img_count++;
	        
	        $(this).hide();
	        $('#pr_img_text').append('<input type="file" value="새로운" id="img' + img_count + '" name="file' + img_count + '">');
	    });
	    
	    
	    //selectBox 값 변경시 출력되는 코스 변경
	    $(document).on('change', '#selectCourseCode', function(){
	    	var courseCode = $('#selectCourseCode').val();
	    	
	    	$.ajax({
				url: '/review/changeSelectBoxAjax', //요청경로
				type: 'post',
				data:{'courseCode':courseCode}, //필요한 데이터
				success: function(result) {
					$('.selectCourseDiv').empty();
					
					var listStr = '';
					
					$(result).each(function(index,element){
						listStr += '<div class="courseBox">';
						
						$(element.coursePlaceList).each(function(i,placeInfo){
							if(element.coursePlaceList.length == (i+1)){
								listStr += '<div class="placeName">' + placeInfo.placeName;
								listStr += '</div>';
							}
							else{
								listStr += '<div class="placeName">' + placeInfo.placeName;
								listStr += '</div> &#10140;';
							}
						});
						
						listStr += '	</div>';
						
					});
					
					$('.selectCourseDiv').append(listStr);
	               
	            },
	            error: function(){
	            	alert('실패');
	            }
			});
	    });

	
   
});

//함수 선언 영역
(function($){
	
	
	
	
})(jQuery);
























