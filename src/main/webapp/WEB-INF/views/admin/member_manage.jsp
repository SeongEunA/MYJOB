<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	width: 1000px;
	background-color: #eaeaea;
	margin-top: 30px;
	padding: 30px;
	
}
table{
	width: 940px;
	margin: 0 auto;
	text-align: center;
}
tr{
	border: 1px solid black;
}
td{
	border: 1px solid black;
	padding: 10px;
	
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<table>
			<colgroup>
				<col width="30%">
				<col width="30%">
				<col width="30%">
			</colgroup>
				<thead>
					<tr>
						<td>회원코드</td>
						<td>회원아이디</td>
						<td>회원이름</td>
					</tr>
				</thead>
				<tbody>
					  <c:forEach items="${selectSimpleMemberList }" var="simpleMemberInfo">
						    <tr>
						      	<td><a  style="color: black; text-decoration-line: none;" href="/admin/detailMember?memberCode=${simpleMemberInfo.memberCode }">${simpleMemberInfo.memberCode }</a></td>
						      	<td><a  style="color: black; text-decoration-line: none;" href="/admin/detailMember?memberCode=${simpleMemberInfo.memberCode }">${simpleMemberInfo.memberId }</a></td>
						      	<td><a  style="color: black; text-decoration-line: none;" href="/admin/detailMember?memberCode=${simpleMemberInfo.memberCode }">${simpleMemberInfo.memberName }</a></td>
						    </tr>  
					  </c:forEach>
			  	</tbody>
			</table>
		</div>
	</div>
</body>
</html>