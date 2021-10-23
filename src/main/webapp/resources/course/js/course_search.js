//화면 로딩 후 바로 실행
$(document).ready(function(){

	//상위 지역 셀렉트 박스의 값이 변경 되면..
	$(document).on('change', '#highLocation', function() { 
		var locationLandCode = $('#highLocation').val();
		$.ajax({
            url: '/course/lowLocationListAjax', //요청경로
            type: 'post',
            data:{'locationLandCode':locationLandCode}, //필요한 데이터
            success: function(result) {
               
               //ajax 실행 성공 후 실행할 코드 작성
               $('#lowLocation').empty(); //하위태그만 삭제
              
               var str='';
                
              $(result).each(function(index,element){
                
             	str += '<option value="' + element.locationTempCode + '" class="lowLocation">';
             	str += element.lowLocationName;
             	str += '</option>';
           
              });
                
               
               $('#lowLocation').prepend(str);
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
		});
    });
	
	//장소 리스트에서 장소명 클릭시
	$(document).on('click', '.placeName', function() { 
		var placeAddr = $(this).next().attr('data-placeAddr');
		
//		var bigCity = placeAddr.substring(0,9);
//		var smallCity = placeAddr.substring(0,8);
		
		$('#keyword').val(placeAddr + ' 주변 맛집');
		
		$('#keywordForm').submit();
		
		/*$.ajax({
            url: '/course/lowLocationListAjax', //요청경로
            type: 'post',
            data:{'locationLandCode':locationLandCode}, //필요한 데이터
            success: function(result) {
               
               //ajax 실행 성공 후 실행할 코드 작성
               $('').empty(); //하위태그만 삭제
              
               var str='';
                
              $(result).each(function(index,element){
                
           
              });
                
               
               $('').prepend(str);
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
		});*/
    });
	
       
});	


//함수 선언 영역
(function($){
	//검색버튼 클릭시
	clickSearch = function(){
		var cateCode = $('#cateCode').val();
		var locationName = $('#lowLocation option:selected').text();
		var locationLandCode = $('#highLocation option:selected').val();
		var locationTempCode = $('#lowLocation option:selected').val();
		
		if(locationName == '광주' && locationLandCode == '11B00000'){
			locationName = '경기도 광주'
		}
		
		if(locationName == '광주' && locationLandCode == '11F20000'){
			locationName = '광주광역시'
		}
		
		if(locationName == '성남' && locationLandCode == '11B00000'){
			locationName = '경기도 성남'
		}
		
		if(locationName == '수원' && locationLandCode == '11B00000'){
			locationName = '경기도 수원'
		}
		
		//장소리스트 ajax 보내기
		$.ajax({
            url: '/course/searchPlaceAjax', //요청경로
            type: 'post',
            data:{'cateCode':cateCode,
            		'locationName':locationName}, //필요한 데이터
            success: function(result) {
               //ajax 실행 성공 후 실행할 코드 작성
               $('#placeList').empty(); //하위태그만 삭제
               
               var str='';
               
              $(result).each(function(index,element){
              
            	str += '<div class="placeInfo">'
            		
            	str += '	<div class="placeName">' + element.placeName + '</div>';
            	str += '	<div class="placeAddr" data-placeAddr="' + element.placeAddr + '">주소 : ' + element.placeAddr + '</div>';
            	
            	if(element.placeTel != null){
            		str += '	<div class="placeTel">연락처 : ' + element.placeTel + '</div>';
            	}
            	
            	str += '	<input type="hidden" value="' + element.x + '" name="x" class="placeX">';
            	str += '	<input type="hidden" value="' + element.y + '" name="y" class="placey">';
            	
            	str += '</div>'
              });
               
               $('#placeList').prepend(str);
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
		});
		
		//날씨 조회를 위한 ajax
		$.ajax({
            url: '/course/weatherLoadAjax', //요청경로
            type: 'post',
            data:{'locationLandCode':locationLandCode,
            		'locationTempCode':locationTempCode}, //필요한 데이터
            success: function(result) {
            	
               //ajax 실행 성공 후 실행할 코드 작성
               $('#weather').empty(); //하위태그만 삭제
               
               var str='';
               
                   str += '<table border="1">';
              $(result.weatherShortList).each(function(index,element){
            	  
	  				str += '<tr style="border: 1px solid red;">';
	  				str += '<td style="border: 1px solid black;">' + (index+1) + '</td>'
	  				str += '<td>' + element.skyStatus + '</td>'
	  				str += '</tr>'
              });
              
              $(result.weatherLongList).each(function(index,element){
            	  
            	  str += '<tr style="border: 1px solid red;">';
            	  str += '<td style="border: 1px solid black;">' + (index+1) + '</td>'
            	  str += '<td>' + element.minTemp + '</td>'
            	  str += '</tr>'
              });
              
              $(result.weatherLongSkyStatusList).each(function(index,element){
            	  
            	  str += '<tr style="border: 1px solid red;">';
            	  str += '<td style="border: 1px solid black;">' + (index+1) + '</td>'
            	  str += '<td>' + element.skyStatusAm + '</td>'
            	  str += '</tr>'
              });
              	  str += '</table>';
               
               $('#weather').prepend(str);
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
		});
	};

		
	

	
	
	
})(jQuery);