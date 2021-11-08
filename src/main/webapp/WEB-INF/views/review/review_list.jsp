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
	margin: 0 auto;
	margin-top:50px;
}
.regCourseDiv{
	border:1px solid black;
	margin:0 auto;
	margin-top:50px;
}
.regCourseImg{
	border:1px solid black;
	width:100%;
	height:100%;
	margin:0 auto;
}

.reviewMargin{
	margin-top:10px;
}
.selectOrderBy{
	border:1px solid black;
	margin:0 auto;
	height:100px;
	text-align:right;
}
.selectOrderBy > span{
	border:1px solid red;
	display:inline-block;
	margin-top:10px;
}
.tableDiv{
	border:1px solid red;
	width:80%;
}
.tableDiv > tbody >tr > td{
	border:1px solid black;
}
.tableDiv > tbody > tr > td:last-child {
	width:70%;
	
}
.searchContainer{
	border:1px solid black;
	height:40px;
	margin:0 auto;
	margin-top:40px;
}
</style>
</head>
<body>
	<div class="col-12 bodyContainer">
		<div class="col-6 regCourseDiv">
			<div class="regCourseImg">
				<a href="/review/regReview?memberId=${sessionScope.loginInfo.memberId }"><img src="/resources/images/banner_cos_top3.gif" class="regCourseImg"></a>
			</div>
		</div>

		<div class="col-8 noticeTitleDiv reviewMargin">
			<div class="col-12 noticeTitle">후기 게시판</div>
			<!-- 추천수 인기순 -->
			<div class="col-12 selectOrderBy">
				<span>
					<a href="/review/selectReviewList">최신순</a>/
					<a href="/review/selectReviewList">인기순</a>
				</span>
			</div>
			총${reviewList.size()}건
			<div class="col-12 container">

				<div>
					<table class="tableDiv">
					
							<colgroup>
								<col width=25%>
								<col width=30%>
								<col width=*>
							</colgroup>
						<tbody>
						<c:forEach items="${reviewList }" var="reviewVO">
							<tr>
								<td rowspan="2">
									<a href="/review/detailReview?reviewBoardCode=${reviewVO.reviewBoardCode }&memberId=${sessionScope.loginInfo.memberId}">
										<img src="/resources/images/${reviewVO.reviewImgList[0].reviewImgAttachedName }" width="250" height="250">
									</a>
								</td>
								<td colspan="2">
									<a href="/review/detailReview?reviewBoardCode=${reviewVO.reviewBoardCode }&&memberId=${sessionScope.loginInfo.memberId}">
										${reviewVO.reviewBoardTitle }
									</a>
								</td>
							</tr>
							<tr>
								<td>작성일</td>
								<td>태그란</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="row">
					<div class="col text-center pagingDiv">
						<c:if test="${reviewVO.prev }">
							<a href="/review/selectReviewList?nowPage=${reviewVO.beginPage - 1 }">prev</a>
						</c:if>
						<c:forEach begin="${reviewVO.beginPage }" end="${reviewVO.endPage }" var="pageNumber">
							<a href="/review/selectReviewList?nowPage=${pageNumber }&searchKeyword=${reviewVO.searchKeyword}&searchValue=${reviewVO.searchValue}"
								<c:if test="${reviewVO.nowPage eq pageNumber }">class="selectedPage"</c:if>>
								${pageNumber }
							</a>
						</c:forEach>
						<c:if test="${reviewVO.next }">
							<a href="/review/selectReviewList?nowPage=${reviewVO.endPage + 1 }">next</a>
						</c:if>
					</div>
				</div>
				<div class="col-6 searchContainer">
					<form class="row align-items-center" action="/review/selectReviewList" method="post">
						<div class="col-4">
							<label class="visually-hidden" for="autoSizingSelect">Preference</label>
							<select class="form-select" id="autoSizingSelect" name="searchKeyword">
								<option value="REVIEW_BOARD_TITLE"
									<c:if test="${reviewVO.reviewBoardTitle eq REVIEW_BOARD_TITLE}">selected</c:if>>제목</option>
								<option value="REVIEW_BOARD_WRITER"
									<c:if test="${reviewVO.reviewBoardWriter eq REVIEW_BOARD_WRITER }">selected</c:if>>작성자</option>
							</select>
						</div>
						<div class="col-5">
							<label class="visually-hidden" for="autoSizingInput">Name</label>
							<input type="text" name="searchValue" class="form-control" id="autoSizingInput" value="${reviewVO.searchValue }">
						</div>
						<div class="col-3">
							<button type="submit" class="btn btn-primary" id="">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>