<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:if test="${deleteReviewBoardResult }">
		<script type="text/javascript">
			alert('해당 리뷰게시물이 삭제되었습니다.')
			location.href='/review/selectReviewList';
		</script>
	</c:if>
</head>
<body>

</body>
</html>