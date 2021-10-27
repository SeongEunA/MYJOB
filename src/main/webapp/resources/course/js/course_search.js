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
	      var placeName = $(this).text();
	      var placeAddr = $(this).next().text();
	      var placeTel = $(this).next().next().text();
	      
	      placeStr = '';
	      
	      placeStr = '<div class="resInfoDiv">' +
	              '   <div class="resultPlaceName" style="font-size:18px;">' + placeName + '<input type="button" value="X" id="deleteResBtn"></div>';
	      placeStr += '   <div class="resultPlaceAddr">' + placeAddr + '</div>';
	      placeStr += '   <input type="hidden" id="cateCode" class="cateCode" value="CATE_003">';
	      if(placeTel!=null ||placeTel!=''){
	    	  placeStr += '   <div class="resultTel" class="resultPlaceTel">' + placeTel + '</div>' +
	                 '</div>';
	      }

	      $('#resInfoList').append(placeStr);
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
	      var cateCode =  $(this).parent().children().eq(4).val();
	      var placeTel =  $(this).parent().children().eq(5).text();
	      
	      var placeStr = '';
	      placeStr = '<div class="resInfoDiv">' +
	              '   <div class="resultPlaceName" style="font-size:18px;">' + placeName + '<input type="button" value="X" id="deleteResBtn"></div>';
	      placeStr += '   <div class="resultPlaceAddr">' + placeAddr + '</div>';
	      placeStr +='<input type="hidden" class="cateCode" value='+cateCode+'>';
	     
	      if(placeTel!=null ||placeTel!=''){
	      placeStr += '   <div class="resultTel" class="resultPlaceTel">' + placeTel + '</div>'
	      }
	     
	      placeStr += '</div>';
	      	
	      $('#resInfoList').append(placeStr);
	      document.getElementById('submitCourse').style="visibility:visible";
	   });
	
		//코스등록버튼을 눌렀을 때 동일한 코스네임이 있는지 검사 후 코스등록
		$(document).on('click', '#regCourseBtn', function() { 
			 var courseName = $('#courseName').val();
			 var memberId = $('#memberId').val();
			alert(memberId);
			$.ajax({
	            url: '/course/checkCourseNameAjax', //요청경로
	            type: 'post',
	            data:{'courseName':courseName,
	            	  'memberId':memberId,
	            	  }, //필요한 데이터
	           
	            success: function(result) {
	            	if(result==null || result==''){
	            		alert('코스를 등록합니다!');
	            	 
	            	 var placeName = [];
	            	 var placeAddr = [];
	            	 var cateCode = [];
	            	 
	            	 var placeNameL = $('.resultPlaceName').length;
	            	 var placeAddrL = $('.resultPlaceAddr').length;
	            	 var cateCodeL = $('.cateCode').length;
	            	 
	            	 for(var i = 0; i < placeNameL; i++){
	            		 placeName[i] = $('.resultPlaceName').eq(i).text();
	            	 }
	            	 
	            	 for(var i = 0; i < placeAddrL; i++){
	            		 placeAddr[i] = $('.resultPlaceAddr').eq(i).text();
	            	 }
	            	 
	            	 for(var i = 0; i < cateCodeL; i++){
	            		 cateCode[i] = $('.cateCode').eq(i).val();
	            	 }
	            		
	            	 
	          	      //코스코드를 등록한 뒤 코스코드를 조회, 코스를 추가하는 ajax
	            		$.ajax({
	                        url: '/course/insertCourseCodeAjax', //요청경로
	                        type: 'post',
	                        data:{'courseName':courseName,
	      	            	  	  'memberId':memberId,
	      	            	  	  'placeNameArr':placeName,
	      	            	  	  'placeAddrArr':placeAddr,
	      	            	  	  'cateCodeArr':cateCode} //필요한 데이터
	                        ,success: function(result) {
	                     
	                        	var str='';
	                        	if(result==1){
	                        		alert('코스가 등록되었습니다!');
	                        		$('#resInfoList').empty();
	                        		document.getElementById('submitCourse').style="visibility:hidden";
	                        		document.getElementById('courseName').value="";
	                        	}
	                       
	                        },
	                        error: function(){
	                         //ajax 실행 실패 시 실행되는 구간
	                           alert('실패');
	                        }
	            		});
	            		
	            		}
	            	else{
	            		alert('코스 이름이 중복입니다!');
	            	}
	              
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
	//검색버튼 클릭시
	clickSearch = function(nowPage){
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
            		'locationName':locationName,
            		'nowPage':nowPage}, //필요한 데이터
            success: function(result) {
               //ajax 실행 성공 후 실행할 코드 작성
               $('#placeList').empty(); //하위태그만 삭제
               var totalPage = (Math.ceil(result.pageVO.totalCnt / result.pageVO.displayCnt));
               var str='';
               
               $(result.selectPlaceList).each(function(index,element){
                   
               	str += '<div class="placeInfo">'
               	str += '	<input type="hidden" value="' + element.x + '" name="x" class="placeX">';
               	str += '	<input type="hidden" value="' + element.y + '" name="y" class="placey">';
               		
               	str += '	<div class="placeName">' + element.placeName + '</div>';
               	str += '	<div class="placeAddr" data-placeAddr="' + element.placeAddr + '">주소 : ' + element.placeAddr + '</div>';
               	str +='<input type="hidden" id="cateCode" value="'+element.cateCode+'">';
               	
	               	if(element.placeTel != null){
	               		str += '	<div class="placeTel">연락처 : ' + element.placeTel + '</div>';
	               	}
               	str +='<input type="button" value="담기" id="saveCourseInfo">';
               	str += '</div>';
                });
                 
                
                str += '<div class="row">';
   	          	str += '	<div class="col text-center">';
   	          	str += '		<nav aria-label="...">';
   	          	str += '			<ul class="pagination justify-content-center">';
   	          	str += '				<li class="page-item">';
   	          	str += '					<a class="page-link" onclick="clickSearch(' + (totalPage-(totalPage-1)) + ')">&lt;&lt;</a>';
   	          	str += '				</li>';
   	          	str += '				<li class="page-item';
   	          							if(result.pageVO.prev == false){
   	          								str += ' disabled';
   	          							};
   	          	str += '">';
   	          	str += '					<a class="page-link" onclick="clickSearch(' + (result.pageVO.beginPage - 1) +')">이전</a>';
   	          	str += '				</li>';
   	          			    for(var i = result.pageVO.beginPage; i <= result.pageVO.endPage; i++){
   	          			    	str += '<li class="page-item';
   	          			    	
   	          			    	if(result.pageVO.nowPage == i){
   	          			    		str += ' active';
   	          			    	}
   	          			    	str += '" aria-current="page">';
   	          			    	str += '	<a class="page-link" onclick="clickSearch(' + i + ')">' + i + '</a>';
   	          			    	str += '</li>'
   	          			    	
   	          			    };
   	          	str += '				<li class="page-item';
   	          							if(result.pageVO.next == false){
   	          								str += ' disabled';
   	          							};
   	          	str += '">';					
   	          	str += '					<a class="page-link" onclick="clickSearch(' + (result.pageVO.endPage + 1) +')">다음</a>';
   	          	str += '				</li>';
   	          	str += '				<li class="page-item">';
   	          	str += '					<a class="page-link" onclick="clickSearch(' + totalPage + ')">&gt;&gt;</a>';
   	          	str += '				</li>';
   	          	str += '			</ul>';
   	          	str += '		</nav>';
   	          	str += '	</div>';
   	          	str += '</div>';
               
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