//화면 로딩 후 바로 실행
$(document).ready(function(){
	//x버튼 클릭시 실행
	$(document).on('click', '.deletePlaceBtn', function(){
		var savePlaceCode = $(this).prev().val();
		var memberId = $(this).prev().prev().val();

		var placeName = $(this).next().children().eq(0).val();
		var placeAddr = $(this).next().children().eq(1).val();
		var cateCode = $(this).next().children().eq(2).val();
		var x = $(this).next().children().eq(3).val();
		var y = $(this).next().children().eq(4).val();
		
		
		$.ajax({
			url: '/course/deletePlaceInCourseAjax', //요청경로
			type: 'post',
			data:{'savePlaceCode':savePlaceCode,
				  'memberId':memberId}, //필요한 데이터
			success: function(result) {
				//ajax 실행 성공 후 실행할 코드 작성
				$('#courseLayoutLeft').empty();
				
				var deleteStr = '';
				
				deleteStr += '<div class="deletePlaceDiv row">';
				deleteStr += '	<div class="checkbox col-1">';
				deleteStr += '		<input type="checkbox" class="checkbox">';
				deleteStr += '	</div>';
				deleteStr += '	<div class="deletePlace col-11" style="border:1px solid red;">' + placeName;
				deleteStr += '		<input type="hidden" class="placeAddr" value="' + placeAddr + '">';
				deleteStr += '		<input type="hidden" class="cateCode" value="' + cateCode + '">';
				deleteStr += '		<input type="hidden" class="x" value="' + x + '">';
				deleteStr += '		<input type="hidden" class="y" value="' + y + '">';
				deleteStr += '	</div>';
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
							listStr += '		<input type="hidden" name="placeName" value="' + placeInfo.placeName + '">';
							listStr += '		<input type="hidden" name="placeAddr" value="' + placeInfo.placeAddr + '">';
							listStr += '		<input type="hidden" name="cateCode" value="' + placeInfo.cateCode + '">';
							listStr += '		<input type="hidden" name="x" value="' + placeInfo.x + '">';
							listStr += '		<input type="hidden" name="y" value="' + placeInfo.y + '">';
							listStr += '	</div>';
							listStr += '</div>';
						}
						else{
							listStr += '<div class="placeName">';
							listStr += '	<input type="hidden" name="memberId" value="' + memberId + '">';
							listStr += '	<input type="hidden" name="savePlaceCode" value="' + placeInfo.savePlaceCode + '">';
							listStr += placeInfo.placeName + '<input type="button" value="x" class="deletePlaceBtn">';
							listStr += '	<div class="hiddenPlaceInfo">';
							listStr += '		<input type="hidden" name="placeName" value="' + placeInfo.placeName + '">';
							listStr += '		<input type="hidden" name="placeAddr" value="' + placeInfo.placeAddr + '">';
							listStr += '		<input type="hidden" name="cateCode" value="' + placeInfo.cateCode + '">';
							listStr += '		<input type="hidden" name="x" value="' + placeInfo.x + '">';
							listStr += '		<input type="hidden" name="y" value="' + placeInfo.y + '">';
							listStr += '	</div>';
							listStr += '</div> &#10140;';
						}
					});
					
					listStr += '	</div>';
					
				});
				
				listStr += '<div>'
				listStr += '	<span>'
				listStr += '		<input type="submit" value="추천코스보기" onClick="clickRecommendCourse(this.value);" id="courseRecommendBtn">'
				listStr += '	</span>'
				listStr += '</div>'
				
				$('#selectCourseCode').after(deleteStr);
				$('#courseLayoutLeft').append(listStr);
			},
			error: function(){
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	});
	
	//코스저장버튼 클릭시 실행
	$(document).on('click', '#saveCourseBtn', function(){
		var courseCode = $('#selectCourseCode option:selected').val();
		
		var memberId = $(this).next().val();
		
		var placeName = $('.checkbox:checked').parent().next().text();
		var placeAddr = $('.checkbox:checked').parent().next().children().eq(0).val();
		var cateCode = $('.checkbox:checked').parent().next().children().eq(1).val();
		console.log(courseCode);
		console.log(memberId);
		console.log(placeName);
		console.log(placeAddr);
		console.log(cateCode);
		$.ajax({
			url: '/course/insertPlaceByDeleteAjax', //요청경로
			type: 'post',
			data:{'memberId':memberId}, //필요한 데이터
			success: function(result) {
				//ajax 실행 성공 후 실행할 코드 작성
				$('#courseLayoutLeft').empty();
				
				var deleteStr = '';
				
				deleteStr += '<div class="deletePlaceDiv row">';
				deleteStr += '	<div class="checkboxDiv col-1">';
				deleteStr += '		<input type="checkbox" class="checkbox">';
				deleteStr += '	</div>';
				deleteStr += '	<div class="deletePlace col-11" style="border:1px solid red;">' + placeName;
				deleteStr += '		<input type="hidden" class="placeAddr" value="' + placeAddr + '">';
				deleteStr += '		<input type="hidden" class="cateCode" value="' + cateCode + '">';
				deleteStr += '	</div>';
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
							listStr += '	</div>';
							listStr += '</div> &#10140;';
						}
					});
					
					listStr += '</div>';
					
				});
				
				$('#selectCourseCode').after(deleteStr);
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
