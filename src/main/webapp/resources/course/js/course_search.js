	var arrXY = [];//숙박지X,Y
	var arrXY2 = [];//관광지X,Y
	var positions = [];//숙박지 배열
	var positions2 = []; //관광지 배열
	var marker2;
	var marker3;
	var merkerNow;
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
            	alert('실패');
            }
		});
	});
	
	//장소 리스트에서 '맛집보기' 클릭시
	$(document).on('click', '#showResInfo', function() { 
		var placeAddr = $(this).parent().prev().val();
		var x = $(this).parent().parent().children().eq(0).val();
		var y = $(this).parent().parent().children().eq(1).val();
		$('#keyword').val(placeAddr + ' 주변 맛집');
		
		$('#keywordForm').submit();
		
		//스크롤이동
		scrollToMap();
		
		showResInfo(x,y);
	});
	
	//지도에서 목록에 있는 장소명 클릭 맛집임!!
	$(document).on('click', '#info', function() {
		var placeX = $(this).children().eq(0).val();
		var placeY = $(this).children().eq(1).val();
		var placeName = $(this).children().eq(2).text();
		var placeAddr = $(this).children().eq(3).text();
		var placeTel = $(this).children().eq(4).text();
		
		scrollToSaveCourse();
			
		var placeStr = '';
		
		placeStr +='	   <div class="ticketContainer">';
		placeStr +='		<div class="ticketMainLayout">';
		placeStr +='			<div class="ticketLayout1">';
		placeStr +='				<div class="ticketDiv">';
		placeStr +='					<div class="ticketBlock2">';
		placeStr +='						<div class="resultPlaceName">'+placeName+'<div class="close close1" id="deleteResBtn"></div>';
		placeStr +='						</div>';
		placeStr +='						<div class="resultPlaceAddr">'+placeAddr+'</div>';
		placeStr +='						<input type="hidden" class="cateCode" value="CATE_003">';
		placeStr += '	<input type="hidden" value="'+placeX+'" class="resultX">';	
		placeStr += '	<input type="hidden" value="'+placeY+'" class="resultY">';
								if(placeTel!=null||placeTel!=''){
								
		placeStr +='						<div class="resultTel" class="resultPlaceTel">'+placeTel+'</div>';
							
							}
		placeStr +='						<div class="travelTicket">Travel Ticket</div>';
		placeStr +='					</div>';
		placeStr +='				</div>';
		placeStr +='			</div>';
		placeStr +='		<div class="ticketLayout2">';
		placeStr +='	      	<span>맛집</span>';
		placeStr +='	    <div class="ticketMark">';
		placeStr +='	      		<img src="/resources/images/forRes.png"width="100%" height="100%">';
		placeStr +='	      	</div>';
		placeStr +='	   <section class="custom-kontakt">';
		placeStr +='	       <div class="barcode-box">';
		placeStr +='	       		<div class="barcode-stripes"><span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-3"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-1"></span> <span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-1"></span><span class="stripe-1"></span><span class="sig5"></span> <span class="sig6"></span> <span class="sig7"></span></div>';
		placeStr +='	       </div>';
		placeStr +='	     </section>';
		placeStr +='	     	</div>';
		placeStr +='	     	</div>';
		placeStr +='	</div>';

		$('.resInfoList').append(placeStr);
		document.getElementById('submitCourse').style="visibility:visible";
	});
   
	//선택한 장소 목록에서 삭제
	$(document).on('click', '#deleteResBtn', function(){
	   $(this).parent().parent().parent().parent().parent().parent().remove();

	   if($('.ticketContainer').length==0){
		   document.getElementById('submitCourse').style="visibility:hidden";
	   }
   });

	
	//placeList에서 담기버튼을 눌렀을 때
	$(document).on('click', '#saveCourseInfo', function(){
		var x =$(this).parent().parent().children().eq(0).val();
		var y =$(this).parent().parent().children().eq(1).val();
		var placeName = $(this).parent().parent().children().eq(2).text();
		var placeAddr =  $(this).parent().parent().children().eq(3).attr('data-placeAddr');
		var cateCode =  $(this).parent().parent().children().eq(4).val();
		var placeTel =  $(this).parent().parent().children().eq(5).text();
		//course_search.jsp에서 담기버튼 누를때
		//div 디자인	   

		//스크롤이동
		scrollToSaveCourse();
		
		var placeStr = '';
	   
		placeStr +='<div class="ticketContainer">';
		placeStr +='	<div class="ticketMainLayout">';
		placeStr +='		<div class="ticketLayout1">';
		placeStr +='			<div class="ticketDiv">';
		
		if(cateCode=='CATE_001'){
			placeStr +='				<div class="ticketBlock3">';
		}
		else if(cateCode=='CATE_002'){
			placeStr +='				<div class="ticketBlock">';
		}
		
		placeStr +='						<input type="hidden" class="resultX" value="'+x+'">';
		placeStr +='						<input type="hidden" class="resultY" value="'+y+'">';
		placeStr +='						<div class="resultPlaceName">'+placeName+'<div class="close close1" id="deleteResBtn"></div>';
		placeStr +='					</div>';
		placeStr +='					<div class="resultPlaceAddr">'+placeAddr+'</div>';
		placeStr +='					<input type="hidden" class="cateCode" value="'+cateCode+'">';
		
		if(placeTel!=null||placeTel!=''){
			placeStr +='					<div class="resultTel" class="resultPlaceTel">'+placeTel+'</div>';
		}
		
		placeStr +='						<div class="travelTicket">Travel Ticket</div>';
		placeStr +='					</div>';
		placeStr +='				</div>';
		placeStr +='			</div>';
		placeStr +='		<div class="ticketLayout2">';
		
		if(cateCode=='CATE_001'){
			placeStr +='	      	<span>숙박지</span>';
		}
		else if(cateCode=='CATE_002'){
			placeStr +='	      	<span>관광지</span>';
		}
		
		placeStr +='			<div class="ticketMark">';
		if(cateCode=='CATE_002'){
		placeStr +='				<img src="/resources/images/free-icon-aeroplane-5639813.png"width="100%" height="100%">';
		}
		else if(cateCode=='CATE_001'){
			placeStr +='				<img src="/resources/images/forhouse.png"width="100%" height="100%">';
		}
		placeStr +='			</div>';
		placeStr +='			<section class="custom-kontakt">';
		placeStr +='				<div class="barcode-box">';
		placeStr +='					<div class="barcode-stripes"><span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-3"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-1"></span> <span class="stripe-1"></span><span class="stripe-2"></span><span class="stripe-1"></span><span class="stripe-1"></span><span class="stripe-1"></span><span class="sig5"></span> <span class="sig6"></span> <span class="sig7"></span></div>';
		placeStr +='				</div>';
		placeStr +='			</section>';
		placeStr +='		</div>';
		placeStr +='	</div>';
		placeStr +='</div>';
	  
	   	
		$('#resInfoList').append(placeStr);
		document.getElementById('submitCourse').style="visibility:visible";
	   
	});


	//코스등록버튼을 눌렀을 때 동일한 코스네임이 있는지 검사 후 코스등록
	$(document).on('click', '#regCourseBtn', function() { 
		var memberId = $('#memberId').val();

		if(memberId == null || memberId == ''){
			alert('로그인이 필요한 서비스입니다.\n로그인 후 이용해주세요.');
			location.href = '/member/login';
			return;
		}
		
		var realReg = confirm('등록하시겠습니까?')

		if(realReg){
			var courseName = $('#courseName').val();
			 
			$.ajax({
				url: '/course/checkCourseNameAjax', //요청경로
				type: 'post',
				data:{'courseName':courseName,
						'memberId':memberId
				}, //필요한 데이터
				success: function(result) {
					//result 코스네임 중복없으면 null or 빈값
					if(result==null || result==''){
	            		
						var placeName = [];
						var placeAddr = [];
						var cateCode = [];
						
						var placeX = [];
						var placeY = [];
						
						var placeNameL = $('.resultPlaceName').length;
						var placeAddrL = $('.resultPlaceAddr').length;
						var cateCodeL = $('.cateCode').length;
						
						var placeXLen = $('.resultX').length;
						var placeYLen = $('.resultY').length;
						
						console.log('배열길이');
						console.log(placeXLen);
						console.log(placeYLen);
						
						
						for(var i = 0; i < placeNameL; i++){
							placeName[i] = $('.resultPlaceName').eq(i).text();
						}
						
						for(var i = 0; i < placeAddrL; i++){
							placeAddr[i] = $('.resultPlaceAddr').eq(i).text();
						}
						
						for(var i = 0; i < cateCodeL; i++){
							cateCode[i] = $('.cateCode').eq(i).val();
						}
						
						//숙박지가 2개이상 cateCode 배열에 안담기도록...
						var houseCnt = 0;
						for(var i = 0; i < cateCodeL; i++){
							
							if(cateCode[i] == 'CATE_001'){
								houseCnt++;
							}
							if(houseCnt >= 2){
								alert('숙박지는 코스당 한 곳의 장소만 담아주세요!');
								return;
							}
						}
						
						for(var i = 0; i < placeXLen; i++){
							placeX[i] = $('.resultX').eq(i).val();
							console.log(i+'번째 코스등록 버튼 클릭시 x : '+$('.resultX').eq(i).val());
						}
						
						for(var i = 0; i < placeXLen; i++){
							placeY[i] = $('.resultY').eq(i).val();
							console.log(i+'번째 코스등록 버튼 클릭시 y : '+$('.resultY').eq(i).val());
						}
						
						//코스코드를 등록한 뒤 코스코드를 조회, 코스를 추가하는 ajax
						$.ajax({
							url: '/course/insertCourseCodeAjax', //요청경로
							type: 'post',
							data:{'courseName':courseName,
									'memberId':memberId,
									'placeNameArr':placeName,
									'placeAddrArr':placeAddr,
									'cateCodeArr':cateCode,
									'placeXArr':placeX,
									'placeYArr':placeY
							}, //필요한 데이터
							success: function(result) {
								alert('코스가 등록되었습니다!');
								var str='';
								if(result==1){
									$('#resInfoList').empty();
									document.getElementById('submitCourse').style="visibility:hidden";
									document.getElementById('courseName').value="";
								}
	                        },
	                        error: function(){
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
				
			});//코스중복 ajax 검사 end
			
		}//'등록하시겠습니까? if문 end'
		
	});//코스등록버튼 클릭시 end
	
	
});	


//함수 선언 영역
(function($){
	//검색버튼 클릭시
	clickSearch = function(nowPage){
		
		var cateCode = $('#cateCode').val();
		var locationName = $('#lowLocation option:selected').text();
		var locationLandCode = $('#highLocation option:selected').val();
		var locationTempCode = $('#lowLocation option:selected').val();
		
		
		if(locationLandCode=='지역'){
			locationLandCode='11B00000';
			locationTempCode='11B10101';
			alert('지역을 선택해주세요!');
			return
		}
		
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
		
		//검색키워드 '지역+맛집'으로 변경
		$('#keyword').val(locationName+'맛집');
	      
	    $('#keywordForm').submit();
	    
	    //스크롤이동
	    scrollToWeather();
		
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
               $('#pageBtnLayout').empty(); //하위태그만 삭제
               var totalPage = (Math.ceil(result.pageVO.totalCnt / result.pageVO.displayCnt));
               var str='';
               
            
               //10.29은아 시작
               function myPosition(x,y,placeName){
            	   
            	   this.x=x;
            	   this.y=y;
            	   this.placeName=placeName;
               } //좌표받는 생성자 함수
               
               arrXY=[];
               arrXY2=[];
               for(var cnt =0; cnt<result.selectPlaceList.length;cnt++){
            	   if(cateCode=='CATE_001'){//숙박
            	   myXY = new myPosition(result.selectPlaceList[cnt].x,result.selectPlaceList[cnt].y,result.selectPlaceList[cnt].placeName);
            	   arrXY.push(myXY);
            	   }
            	  
            	   else if(cateCode=='CATE_002'){//관광
            		   myXY2 = new myPosition(result.selectPlaceList[cnt].x,result.selectPlaceList[cnt].y,result.selectPlaceList[cnt].placeName);
            		   arrXY2.push(myXY2);
            	   
            	   }
            	   
               }
               if(cateCode=='CATE_001'){
            	   
            	   showHouseInfo();
               }
               if(cateCode=='CATE_002'){
            	   showPlaceInfo();
               }
               
     		  
               $(result.selectPlaceList).each(function(index,element){
                str += '<div class="placeLayout">';	
               	str += '	<input type="hidden" value="' + element.x + '" name="x" class="kakaoPlaceX">';
               	str += '	<input type="hidden" value="' + element.y + '" name="y" class="kakaoPlaceY">';
               	
               	
               	str += '	<div class="placeName"><span>' + element.placeName + '</span></div>';
               	str += '	<div class="placeAddr" data-placeAddr="' + element.placeAddr + '"><span>주소 : ' + element.placeAddr + '</span></div>';
               	str += '	<input type="hidden" id="cateCode" value="'+element.cateCode+'">';
               	
	            if(element.placeTel != null){
	               		str += '	<div class="placeTel"><span>연락처 : ' + element.placeTel + '</span></div>';
	               	}
	            str += '	<div></div>';
	            str += '	<input type="hidden" value="'+element.placeAddr+'" name="placeAddr">';
	            str += '	<ul>';
               	str += '		<li id="saveCourseInfo">담기</li>';
               	str += '		<li id="showResInfo">맛집보기</li>';
               	str += '	</ul>';
               	str += '</div>';
               	
                });
                 
                var pageStr = ''; 
               
                pageStr += '<div class="row pageBtn">';
                pageStr += '	<div class="col">';
                pageStr += '			<ul>';
                pageStr += '				<li class="btnFrist">';
                pageStr += '					<a onclick="clickSearch(' + (totalPage-(totalPage-1)) + ')">&lt;&lt;</a>';
                pageStr += '				</li>';
                pageStr += '				<li class="btnPrev';
   	          							if(result.pageVO.prev == false){
   	          								pageStr += ' disabled';
   	          							};
   	          	pageStr += '">';
   	          	pageStr += '					<a onclick="clickSearch(' + (result.pageVO.beginPage - 1) +')">&lt;</a>';
   	          	pageStr += '				</li>';
   	          			    for(var i = result.pageVO.beginPage; i <= result.pageVO.endPage; i++){
   	          			    	pageStr += '<li class="';
   	          			    	
   	          			    	if(result.pageVO.nowPage == i){
   	          			    		pageStr += 'activePage';
   	          			    	}
   	          			    	
   	          			    	pageStr += '">';
   	          			    	pageStr += '	<a  onclick="clickSearch(' + i + ')">' + i + '</a>';
   	          			    	pageStr += '</li>'
   	          			    	
   	          			    };
   	          	pageStr += '				<li class="btnNext';
   	          							if(result.pageVO.next == false){
   	          								pageStr += ' disabled';
   	          							};
   	          	pageStr += '">';					
   	          	pageStr += '					<a onclick="clickSearch(' + (result.pageVO.endPage + 1) +')">&gt;</a>';
   	          	pageStr += '				</li>';
   	          	pageStr += '				<li class="btnLast">';
   	          	pageStr += '					<a onclick="clickSearch(' + totalPage + ')">&gt;&gt;</a>';
   	          	pageStr += '				</li>';
   	          	pageStr += '			</ul>';
   	          	pageStr += '	</div>';
   	          	pageStr += '</div>';
               
               $('#placeList').prepend(str);
               $('#pageBtnLayout').prepend(pageStr);
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
           		$(result).each(function(index,element){
           		if(index+1<=10){
           			
           		
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
 str +='  								<span><img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt1.svg" width="80%" height="100%"></span>';
 						}
						else if(element.skyStatus=='구름많음'||element.skyStatus=='흐림'){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt5.svg" width="80%" height="100%">';
 						}	
	 					else if(element.skyStatus.includes('비')){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">';
	 					}	
	 					else if(element.skyStatus.includes('눈')){
 str +='	 						<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt13.svg" width="80%" height="100%">';
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
	 					else if((index+1)>=4&&(index+1)<=10){
 str +='  				<div class="weatherContent">';
 str +='  					<div class="weatherSkyStatus2">';
 str +='  						<div class="weatherSkyStatusImg2">';
 								if(element.skyStatusAm == '맑음'){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt1.svg" width="80%" height="100%">';
 								}
 								else if(element.skyStatusAm == '구름많음'||element.skyStatusAm=='흐림'){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt5.svg" width="80%" height="100%">';
 								}
 								else if(element.skyStatusAm.includes('비')){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">';
 								}
 								else if(element.skyStatusAm.includes('눈')){
 str +='	 						<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt13.svg" width="80%" height="100%">';
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
 								else if(element.skyStatusPm.includes('비')){
 str +='  							<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt8.svg" width="80%" height="100%">';
 								}
 								else if(element.skyStatusPm.includes('눈')){
 str +='	 						<img src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/weather_new_new/img/weather_svg/icon_flat_wt13.svg" width="80%" height="100%">';
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
     			
           		}//날짜10일만뽑는 조건 
           		})//result 끝나는부분
      
     	
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

	//--------스크롤 이동 이벤트 모음--------//
	//지도가 위치한 곳 으로 스크롤 이동
	scrollToMap = function(){
		//스크롤이동
	    var offset = $('#map_warp').offset(); //선택한 태그의 위치를 반환
		
		//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
		$('html').animate({scrollTop : offset.top}, 100);
	};

	scrollToWeather = function(){
		//스크롤이동
		var offset = $('#weatherHowToContainer').offset(); //선택한 태그의 위치를 반환
		
		//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
		$('html').animate({scrollTop : offset.top}, 100);
	};
	
	//담겨진 장소 div로 스크롤 이동
	scrollToSaveCourse = function(){
		//스크롤이동
	    var offset = $('#submitCourse').offset(); //선택한 태그의 위치를 반환
		
		//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.1초 동안 부드럽게 해당 위치로 이동함 
		$('html').animate({scrollTop : offset.top}, 100);
	};
	
})(jQuery);








//지도생성 script
var markers = [];
var markers2 = [];
var markers3 = [];
var markersNow = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도 타입 컨트롤을 지도에 표시합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();













//키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

	
	
	var el = document.createElement('li'),
       itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                   '<div class="info" id="info">' +
                   '<input type="hidden" value="'+places.y+'" name="y">'+
                   '<input type="hidden" value="'+places.x+'" name="x">'+
                   '   <h5 id="resName" name="resName">' + places.place_name + '</h5>';

       if (places.road_address_name) {
           itemStr += '    <span name="resAddr">' + places.road_address_name + '</span>';
       } else {
           itemStr += '    <span name="resAddr">' +  places.address_name  + '</span>'; 
       }
                    
         itemStr += '  <span class="tel" name="resTel">' + places.phone  + '</span>' +
                   '</div>';           
         
       el.innerHTML = itemStr;
       el.className = 'item';

       return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = '/resources/images/ico_marker6_def.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(26, 36),  // 마커 이미지의 크기
//        imgOptions =  {
//            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
//            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
//            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
//        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}



// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
    	
        markers[i].setMap(null);
        positions2 =[];
        positions=[];
    }   
    
//    for(var i = 0; i<markers3.length;i++){
//    	markers3[i].setMap(null);
//    }
    markers = [];
   
//    markers3 = [];
}
function removeMarker2(){//관광지제거
	
	if(markers2.length!=0){
	    for(var i = 0; i< markers2.length;i++){
	    	 markers2[i].setMap(null);
	    	
	    }
	    }
	    markers2 = [];
}

function removeMarker3(){//숙박지제거
	if(markers3.length!=0){
	    for(var i = 0; i< markers3.length;i++){
	    	 markers3[i].setMap(null);
	    	
	    }
	    }
		markers3 = [];
}
function removeMarkerNow(){
	if(markersNow.length!=0){
	    for(var i = 0; i< markersNow.length;i++){
	    	 markersNow[i].setMap(null);
	    	
	    }
	    }
		markersNow = [];
	
}
// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 //지도 내의 주소목록의 주소이름을 클릭했을때 호출되는 함수입니다.
// function saveAddress(road_address_name,place_name,phone){
//
//		 var el = document.createElement('li'),
//		    itemStr = 
//		                '<div class="info">' +
//		                '   <h5>' + place_name + '</h5>';
//
//		    if (places.road_address_name) {
//		        itemStr += '    <span>' + road_address_name + '</span>';
//		                    
//		    } 
//		                 
//		      itemStr += '  <span class="tel">' + phone  + '</span>' +
//		                '</div>';
//		 
//		 $('#resInfoDiv').append(itemStr);
//	
//	
//	 
//	 
// }
 //관광지보기 누르는함수
// function showPlaceInfo(x,y,arrXY){
	 function showPlaceInfo(){
		
		 
		removeMarker2();
		removeMarker3();
		removeMarker();
		removeMarkerNow()
	 for(var e =0;e<arrXY2.length;e++){

	 positions2.push({title:arrXY2[e].placeName,latlng:new kakao.maps.LatLng(arrXY2[e].x,arrXY2[e].y)})
		 console.log(arrXY2[e].x);
	 }
	
	    
	  //관광지들
	// 마커 이미지의 이미지 주소입니다

	   
	 
	
		 var imageSrc = "../resources/images/ico_marker1_hover.png"; 
	 
	   for (var i = 0; i < positions2.length; i ++) {
	       
	       // 마커 이미지의 이미지 크기 입니다
	       var imageSize = new kakao.maps.Size(26, 36); 
	       
	       // 마커 이미지를 생성합니다    
	       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	       
	       // 마커를 생성합니다	
	       	  marker2 = new kakao.maps.Marker({
	           map: map, // 마커를 표시할 지도
	           position: positions2[i].latlng, // 마커를 표시할 위치
	           title : positions2[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	           image : markerImage // 마커 이미지 
	       });
	       	  marker2.setMap(map);
	       	  markers2.push(marker2);
	   }
	 
 }
	 
	   function showResInfo(x,y){
		   
		   removeMarkerNow();
	
		   mapOption = { 
			        center: new kakao.maps.LatLng(x,y), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
		   	//현재위치
		    //현재위치의 마커 생성

			    
			    var imageSrcNow = "../resources/images/you-are-here.png"
			    
			    var imageSizeNow = new kakao.maps.Size(35,35);
			    
			    var markerImageNow = new kakao.maps.MarkerImage(imageSrcNow, imageSizeNow); 
			    	
			    
			    var markerNow = new kakao.maps.Marker({
			    	map: map,
			    	position: new kakao.maps.LatLng(x,y),
			    	title:"현재 위치",
			    	image:markerImageNow,
			    	zIndex: 4
			    });
			      markerNow.setMap(map);
		       	  markersNow.push(markerNow);
	   }
	   
	   function showHouseInfo(){//숙박지함수
		   
			 removeMarker3();
			   removeMarker2();
				removeMarker();
				 removeMarkerNow()
			 for(var e =0;e<arrXY.length;e++){

			 positions.push({title:arrXY[e].placeName,latlng:new kakao.maps.LatLng(arrXY[e].x,arrXY[e].y)})
				 
			 }
			    
			  //숙박지
			// 마커 이미지의 이미지 주소입니다
			
				 var imageSrc = "../resources/images/ico_marker2_def.png"; 
			 
			   for (var i = 0; i < positions.length; i ++) {
			       
			       // 마커 이미지의 이미지 크기 입니다
			       var imageSize = new kakao.maps.Size(26, 36); 
			       
			       // 마커 이미지를 생성합니다    
			       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			       
			       // 마커를 생성합니다
			        marker3 = new kakao.maps.Marker({
			           map: map, // 마커를 표시할 지도
			           position: positions[i].latlng, // 마커를 표시할 위치
			           title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			           image : markerImage // 마커 이미지 
			       });
			          marker3.setMap(map);
			       	  markers3.push(marker3);
			   }
	   }
	 