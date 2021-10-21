<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<th scope="col">MEMBER_CODE</th>
				    <th scope="col">MEMBER_ID</th>
				    <th scope="col">MEMBER_NAME</th>
				    <th scope="col">MEMBER_PW</th>
				    <th scope="col">MEMBER_TEL</th>
				    <th scope="col">MEMBER_ADDR</th>
				    <th scope="col">MEMBER_EMAIL</th>
				    <th scope="col">MEMBER_IS_ADMIN</th>
				    <th scope="col">MEMBER_GENDER</th>
				    <th scope="col">MEMBER_JOIN_DATE</th>
			    </tr>
			</thead>
		  	<tbody>
			    <tr>
			      	<td class="align-middle">${selectDetailMember.memberCode }</td>
			      	<td class="align-middle">${selectDetailMember.memberId }</td>
			      	<td class="align-middle">${selectDetailMember.memberName }</td>
			      	<td class="align-middle">${selectDetailMember.memberPw }</td>
			      	<td class="align-middle">${selectDetailMember.memberTel }</td>
			      	<td class="align-middle">${selectDetailMember.memberAddr }</td>
			      	<td class="align-middle">${selectDetailMember.memberEmail }</td>
			      	<td class="align-middle">${selectDetailMember.memberIsAdmin }</td>
			      	<td class="align-middle">${selectDetailMember.memberGender }</td>
			      	<td class="align-middle">${selectDetailMember.memberJoinDate }</td>
			    </tr>  
		  	</tbody>
		</table>
		</div>
	</div>
</body>
</html>






