<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
    font-family: 'NanumBarunpen';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumBarunpen.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.footerContainer{
	border:1px solid #e0e0e0;
	background-color:#f7f7f7;
	height:450px;
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
	border:1px solid #e0e0e0;
	height:380px;
}
.footerInfoLayout{
	border:1px solid #f7f7f7;
	background-color:#f7f7f7;
	margin:0 auto;
	height:100%;
	text-align:center;
}
.footerInfoSNS{
	border:1px solid #f7f7f7;
	height:40px;
	margin:0 auto;
	margin-top:10px;
	color:#666666;
}
.footerInfoSNS2{
	border:1px solid #f7f7f7;
	height:80px;
	margin:0 auto;
	color:#666666;
	font-size:17px;
}
.footerInfoSNS2 >ul >li{
	border:1px solid #f7f7f7;
	display:inline-block;
	width:160px;
	height:80px;
	
}
.snsImgBox{
	border:1px solid #f7f7f7;
	width:50px;
	height:50px;
	margin:0 auto;
	margin-top:10px;
	cursor:pointer;
}
.bannerBox{
	margin:0 auto;
	border:1px solid #f7f7f7;
}
.bannerImg{
	border:1px solid #f7f7f7;
	width:180px;
	height:90px;
	border-radius: 5px;
	display:inline-block;
	margin-right:10px;
	cursor:pointer;
}
.personalInfo{
	border:1px solid #f7f7f7;
	height:50px;
	margin:0 auto;
	font-family: 'NanumBarunpen';
	font-size:15px;
	margin-top:10px;
}
.personalInfo > ul > li{
	border:1px solid #f7f7f7;
	font-family: 'NanumBarunpen';
	font-size:15px;
	width:150px;
	height:30px;
	position:relative;top:10px;
	cursor:pointer;
}
</style>
</head>
<body>
	<div class="footerContainer">
		<div class="col-12 footerViewListContainer">
			<div class="col-8 footerViewList">
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
					<div class="col-12">
						<div class="col-10 bannerBox">
							<div class="bannerImg">
								<img src="/resources/images/banner_1.jpg" class="bannerImg">
							</div>
							<div class="bannerImg">
								<img src="/resources/images/banner_2.jpg" class="bannerImg">
							</div>
							<div class="bannerImg">
								<img src="/resources/images/banner_3.jpg" class="bannerImg">
							</div>
							<div class="bannerImg">
								<img src="/resources/images/banner_4.jpg" class="bannerImg">
							</div>
							<div class="bannerImg">
								<img src="/resources/images/banner_5.jpg" class="bannerImg">
							</div>
						</div>
					</div><!--bannerBox col-12 -->
					<div class="col-12">
						<div class="col-10 personalInfo">
							<ul>
								<li>개인정보처리방침</li>
								<li>이용약관</li>
								<li>저작권정책</li>
								<li>고객 서비스</li>
								<li>전자우편서비스거부</li>
								<li>Q&A</li>
							</ul>
						</div>
					</div>
					<div class="col-12">
						<div class="col-10 personalInfo">
						우)우편번호 입력 울산광역시 남구 돋질로 233 (달동, 세부주소입력) TEL:000-0000 사업자:이름입력<br>
						회사정보 및 개인정보보호를 표시하는 구역입니다.
						</div>
					</div>
				</div>
			</div>
			
				
			
				

		</div><!-- footerInfoContainer -->
	</div>

</body>
</html>