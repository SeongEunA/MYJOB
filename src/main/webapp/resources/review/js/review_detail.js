//화면 로딩 후 바로 실행
$(document).ready(function(){

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.534802, 129.309894), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 


	var positions = [
	    {
	        latlng: new kakao.maps.LatLng(35.529478, 129.307473)
	    },
	    {
	        latlng: new kakao.maps.LatLng(35.602141, 129.148268)
	    },
	    {
	        latlng: new kakao.maps.LatLng(35.547882, 129.301145)
	    },
	    {
	        latlng: new kakao.maps.LatLng(35.564249, 129.457218)
	    }
	];

// 마커 이미지의 이미지 주소입니다
var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png'; 
    
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
}
		
	//선 긋기

	//선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
	 var linePath = [
	 new kakao.maps.LatLng(35.529478, 129.307473),
	 new kakao.maps.LatLng(35.602141, 129.148268),
	 new kakao.maps.LatLng(35.547882, 129.301145), 
	 new kakao.maps.LatLng(35.564249, 129.457218) 
	];
	
	//지도에 표시할 선을 생성합니다
	var polyline = new kakao.maps.Polyline({
	 path: linePath, // 선을 구성하는 좌표배열 입니다
	 strokeWeight: 3, // 선의 두께 입니다
	 strokeColor: '#dc143c', // 선의 색깔입니다
	 strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	 strokeStyle: 'solid' // 선의 스타일입니다
	});
	
	//지도에 선을 표시합니다 
	polyline.setMap(map);  
	
		
	//댓글처리
	
	//댓글리스트 조회
	selectReviewReplyList();
	
	
	
	
	
	
	
	
	
	
	
	
	//이벤트 처리
	//$(document).on('click', '#id', function() {
    //});
   
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
	
	//댓글등록
	regReply = function(){
		var reviewReplyWriter = $('#reviewReplyWriter').val();
		var reviewReplyContent = $('#reviewReplyContent').val();
		var reviewBoardCode = $('.hiddenBoardCode').val();
		
		$.ajax({
	        url: '/review/regRely', //요청경로
	        type: 'post',
	        data:{'reviewReplyWriter':reviewReplyWriter
	        	, 'reviewReplyContent':reviewReplyContent
	        	, 'reviewBoardCode': reviewBoardCode
	        },
	        success: function(result) {
	        	if(result == 1){
	        	 	alert('댓글이 등록되었습니다');
	        	 	$('.replyContent').val('');
	        	 	selectReviewReplyList();
	        		
				}
	        	else{
	        		alert('관리자에게 문의하세요');
	        		
	        	}
	        	
	      
	        },
	        error: function(){
	        	alert('실패');
	        }
	  });
		
		
	};
	
	//후기창에 댓글리스트 조회
	selectReviewReplyList = function(){
		var reviewBoardCode = $('.hiddenBoardCode').val();
		$.ajax({
	        url: '/review/selectReviewReplyList', //요청경로
	        type: 'post',
	        data:{'reviewBoardCode':reviewBoardCode}, //필요한 데이터
	        success: function(result) {
	        	var str = '';
	        	$('#replyList').empty();
	        	
	        	if(result.length != 0){
	        		for(var i = 0; i < result.length; i++){
	        			str += "<div>";
	        			str += "<div><table class='table'><h6><strong>"+result[i].reviewReplyWriter+"</strong></h6>";
	        			str += result[i].reviewReplyContent + "<tr><td></td></tr>";
	        			str += "</table></div>";
	        			str += "</div>";
		
	        		}
		        	
		      
	        	}
	        	else{
	        		str += "<div>";
	        		str += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
	        		str += "</table></div>";
	        		str += "</div>";
	        		
	        	}
	        	
	        	$('#replyList').append(str);
	        	
	        },
	        error: function(){
	        	alert('실패');
	        }
	  });
		
		
		
		
	}
	
	
	
	
	
})(jQuery);
























