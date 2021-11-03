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
	
	
	//회원 탈퇴 버튼을 누르면 탈퇴하기
	deleteMember = function(memberCode){
		var result = confirm('정말로 탈퇴하시겠습니까?');
		if(result){
			location.href='/member/deleteMember?memberCode=' + memberCode;
		}
	}
	
	
	//수정 버튼을 누르면 수정하기
	updateMyInfo = function(memberCode){
		
		//버튼의 글자가 확인이면
		if($('#updateMyInfo').val() == '수정'){
			
			//회원 정보에 있는 값들을 인풋태그에 삽입
			var memberPw = $('#memberPw').text();
			var memberEmail = $('#memberEmail').text();
			var memberTel = $('#memberTel').text();
			var memberAddr = $('#memberAddr').text();
			
			$('#memberPw').html('<input type="text" value="' + memberPw + '">');
			$('#memberEmail').html('<input type="text" value="' + memberEmail + '">');
			$('#memberTel').html('<input type="text" value="' + memberTel + '">');
			$('#memberAddr').html('<input type="text" value="' + memberAddr + '">');
			
			//버튼의 글자를 변경
			$('#updateMyInfo').val('확인');
		}
		//확인 버튼을 누르면 수정된 정보를 업데이트
		else if($('#updateMyInfo').val() == '확인'){
			var result = confirm('정보를 수정하시겠습니까?');
			if(result){
			
				//변경된 정보를 수정
				var memberPw = $('#memberPw').children().eq(0).val();
				var memberEmail = $('#memberEmail').children().eq(0).val();
				var memberTel = $('#memberTel').children().eq(0).val();
				var memberAddr = $('#memberAddr').children().eq(0).val();
				
				$.ajax({
		            url: '/member/updateMyInfo', //요청경로
		            type: 'post',
		            data:{'memberCode':memberCode
		            		, 'memberPw':memberPw
		            		, 'memberEmail':memberEmail
		            		, 'memberTel':memberTel
		            		, 'memberAddr':memberAddr}, //필요한 데이터
		            success: function(result) {
		               	if(result){
							alert('회원정보가 수정되었습니다.');
							updatedDetailMember(memberCode);
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
				
				
				//회원정보 상세조회
				updatedDetailMember = function(memberCode){
					
					$.ajax({
						url: '/member/updatedDetailMember', //요청경로
						type: 'post',
						data:{'memberCode':memberCode}, //필요한 데이터
						success: function(result) {
							$('#detailMyInfo').empty();
							
							var str = '';
							str += '	<table>';
							str += '		<colgroup>';
							str += '			<col width="10%">';
							str += '			<col width="40%">';
							str += '			<col width="10%">';
							str += '			<col width="40%">';
							str += '		</colgroup>';
							str += '		<tr>';
							str += '			<td>회원아이디</td>';
							str += '			<td>' + result.memberId + '</td>';
							str += '			<td>가입일</td>';
							str += '			<td>' + result.memberJoinDate + '</td>';
							str += '		</tr>';
							str += '		<tr>';
							str += '			<td>회원이름</td>';
							str += '			<td>' + result.memberName + '</td>';
							str += '			<td>성별</td>';
							str += '			<td>' + result.memberGender + '</td>';
							str += '		</tr>';
							str += '		<tr>';
							str += '			<td>회원비밀번호</td>';
							str += '			<td id="memberPw">' + result.memberPw + '</td>';
							str += '			<td>회원이메일</td>';
							str += '			<td id="memberEmail">' + result.memberEmail + '</td>';
							str += '		</tr>';
							str += '		<tr>';
							str += '			<td>회원연락처</td>';
							str += '			<td id="memberTel">' + result.memberTel + '</td>';
							str += '			<td>회원주소</td>';
							str += '			<td id="memberAddr">' + result.memberAddr + '</td>';
							str += '		</tr>';
							str += '	</table>';
							str += '	<div class="manageBtnDiv2">';
							str += '		<div class="updateMyInfoBtnDiv">';
							str += '			<input type="button" id="updateMyInfo" value="수정" onclick="updateMyInfo(\'' + result.memberCode + '\');">';
							str += '		<div class="updateMyInfoBtnDiv">';
							str += '	</div>';
							
							$('#detailMyInfo').append(str);
							
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