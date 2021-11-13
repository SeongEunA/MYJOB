
//화면 로딩 후 바로 실행
$(document).ready(function(){

	
	
		
	//댓글처리
	//댓글리스트 조회
/*	selectReviewReplyList();*/
	
	
	
	
	
	
	$(document).on('click', '.replyContent', function() {
		var loginInfo = $('.reviewReplyWriter').val();
		if(loginInfo == ''){
			 var result = confirm('로그인을 하시겠습니까?');
			 if(result){
				 location.href = '/member/login';
			 }
		}
	
		
		
		
	});
   
	//ajax 사용
//	$.ajax({
//        url: '', //요청경로
//        type: 'post',
//        data:{}, //필요한 데이터
//        success: function(result) {
//        	//ajax 실행 성공 시 실행되는 구간
//        	alert('성공');
//        },
//        error: function(){
//        	//ajax 실행 실패 시 실행되는 구간
//        	alert('실패');
//        }
//  });
	
	
});
/*$("#replyForm").serialize()*/
//함수 선언 영역

(function($){
	

	

	//후기에 댓글삭제 함수
	deleteReply = function(){
			var result = confirm('댓글을 삭제하시겠습니까?');
			
			if(result){
				$('#deleteReply').submit();
			}
		
	}
	//관리자와 게시글 작성자만 볼 수 있는 삭제버튼(클릭시 컨펌창)
	deleteReviewBoard = function() {
		var reviewBoardCode = $('.reviewBoardCode').val();
		var result = confirm('정말로 삭제하시겠습니까?');
		if(result){
			location.href='/review/deleteReviewBoard?reviewBoardCode=' + reviewBoardCode;
		}
		
	}

	//추천수증가
	updateRecommend = function() {
		var reviewBoardCode = $('.reviewBoardCode').val();
		var memberId = $('.reviewReplyId').val();	
		if(memberId != ''){
			if(!isRecommend){
				isRecommend = true;
				$.ajax({
		            url: '/review/updateRecommend', //요청경로
		            type: 'get',
		            data:{'reviewBoardCode': reviewBoardCode
		            	, 'memberId': memberId}, //필요한 데이터
		            success: function(result) {
		            	$('#appendRecommendCnt').empty();
		            	var str ='';
		            	str +='<img class="recomBtn" src="/resources/images/updateRecommend.PNG">'+ result.reviewBoardRecommendCnt  +'';
	 	
		            	$('#appendRecommendCnt').append(str);	
		            	
		            	
		            },
		            error: function(){
		               alert('실패');
		            }
		      });
			}
		}	
	}
	

	
	
})(jQuery);






var isRecommend = false;	
//마커를 표시할 위치와 title 객체 배열입니다 
var markerCnt = $('.markerX').length;
var markerArrX = [];
var markerArrY = [];
//var markers = [];
var centerX;
var centerY;
var centerCnt = 0;

var k=0;
for(var i = 0; i < markerCnt; i++){
	
	if($('.markerX').eq(i).val() !=0 && $('.markerY').eq(i).val() != 0){
		
		markerArrX[k] = $('.markerX').eq(i).val();
		markerArrY[k] = $('.markerY').eq(i).val();
		k++;
	}

//	if(centerCnt == 0 && markerArrX[i] != 0 && markerArrY[i] != 0){
//		centerX = markerArrX[i];
//		centerY = markerArrY[i];
//		centerCnt = 1;
//	}

	console.log(markerArrX[k]);
	console.log(markerArrY[k]);
}



var positions=[];
var linePath = [];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(markerArrX[0], markerArrY[1]), // 지도의 중심좌표
    level: 10 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var markerArrLength = markerArrX.length;
for(var e =0;e<markerArrLength;e++){
 positions.push({latlng:new kakao.maps.LatLng(markerArrX[e],markerArrY[e])})
	 
 }
//positions.push({latlng:new kakao.maps.LatLng(35.529478, 129.307473)})
//positions.push({latlng:new kakao.maps.LatLng(35.547882, 129.301145)})
//positions.push({latlng:new kakao.maps.LatLng(35.547882, 129.301145)})
//console.log(positions);
//	var positions = [
//    {
//        latlng: new kakao.maps.LatLng(35.529478, 129.307473)
//    },
//    {
//        latlng: new kakao.maps.LatLng(35.529478, 129.307473)
//    },
//    {
//        latlng: new kakao.maps.LatLng(35.547882, 129.301145)
//    },
//    {
//        latlng: new kakao.maps.LatLng(35.564249, 129.457218)
//    }
//];
	console.log(positions);

//마커 이미지의 이미지 주소입니다
var imageSrc = '/resources/images/myMarker1.png'; 

for (var i = 0; i < positions.length; i++) {

// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng, // 마커를 표시할 위치
    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
console.log(marker);
}
	
//선 긋기

//선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
//	 var linePath = [
// new kakao.maps.LatLng(markerArrX[0],markerArrY[0]),
// new kakao.maps.LatLng(markerArrX[1],markerArrY[1]),
// new kakao.maps.LatLng(35.547882, 129.301145), 
// new kakao.maps.LatLng(35.564249, 129.457218) 
//];

for(var e =0;e<markerArrLength;e++){

 linePath.push(new kakao.maps.LatLng(markerArrX[e],markerArrY[e]));
	 
 }

//지도에 표시할 선을 생성합니다
var polyline = new kakao.maps.Polyline({
 path: linePath, // 선을 구성하는 좌표배열 입니다
 strokeWeight: 3, // 선의 두께 입니다
 strokeColor: '#dc143c', // 선의 색깔입니다
 strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
 strokeStyle: 'solid' // 선의 스타일입니다
});
console.log(polyline);
//지도에 선을 표시합니다 
polyline.setMap(map);  

















