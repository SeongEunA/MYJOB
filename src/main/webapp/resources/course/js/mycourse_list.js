//화면 로딩 후 바로 실행
$(document).ready(function(){
	//x버튼 클릭시 실행
	$(document).on('click', '.deletePlaceBtn', function(){
		var savePlaceCode = $(this).prev().val();
		var memberId = $(this).prev().prev().val();

		var placeAddr = $(this).next().children().eq(0).val();
		var cateCode = $(this).next().children().eq(1).val();
		var courseCode = $(this).next().children().eq(2).val();
		
		var placeName = $(this).parent().text();
		$.ajax({
			url: '/course/deletePlaceInCourseAjax', //요청경로
			type: 'post',
			data:{'savePlaceCode':savePlaceCode,
				  'memberId':memberId}, //필요한 데이터
			success: function(result) {
				//ajax 실행 성공 후 실행할 코드 작성
				$('#courseLayoutLeft').empty();
				
				var deleteStr = '';
				
				deleteStr += '<div class="deletePlaceDiv" style="border:1px solid red;">' + placeName;
				deleteStr += '	<input type="hidden" value="' + placeAddr + '">';
				deleteStr += '	<input type="hidden" value="' + cateCode + '">';
				deleteStr += '	<input type="hidden" value="' + courseCode + '">';
				deleteStr += '</div>';

				var listStr = '';
				
				$(result).each(function(index,element){
					listStr += '<div class="courseBox">';
					listStr += '	<div class="courseName">코스이름:' + element.courseName + '</div>';
					
					$(element.coursePlaceList).each(function(i,placeInfo){
						if(element.coursePlaceList.length == (i+1)){
							listStr += '<div class="placeName">';
							listStr += '	<input type="hidden" name="memberId" value="' + memberId + '">';
							listStr += '	<input type="hidden" name="savePlaceCode" value="' + placeInfo.savePlaceCode + '">';
							listStr += placeInfo.placeName + '<input type="button" value="x" class="deletePlaceBtn">';
							listStr += '	<div class="hiddenPlaceInfo">';
							listStr += '		<input type="hidden" name="placeAddr" value="' + placeInfo.placeAddr + '">';
							listStr += '		<input type="hidden" name="cateCode" value="' + placeInfo.cateCode + '">';
							listStr += '		<input type="hidden" name="courseCode" value="' + placeInfo.courseCode + '">';
							listStr += '	</div>';
							listStr += '</div>';
						}
						else{
							listStr += '<div class="placeName">';
							listStr += '	<input type="hidden" name="memberId" value="' + memberId + '">';
							listStr += '	<input type="hidden" name="savePlaceCode" value="' + placeInfo.savePlaceCode + '">';
							listStr += placeInfo.placeName + '<input type="button" value="x" class="deletePlaceBtn">';
							listStr += '	<div class="hiddenPlaceInfo">';
							listStr += '		<input type="hidden" name="placeAddr" value="' + placeInfo.placeAddr + '">';
							listStr += '		<input type="hidden" name="cateCode" value="' + placeInfo.cateCode + '">';
							listStr += '		<input type="hidden" name="courseCode" value="' + placeInfo.courseCode + '">';
							listStr += '	</div>';
							listStr += '</div> &#10140;';
						}
					});
					
					listStr += '</div>';
					
				});
				
				$('#courseLayoutRight').append(deleteStr);
				$('#courseLayoutLeft').append(listStr);
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




var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    }
];

	console.log(positions[0].title);
