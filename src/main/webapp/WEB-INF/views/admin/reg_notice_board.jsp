<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function regNoticeBoard() {
		var result = confirm('등록하시겠습니까?');
		if(result){
			$('#regNoticeBoardForm').submit();
			
		}
		
	}
</script>
</head>
<body>
공지사항 등록페이지
<form action="/admin/regNoticeBoard" method="post" id="regNoticeBoardForm">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="boardSubject" required></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="boardWriter" value="${sessionScope.loginInfo.memberId }" readonly></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="60" rows="5" name="boardContent"></textarea></td>
		</tr>
	</table>
	<div>
		<input type="button" class="btn" value="등록" onclick="regNoticeBoard();">
	</div>
</form>
</body>
</html>