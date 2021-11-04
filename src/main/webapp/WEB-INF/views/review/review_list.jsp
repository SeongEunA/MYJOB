<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/review/js/reg_review.js?ver=1"></script>
<style type="text/css">
.container{
	width: 1100px;
	margin: 0 auto;
}
.container.regCourseDiv{
	width: 100%;
}

.tableDiv{
	width: 100%;
}
.tableDiv td{
	padding-top: 50px;
	padding-bottom: 50px;
	padding-left: 30px;
}
.tableDiv tr{
	border-top: 1.5px soild #f2f2f2;
	border-bottom: 1.5px solid #f2f2f2;
}

</style>
</head>
<body>
	<div class="container">
		<div class="regCourseDiv">
			<div>
				<a href="/review/regReview"><img src="/resources/images/banner_cos_top3.gif"></a>
			</div>
		</div>
		<div class="tableDiv">
			<table>
				<thead>
					<tr>
						<td>
							총${reviewList.size()}건
						</td>
					</tr>	
				</thead>
				<c:forEach items="${reviewList }" var="reviewVO">
					<tr>
						<td><a href="/review/detailReview?reviewBoardCode=${reviewVO.reviewBoardCode }&memberId=${sessionScope.loginInfo.memberId}"> <img src="/resources/images/${reviewVO.reviewImgList[0].reviewImgAttachedName }"></a></td>
						<td><a href="/review/detailReview?reviewBoardCode=${reviewVO.reviewBoardCode }&&memberId=${sessionScope.loginInfo.memberId}"> ${reviewVO.reviewBoardTitle }</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="row">
			<div class="col text-center pagingDiv">
				<c:if test="${reviewVO.prev }"> 
					<a href="/review/selectReviewList?nowPage=${reviewVO.beginPage - 1 }">prev</a>
				</c:if>
				<c:forEach begin="${reviewVO.beginPage }" end="${reviewVO.endPage }" var="pageNumber">
					<a href="/review/selectReviewList?nowPage=${pageNumber }&searchKeyword=${reviewVO.searchKeyword}&searchValue=${reviewVO.searchValue}" <c:if test="${reviewVO.nowPage eq pageNumber }">class="selectedPage"</c:if> >
					${pageNumber }</a>  
				</c:forEach>
				<c:if test="${reviewVO.next }"> 
					<a href="/review/selectReviewList?nowPage=${reviewVO.endPage + 1 }">next</a>
				</c:if>
			</div>
		</div>
		<div class="col-6">
			<form class="row align-items-center" action="/review/selectReviewList" method="post">
			   <div class="col-4">
			    <label class="visually-hidden" for="autoSizingSelect">Preference</label>
			    <select class="form-select" id="autoSizingSelect" name="searchKeyword">
			      <option value="REVIEW_BOARD_TITLE" <c:if test="${reviewVO.reviewBoardTitle eq REVIEW_BOARD_TITLE}">selected</c:if>>제목</option>
			      <option value="REVIEW_BOARD_WRITER"<c:if test="${reviewVO.reviewBoardWriter eq REVIEW_BOARD_WRITER }">selected</c:if>>작성자</option>
			    </select>
			  </div>  
			  <div class="col-5">
			    <label class="visually-hidden" for="autoSizingInput">Name</label>
			    <input type="text" name="searchValue" class="form-control" id="autoSizingInput" value="${reviewVO.searchValue }">
			  </div>
				 <div class="col-3">
			    <button type="submit" class="btn btn-primary" id="se">검색</button>
			  </div>
			</form>
		</div>
		
	</div>
</body>
</html>