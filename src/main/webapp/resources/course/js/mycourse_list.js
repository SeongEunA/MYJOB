//화면 로딩 후 바로 실행
$(document).ready(function(){
	$(document).on('click', '.deletePlaceBtn', function(){
		var savePlaceCode = $(this).prev().val();
		var placeAddr = $(this).next().children().eq(0).val();
		var placeTel = $(this).next().children().eq(1).val();
		var cateCode = $(this).next().children().eq(2).val();
		var courseCode = $(this).next().children().eq(3).val();
		
		var placeName = $(this).parent().text();
		
		$.ajax({
			url: '/course/deletePlaceInCourse', //요청경로
			type: 'post',
			data:{'savePlaceCode':savePlaceCode}, //필요한 데이터
			success: function(result) {
				//ajax 실행 성공 후 실행할 코드 작성
				var str = '';
				
				str += '<div class="deletePlaceDiv">' + placeName;
				str += '	<input type="hidden" value="' + placeAddr + '">';
				str += '	<input type="hidden" value="' + placeTel + '">';
				str += '	<input type="hidden" value="' + cateCode + '">';
				str += '	<input type="hidden" value="' + courseCode + '">';
				str += '</div>';
				
				alert(placeName);
				alert(str);
				$('#courseLayoutRight').append(str);
			},
			error: function(){
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	});
});

//함수 선언 영역
(function($){
	clickBtnX = function(savePlaceCode){
		
	}

})(jQuery);