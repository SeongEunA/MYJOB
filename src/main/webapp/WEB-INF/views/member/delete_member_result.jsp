<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:if test="${deleteMemberResult }">
		<script type="text/javascript">
			alert('회원 탈퇴가 처리되었습니다. 그동안 이용해주셔서 감사합니다.')
			location.href='/member/logout';
		</script>
	</c:if>
</head>
<body>

</body>
</html>