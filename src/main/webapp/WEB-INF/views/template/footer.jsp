<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.footerContainer{
	border:1px solid black;
	background-color:white;
	height:500px;
	width:auto;
}
.footerViewListContainer{
	border:1px solid #f0f0f0;
	height:70px;
	background-color:#f0f0f0;
}
.footerViewList{
	border:1px solid #f0f0f0;
	margin:0 auto;
	height:100%;
}
.footerInfoContainer{
	border:1px solid black;
	height:430px;
}
.footerInfoLayout{
	border:1px solid #f7f7f7;
	background-color:#f7f7f7;
	margin:0 auto;
	height:100%;
	text-align:center;
}
.footerInfoSNS{
	border:1px solid black;
	height:40px;
	margin:0 auto;
}
.footerInfoSNS2{
	border:1px solid black;
	height:100px;
	margin:0 auto;

}
.footerInfoSNS2 >ul >li{
	border:1px solid #f7f7f7;
	display:inline-block;
	width:160px;
	height:100px;
	
}
.snsImgBox{
	border:1px solid #f7f7f7;
	width:50px;
	height:50px;
	margin:0 auto;
	margin-top:10px;
	cursor:pointer;
}
</style>
</head>
<body>
	<div class="footerContainer">
		<div class="col-12 footerViewListContainer">
			<div class="col-8 footerViewList">
				footer내용을 입력하세요
			</div>
		</div>
		<div class="col-12 footerInfoContainer">
			<div class="col-8 footerInfoLayout">
				<div class="footerInfoSNS">
					<img src="/resources/images/ico_footer_sns.png" style="vertical-align:sub;">&nbsp; 여행가고싶어요를 SNS에서 만나보세요!
				</div>
				<div class="footerInfoSNS2">
					<ul>
						<li>
							<div>블로그</div>
							<div class="snsImgBox"><img src="/resources/images/ico_sns1.png" width="100%" height="100%"></div>
						</li>
						<li>
							<div>포스트</div>
							<div class="snsImgBox"><img src="/resources/images/ico_sns2.png" width="100%" height="100%"></div>
						</li>
						<li>
							<div>페이스북</div>
							<div class="snsImgBox"><img src="/resources/images/ico_sns3.png" width="100%" height="100%"></div>
						</li>
						<li>
							<div>카카오스토리</div>
							<div class="snsImgBox"><img src="/resources/images/ico_sns5.png" width="100%" height="100%"></div>
						</li>
						<li>
							<div>유튜브</div>
							<div class="snsImgBox"><img src="/resources/images/ico_sns06.png" width="100%" height="100%"></div>
						</li>
						<li>
							<div>인스타그램</div>
							<div class="snsImgBox"><img src="/resources/images/ico_sns7.png" width="100%" height="100%"></div>
						</li>
					</ul>
				</div>
			</div>
			
				

		</div><!-- footerInfoContainer -->
	</div>

</body>
</html>