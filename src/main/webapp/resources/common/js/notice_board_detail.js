//이벤트처리
//화면 로딩 후 바로 실행 이벤트처리
$(document).ready(function(){
	//이벤트 발생
	//$(document).on('click', '#updateMemberInfo', function() {
		//var memberCode = $('#updateMemberCode').val();
		
		//updateMemberInfo(memberCode);
	//});

});

//함수선언영역
(function($){
	
	
	//삭제 버튼을 누르면 삭제하기
	deleteNoticeBoard = function(noticeBoardCode) {
		var result = confirm('정말로 삭제하시겠습니까?');
		if(result){
			location.href='/admin/deleteNoticeBoard?noticeBoardCode=' + noticeBoardCode;
		}
		
	}
	
	
	//수정 버튼을 누르면 수정하기
	updateNoticeBoard = function(noticeBoardCode){
		//버튼의 글자가 확인이면
		if($('#updateNoticeBoard').val() == '수정'){
			//공지사항 상세페이지에서 변경 가능한 값들을 인풋...
			var boardSubject = $('#boardSubject').text();
			var boardContent = $('#boardContent').text();
			
			$('#boardSubject').html('<input type="text" id="inputSubject" style="width: 99%;" value="' + boardSubject + '">');
			$('#boardContent').html('<textarea cols="83%" rows="8" name="boardContent" style="resize: none;">' + boardContent + '</textarea>');
			$('#inputSubject').focus();
			
			
			//버튼의 글자를 변경
			$('#updateNoticeBoard').val('확인');
			$('.deleteNoticeBoardBtnDiv').empty();
			var str = '';
			str += '	<div class="cancelNoticeBoardBtnDiv"><input type="button" value="취소" onclick="history.go();"></div>';
			$('.deleteNoticeBoardBtnDiv').append(str);
			
			
		}
		//확인 버튼을 누르면 변경된 정보를 업데이트
		else if($('#updateNoticeBoard').val() == '확인'){
			var result = confirm('정보를 수정하시겠습니까?');
			if(result){
		
				var boardSubject = $('#boardSubject').children().eq(0).val();
				var boardContent = $('#boardContent').children().eq(0).val();
				
				$.ajax({
		            url: '/admin/updateNoticeBoard', //요청경로
		            type: 'post',
		            data:{'noticeBoardCode':noticeBoardCode
		            		, 'boardSubject':boardSubject
		            		, 'boardContent':boardContent}, //필요한 데이터
		            success: function(result) {
		               	if(result){
							alert('공지사항이 수정되었습니다.');
							updatedDetailNoticeBoard(noticeBoardCode);
					   	}
					   	else{
							alert('관리자에게 문의하세요.');
						}
		            },
		            error: function(){
		             //ajax 실행 실패 시 실행되는 구간
		               alert('실패');
	            	}
	      		});
				
				//공지사항 상세조회
				updatedDetailNoticeBoard = function(noticeBoardCode){
					//히든으로 넘겨준 관리자정보받기
					var memberIsAdmin = $('#memberIsAdmin').val();
					
					$.ajax({
						url: '/admin/updatedDetailNoticeBoard', //요청경로
			            type: 'post',
			            data:{'noticeBoardCode':noticeBoardCode}, //필요한 데이터
			            success: function(result) {
						    $('.noticeContent').empty();
							
						    var str = '';
						    str += ' 	<table>';
						    str += ' 		<colgroup>';
						    str += '			<col width="*%">';
						    str += '			<col width="10%">';
						    str += '			<col width="10%">';
						    str += ' 		</colgroup>';
						    str += ' 		<tr class="firstLine">';
						    str += '			<td>제목</td>';
						    str += '			<td>작성자</td>';
						    str += '			<td>작성일</td>';
						    str += '		</tr>';
						    str += '		<tr>';
						    str += '			<td id="boardSubject">' + result.boardSubject + '</td>';
						    str += '			<td>' + result.boardWriter + '</td>';
						    str += '			<td>' + result.regDate + '</td>';
						    str += '		</tr>';
						    str += '		<tr class="thirdLine">';
						    str += '			<td colspan="3">내 용</td>';
						    str += '		</tr>';
						    str += '		<tr class="contentTr">';
						    str += '			<td colspan="3" id="boardContent">' + result.boardContent + '</td>';
						    str += '		</tr>';
						    str += ' 	</table>';
			  	   			if(memberIsAdmin == 'Y'){
			  	   				str += '		<div class="manageBtnDiv">';
			  	   				str += '			<div class="updateNoticeBoardBtnDiv"><input type="button" id="updateNoticeBoard" value="수정" onclick="updateNoticeBoard(\'' + result.noticeBoardCode + '\');"></div>';
			  	   				str += '			<div class="deleteNoticeBoardBtnDiv"><input type="button" id="deleteNoticeBoard" value="삭제" onclick="deleteNoticeBoard(\'' + result.noticeBoardCode + '\');"></div>';
			  	   				str += '			<div><input id="memberIsAdmin" type="hidden" value="' + memberIsAdmin + '"></div>';
			  	   				str += '		</div>';
			  	   			}
						    $('.noticeContent').append(str);
						    
			           },
			           error: function(){
			               //ajax 실행 실패 시 실행되는 구간
			               alert('실패');
			           }
			       });
				}
			}	
		}
	}
	
	
	
	
	
		
			
	
	
	
	
})(jQuery);