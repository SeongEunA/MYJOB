//화면 로딩 후 바로 실행
$(document).ready(function(){
	//x버튼 클릭시 실행
	$(document).on('click', '.deletePlaceBtn', function(){
		var savePlaceCode = $(this).prev().val();
		var memberId = $('#memberId').val();
		
		var placeName = $(this).next().children().eq(0).val();
		var placeAddr = $(this).next().children().eq(1).val();
		var cateCode = $(this).next().children().eq(2).val();
		var x = $(this).next().children().eq(3).val();
		var y = $(this).next().children().eq(4).val();
		
		
		$.ajax({
			url: '/course/deletePlaceInCourseAjax', //요청경로
			type: 'post',
			data:{'savePlaceCode':savePlaceCode,
				  'memberId':memberId,
				  'placeName':placeName,
				  'placeAddr':placeAddr,
				  'cateCode':cateCode,
				  'x':x,
				  'y':y}, //필요한 데이터
			success: function(result) {
				//ajax 실행 성공 후 실행할 코드 작성
				$('#courseLayoutLeft').empty();
				
				var deleteStr = '';
				
				deleteStr += '<div class="deletePlaceDiv row">';
				deleteStr += '	<div>';
				deleteStr += '		<div class="deletePlace col-11"><input type="checkbox" class="checkbox">' + placeName;
				deleteStr += '			<input type="hidden" class="placeName" value="' + placeName + '">';
				deleteStr += '			<input type="hidden" class="placeAddr" value="' + placeAddr + '">';
				deleteStr += '			<input type="hidden" class="cateCode" value="' + cateCode + '">';
				deleteStr += '			<input type="hidden" class="x" value="' + x + '">';
				deleteStr += '			<input type="hidden" class="y" value="' + y + '">';
				deleteStr += '		</div>';
				deleteStr += '	</div>';
				deleteStr += '</div>';//수정
				
				var listStr = '';
				
				listStr += '<form action="/course/theShortestCourse" method="post">';
				listStr += '<input type="hidden" name="memberId" id="memberId" value="' + memberId + '">';
				
				$(result).each(function(index,element){
					listStr += '<div class="courseBox">';
					listStr += '	<div class="courseName"><input type="radio" name="courseCode" value="'+element.courseCode+'">코스이름 : ' + element.courseName + '</div>';
					
					$(element.coursePlaceList).each(function(i,placeInfo){
						if(element.coursePlaceList.length == (i+1)){
							listStr += '<div class="placeName">';
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
				
				listStr += '<div>';
				listStr += '	<span>';
				listStr += '		<input type="submit" value="추천코스보기" onClick="clickRecommendCourse(this.value);" id="courseRecommendBtn" class="deleteRecommendBtn">';
				listStr += '		<input type="button" value="코스삭제" class="deleteCourseBtn" onclick="deleteCourse();">';
				listStr += '	</span>';
				listStr += '</div>';
				listStr += '</form>';
				
				$('#testOne').append(deleteStr);
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
		
		var memberId = $('#memberId').val();
		
		var placeNameArr=[];
		var placeAddrArr=[];
		var cateCodeArr=[];
		var xArr=[];
		var yArr=[];
		
	
		
		
		var placeNameL = $('.checkbox:checked').length;
		//코스저장데이터 확인
		for(var i =0;i<placeNameL;i++){
			placeNameArr[i] =  $('.checkbox:checked').eq(i).parent().children().eq(1).val();
			placeAddrArr[i] = $('.checkbox:checked').eq(i).parent().children().eq(2).val();
			cateCodeArr[i] = $('.checkbox:checked').eq(i).parent().children().eq(3).val();
			xArr[i] = $('.checkbox:checked').eq(i).parent().children().eq(4).val();
			yArr[i] = $('.checkbox:checked').eq(i).parent().children().eq(5).val();
			
			console.log("장소 이름 :"+placeNameArr[i]);
			console.log("주소 이름 :"+placeAddrArr[i]);
			console.log("카테코드 이름 :"+cateCodeArr[i]);
			console.log("x배열 이름 :"+xArr[i]);
			console.log("y배열 이름 :"+yArr[i]);
		}
		
		if(placeNameL == 1){
			$('.checkbox:checked').eq(0).parent().parent().parent().remove();
		}
		else{
			
			for(var i=0;i<placeNameL;i++){
				
				$('.checkbox:checked').eq(i).parent().parent().parent().remove();
				i--
				if($('.checkbox:checked').eq(i).parent().children().eq(1).val()==''||$('.checkbox:checked').eq(i).parent().children().eq(1).val()==null){
					
					i=placeNameL;
				}
			}
			
		}
		
		
		
		$.ajax({
			url: '/course/insertPlaceByDeleteAjax', //요청경로
			type: 'post',
			data:{'memberId':memberId,
				  'courseCode':courseCode,
				  'placeAddrArr':placeAddrArr,
				  'placeNameArr':placeNameArr,
				  'cateCodeArr':cateCodeArr,
				  'xArr':xArr,
				  'yArr':yArr}, //필요한 데이터
			success: function(result) {
				//ajax 실행 성공 후 실행할 코드 작성
				$('#courseLayoutLeft').empty();
				
				var deleteStr = '';
				
				

				var listStr = '';
				
				listStr += '<form action="/course/theShortestCourse" method="post">';
				listStr += '<input type="hidden" name="memberId" id="memberId" value="' + memberId + '">';
				
				$(result).each(function(index,element){
					listStr += '<div class="courseBox">';
					listStr += '	<div class="courseName"><input type="radio" name="courseCode" value="'+element.courseCode+'">코스이름 : ' + element.courseName + '</div>';
					
					$(element.coursePlaceList).each(function(i,placeInfo){
						if(element.coursePlaceList.length == (i+1)){
							listStr += '<div class="placeName">';
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
				
					listStr += '</div>';
					
				});
				
				listStr += '<div>';
				listStr += '	<span>';
				listStr += '		<input type="submit" value="추천코스보기" onClick="clickRecommendCourse(this.value);" id="courseRecommendBtn" class="deleteRecommendBtn">';
				listStr += '		<input type="button" value="코스삭제" class="deleteCourseBtn" onclick="deleteCourse();">';
				listStr += '	</span>';
				listStr += '</div>';
				listStr += '</form>';
						
				$('#courseLayoutLeft').append(listStr);
			},
			error: function(){
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
		
	});

	//선택삭제 버튼 클릭시
	$(document).on('click', '#deleteCourseBtn', function(){
		var resultCon = confirm('선택한 장소들을 삭제 하시겠습니까?');
		
		if(resultCon){
			var memberId = $('#memberId').val();
			
			var placeNameArr=[];
			
			var placeNameL = $('.checkbox:checked').length;
			
			for(var i =0;i<placeNameL;i++){
				placeNameArr[i] =  $('.checkbox:checked').eq(i).parent().children().eq(1).val();
			}
			
			if(placeNameL == 1){
				$('.checkbox:checked').eq(0).parent().parent().parent().remove();
			}
			else{
				
				for(var i=0;i<placeNameL;i++){
					
					$('.checkbox:checked').eq(i).parent().parent().parent().remove();
					i--
					if($('.checkbox:checked').eq(i).parent().children().eq(1).val()==''||$('.checkbox:checked').eq(i).parent().children().eq(1).val()==null){
						
						i=placeNameL;
					}
				}
				
			}
			
			$.ajax({
				url: '/course/deleteCheckCourseAjax', //요청경로
				type: 'post',
				data:{'memberId':memberId,
					  'placeNameArr':placeNameArr}, //필요한 데이터
				success: function(result) {
					//ajax 실행 성공 후 실행할 코드 작성
					alert('삭제성공')
					
					
				},
				error: function(){
					//ajax 실행 실패 시 실행되는 구간
					alert('실패');
				}
			});
		}//컨펌 if 문 end
		else{
			alert('잘못된 요청입니다.')
		}
	});
	
});

//함수 선언 영역
(function($){
	deleteCourse = function(){
		var courseCode = $('input[name=courseCode]:checked').val();
		var courseName = $('label[for="' + courseCode + '"]').text();
		var memberId = $('#memberId').val();
		var regCourseCodeArr =[]; 
		var regCourseCodeLen = $('.regCourseCode').length; 
		
		for(var i = 0; i < regCourseCodeLen; i++){
			regCourseCodeArr[i] = $('.regCourseCode').eq(i).val();
			console.log(regCourseCodeArr[i]);
		}
		
		for(var i = 0; i < regCourseCodeLen; i++){
			if(regCourseCodeArr[i] == courseCode){
				var delResult = confirm('후기가 존재하는 코스입니다.\n그래도 삭제하시겠습니까?')
				
				if(delResult){
					location.href = '/course/deleteCourse?courseCode=' + courseCode + '&memberId=' + memberId;
				}
				return;
			}
		}	
		
		var result = confirm(courseName + ' 코스를 삭제 하시겠습니까?');
		
		if(result){
			location.href = '/course/deleteCourse?courseCode=' + courseCode + '&memberId=' + memberId;
			return;
		}
		
		
	};
	//라디오박스 아무것도 체크안하고 코스추천누르면 .
	checkCourseCode = function(){
		var courseCode = $('input[name=courseCode]:checked').val();
		if(courseCode == null){
			alert('코스를 선택 해주세요!');
			return false;
		}
		else{
			return true;
		}
	};

})(jQuery);
