<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form method="post" id="replyForm" name="replyForm">
	<br><br>
		<div>
			<strong>댓글</strong>	
		</div>
		<div class="replyFormDiv">
			<table class="replyTable">
				<tr>
					<td>
						<textarea style="width: 1100px; resize: none;"  class="replyContent" rows="3" cols="30" id="reviewReplyContent"></textarea>
						<br>
						<div>
							<input type="button" onclick="regReply();" value="등록" class="btn pull-right btn-secondary">
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="container">
	<div id="replyForm">
        <div id="replyList">
        
        </div>
    </div>
</div>
</body>
</html>