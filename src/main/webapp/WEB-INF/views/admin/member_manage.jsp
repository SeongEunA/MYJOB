<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	font-size: 13px;
}
.memberName:hover {
	cursor: pointer;
}

</style>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-8 text-center">
		<table class="table table-striped table-hover">
			<thead>
			    <tr>
					<th scope="col"><input type="checkbox"></th>
					<th scope="col">MEMBER_CODE</th>
				    <th scope="col">MEMBER_ID</th>
				    <th scope="col">MEMBER_NAME</th>
			    </tr>
			</thead>
		  	<tbody>
				  <c:forEach items="${selectSimpleMemberList }" var="simpleMemberInfo">
					    <tr>
					    	<td scope="col"><input type="checkbox"></td>
					      	<td class="align-middle">${simpleMemberInfo.memberCode }</td>
					      	<td class="align-middle">${simpleMemberInfo.memberId }</td>
					      	<td class="align-middle memberName"><a  style="color: black; text-decoration-line: none;" href="/admin/detailMember?memberCode=${simpleMemberInfo.memberCode }">${simpleMemberInfo.memberName }</a></td>
					    </tr>  
				  </c:forEach>
		  	</tbody>
		</table>
	</div>
</div>
</body>
</html>