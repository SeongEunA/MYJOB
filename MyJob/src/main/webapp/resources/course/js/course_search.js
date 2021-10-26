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
		
		$('#keyword').val(placeAddr + ' 주변 맛집');
		
		$('#keywordForm').submit();
		
		
    });
	
	//지도에서 목록에 있는 장소명 클릭
	   $(document).on('click', '#resName', function() { 
	      var resName = $(this).text();
	      var resAddr = $(this).next().text();
	      var resTel = $(this).next().next().text();

	      resStr = '';
	      
	      resStr = '<div class="resInfoDiv">' +
	              '   <div name="resultResName" style="font-size:18px;">' + resName + '<input type="button" value="X" id="deleteResBtn"></div>';
	      resStr += '   <div name="resultResAddr">' + resAddr + '</div>';
	      resStr += '   <div class="resultTel" name="resultResTel">' + resTel + '</div>' +
	                 '</div>';
	      

	      $('#resInfoList').append(resStr);
	      document.getElementById('submitCourse').style="visibility:visible";
	   });
	   
	   //선택한 식당 목록에서 삭제
	   $(document).on('click', '#deleteResBtn', function(){
	    
		   $(this).parent().parent().remove();
	     if($('.resInfoDiv').length==0){
	    	 document.getElementById('submitCourse').style="visibility:hidden";
	     }
	   });
	   
	   
	   
	 //placeList에서 담기버튼을 눌렀을 때
	   $(document).on('click', '#saveCourseInfo', function(){
	      var placeName = $(this).parent().children().eq(2).text();
	      var placeAddr =  $(this).parent().children().eq(3).text();
	      var placeTel =  $(this).parent().children().eq(4).text();
	      var placeStr = '';
	      
	      placeStr = '<div class="resInfoDiv">' +
	              '   <div name="resultPlaceName" style="font-size:18px;">' + placeName + '<input type="button" value="X" id="deleteResBtn"></div>';
	      placeStr += '   <div name="resultPlaceAddr">' + placeAddr + '</div>';
	      if(placeTel!=null ||placeTel!=''){
	      placeStr += '   <div class="resultTel" name="resultPlaceTel">' + placeTel + '</div>'
	      }
	      placeStr +='<input type="hidden" name="placeName" value='+placeName+'>';
	      placeStr +='<input type="hidden" name="placeAddr" value='+placeAddr+'>';
	      placeStr +='<input type="hidden" name="placeTel" value='+placeTel+'>';
	     
	      
	      placeStr += '</div>';
	      	
	      $('#resInfoList').append(placeStr);
	      document.getElementById('submitCourse').style="visibility:visible";
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
		
		if(locationName == '정읍' && locationLandCode == '11F10000'){
			locationName = '정읍시'
		}

		if(locationName == '남원' && locationLandCode == '11F10000'){
			locationName = '남원시'
		}
		if(locationName == '대구' && locationLandCode == '11H10000'){
			locationName = '대구광역시'
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
            	str += '	<input type="hidden" value="' + element.x + '" name="x" class="placeX">';
            	str += '	<input type="hidden" value="' + element.y + '" name="y" class="placey">';
            		
            	str += '	<div class="placeName">' + element.placeName + '</div>';
            	str += '	<div class="placeAddr" data-placeAddr="' + element.placeAddr + '">주소 : ' + element.placeAddr + '</div>';
            	
            	if(element.placeTel != null){
            		str += '	<div class="placeTel">연락처 : ' + element.placeTel + '</div>';
            	}
            	
            	str +='<input type="button" value="담기" id="saveCourseInfo">';
            	str += '</div>';
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
               $('#weatherArea').empty(); //하위태그만 삭제
              var str = ""; 
              
           	  str +='<div class="weatherBox" id="weatherBox">';
           	  str +='<div class="weatherDiv">';
           		$(result).each(function(index,element){
           		
 str +='      			<div class="weatherDay">';
 str +='  				<div class="weatherDayHeader">';
 str +='  					<div class="weatherDayNum">';
 str +='  						<div>'+element.date+'</div>';
 str +='  					</div>	';
 str +='  				</div>';
				
	 					if((index+1)<4){
 str +='  				<div class="weatherContent">';
 str +='  					<div class="weatherSkyStatus2">';
 str +='  						<div class="weatherSkyStatusImg2">';
 						if(element.skyStatus=='맑음'){
 str +='  								<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt1.svg" width="80%" height="100%">';
 						}
						else if(element.skyStatus=='구름많음'||element.skyStatus=='흐림'){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt5.svg" width="80%" height="100%">';
 						}	
	 					else if(element.skyStatus=='흐리고 비'||element.skyStatus=='비'){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">';
	 					}		
 str +='  						</div>';
 str +='  						<div class="weatherSkyStatusText2">';
 str +=									element.skyStatus
 str +='  						</div>';
 str +='  					</div>';
 str +='  					<div class="weatherTemp">';
 str +=   							element.temp +'&deg;';
 str +='  					</div>';
 str +='  				</div>';
 				
	 					}
	 					else if((index+1)>=4){
 str +='  				<div class="weatherContent">';
 str +='  					<div class="weatherSkyStatus2">';
 str +='  						<div class="weatherSkyStatusImg2">';
 								if(element.skyStatusAm == '맑음'){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt1.svg" width="80%" height="100%">';
 								}
 								else if(element.skyStatusAm == '구름많음'||element.skyStatusAm=='흐림'){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt5.svg" width="80%" height="100%">';
 								}
 								else if(element.skyStatusAm == '흐리고 비'||element.skyStatusAm == '비'){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">';
 								}
 str +='  						</div>';
 str +='  						<div class="weatherSkyStatusText2">';
 str += 								element.skyStatusAm
 str +='  						</div>	';				
 str +='  					</div>';
 str +='  					<div class="weatherSkyStatus2">';
 str +='  						<div class="weatherSkyStatusImg2">';
 								if(element.skyStatusPm == '맑음'){
 str +='  								<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt1.svg" width="80%" height="100%">';
 								}
 								else if(element.skyStatusPm == '구름많음'||element.skyStatusPm == '흐림'){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt7.svg" width="80%" height="100%">';
 								}
 								else if(element.skyStatusPm == '흐리고 비'||element.skyStatusPm == '비'){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">';
 								}
 str +='  						</div>';
 str +='  						<div class="weatherSkyStatusText2">';
 str += 								element.skyStatusPm
 str +='  						</div>';
 str +='  					</div>';
 str +='  					<div class="weatherTemp">';
 str +='  						<span>'+element.minTemp+'&deg;</span>/'+element.maxTemp+'&deg;';
 str +='  					</div>';
 str +='  				</div>';
				
	 					}
 str +='  			</div>';
     			
           		})
      
 str +='      		</div><!-- weatherDiv1 -->';
     		
     	
 str +='      	</div>';
 
 
 str +='      </div><!--weatherContainer-->';
               
               
            
               
               
               $('#weatherArea').prepend(str);
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
		});
	};


	

	
	
	
})(jQuery);