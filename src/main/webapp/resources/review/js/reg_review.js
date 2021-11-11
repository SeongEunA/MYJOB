
var img_count = 1;

//화면 로딩 후 바로 실행
$(document).ready(function(){
    //input 파일첨부 버튼 클릭하면 실행되는 change 메서드
	    //$("#img").change(function fileadd() {
	   // $('[id^="img"]').change(function fileadd() {
	    $(document).on('change', '[id^="img"]', function() {
	    	var inputTagCnt = $('#pr_img').children().length;
	    	if(inputTagCnt <= 3){
	    		
	    	
	    	var reader = new FileReader;
	    //이미지 파일 정보와 화면출력을 위해 <img> 태그를 변수로 만듦
	        var str = '';
	        str += '<div class="imgDiv">';
	        str += "<img id='img"+(img_count)+"' src=''/  style='margin-left:10px; margin-right:10px;'>";
/*	        str += '<img id="img'+(img_count)+'" src=""/ class="preImgList">';*/
	        str += '<div class="title">';
	        str += '<a class="more" onclick="aaaaa(this, ' + img_count + ');">사진 삭제</a>';
	        str += '</div>';
	        str += '</div>';
	    //파일 경로에 넣기 위해 String으로 변환시켜줌
	        var img_count_string = img_count.toString();
	        
	    //jQuery append 메서드를 사용해 <div id="pr_img"> 안에 <img> 태그 변수를 추가해줌
	        $("#pr_img").append(str);
	    //<img src=""> 사용자가 업로드한 이미지 파일 경로를 src로 저장해줌(data.target.result) 
	        
	    //onload는 파일이 업로드 완료된 시점에 function을 발생시키는 메서드
	        reader.onload = function(data) {
	    //태그 안의 속성을 입력할 수 있는 jQuery attr 메서드를 사용 
           $('#img' + img_count_string).attr('src', data.target.result).width(300).height(300);
	       };
	      
	   //    $('#img_' + img_count).attr('src', data.target.result).width(150).height(150);
	   //   };	
	    
	        
	    //화면에 이미지를 출력해주는 FileReader 객체 인스턴스 reader.readAsDataURL();
	    //this.files는 <input type="file">을 통해 업로드한 파일의 정보를 저장하고 있는 배열이다.
	    //첨부하기 1회당 file 하나만 업로드해서 <img_0,1,2...>에 각각의 파일들을
	    //할당시켜줄 것이기 때문에 files[0]로 index 고정
	        reader.readAsDataURL(this.files[0]);
	        
	       
        	$(this).hide();	        	
	        str1 = '';
	      //  str1 += '<div >';
	        str1 += '<input type="file" id="img_file' + img_count + '" name="file' + img_count + '">';
	     //   str1 += '</div>';
	        //str1 += '<input type="button" value="x" onclick="deleteImg(' + img_count_string  +');" class="img_btn' + img_count + '">';
	        
	        $('#pr_img_text').append(str1);
	        img_count++;
	    	}
	    	else{
	    		noticeCon();
	    	}
	    });
	    
	    
	/*    $(document).on('click', '[class^="img"]', function() {
	    	 var getId = $(this).attr('class');
	    	 alert(getId);
	    	 var getRealId = getId.substring(7,8);
	    	 alert(getRealId);
	    	 var count_string = getRealId.toString();
	    	 //첨부된 파일 삭제
		
				
		     //이미지 숨기기
		     $('#img'+ count_string).hide();
		     
		     //버튼 숨기기
		     $(this).hide();
	    });    */
	    
	
	    
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


	    noticeCod();
});

//함수 선언 영역
(function($){
	aaaaa = function(selectedTag, number){
		$(selectedTag).parent().parent().remove();
	
		$('#img_file' + number).remove();
		
//		var inputTagCnt = $('#pr_img_text').children().length;
//		if(inputTagCnt == 1){
//			$('#pr_img_text').children().first().css('display', 'inline');
//		}
		/*$('#pr_img_text').children().last().css('display', 'inline');*/
		var inputTagCnt = $('#pr_img_text').children().length;
		if(inputTagCnt == 0 || (inputTagCnt + 1) == number){
			/*img_count = 2;*/
		/*	$('#img' + number).css('display', 'inline');*/
			$('#pr_img_text').append('<input type="file" id="img_file' + number + '" name="file' + number + '">');
		}

		
	}
/*	deleteImg = function(){
		var img_count_string = img_count.toString();
		var fileName= '#img_file'+ count_string;
		alert(fileName);
		 //첨부된 파일 삭제
			window.reset = function(e) {
			  e.wrap('<form>').closest('form').get(0).reset();
			  e.unwrap();
			}
			
	     //이미지 숨기기
	     $('#img'+ img_count_string).hide();
	     
	     //버튼 숨기기
	     $('.img_btn'+ img_count_string).hide();
	     
		
	}*/
	//첨부파일 개수를 초과할 경우 알림창
	noticeCon= function(){
		alert('등록하실 수 있는 이미지 파일의 최대 개수는 3개입니다.');
		var noticeCod = $('#selectCourseCode').children().length;
		alert(noticeCode);
	}
	
	noticeCod= function(){
	var noticeCod = $('#selectCourseCode').children().length;
	if(noticeCod == 0){
		alert('담은 코스가 없습니다');
		alert('코스를 담은 후에 후기를 작성해주세요');
		location.href = '/course/courseSearch' 
	}
	}
	
	
})(jQuery);
























