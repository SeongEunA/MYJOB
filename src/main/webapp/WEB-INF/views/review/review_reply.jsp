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
	<input type="hidden" name="reviewBoardCode" value="REVIEW_BOARD_001">
	<input type="hidden" name="reviewReplyWriter" value="${sessionScope.loginInfo.memberName }">
	<br><br>
		<div>
			<strong>댓글</strong>	
		</div>
		<div class="replyFormDiv">
			<table class="replyTable">
				<tr>
					<td>
						<textarea style="width: 1100px" class="replyContent" rows="3" cols="30" name="reviewReplyContent"></textarea>
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
	<form id="replyList" method="post">
        <div id="replyList">
        </div>
    </form>
</div>
</body>
</html>