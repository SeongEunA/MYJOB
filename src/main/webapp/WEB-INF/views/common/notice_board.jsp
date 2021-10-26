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
	font-size: 11px;
}
</style>
</head>
<body>
	<div class="row justify-content-center">
		<div class="col-12 text-center">
			<table class="table">
			<thead>
			    <tr>
				    <th scope="col">BOARD_SUBJECT</th>
				    <th scope="col">BOARD_WRITER</th>
				    <th scope="col">REG_DATE</th>
			    </tr>
			</thead>
		  	<tbody>
		  		<c:forEach items="${selectNoticeBoardList }" var="noticeBoardInfo">
				    <tr>
				      	<td class="align-middle">${noticeBoardInfo.boardSubject }</td>
				      	<td class="align-middle">${noticeBoardInfo.boardWriter }</td>
				      	<td class="align-middle">${noticeBoardInfo.regDate }</td>
				    </tr>  
		  		</c:forEach>
		  	</tbody>
		</table>
		</div>
	</div>
</body>
</html>






