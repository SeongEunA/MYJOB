<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.weatherContainer{
border:1px solid white;
width:200px;
height:400px;
display:flex;
flex-direction:row;
}

.weatherBox{
border:1px solid white;
width:400px;
height:400px;
display:flex;
}

 .weatherDiv{
border:1px solid white;
width:100%;
height:100%;
flex-direction:column;
text-align:center;
} 
.weatherDay{
border:1px solid #eeeeee;
width:100%;
height:15%;
border-radius:5px;
display:flex;


}
.weatherDayHeader{
border:1px solid white;
height:100%;
width:20%;
display:flex;
align-items: center;

}
.weatherContent{
border:1px solid white;
width:80%;
height:100%;
flex-direction:row;
display:flex;
align-items: center;

}
.weatherDayNum{
display:block;
border:1px solid white;
width:100%;
height:60%;
font-size:12px;
} 


.weatherSkyStatus{
width:60%;
height:100%;
flex-direction:row;
border:1px solid white;

}
.weatherSkyStatus2{
width:40%;
height:100%;
flex-direction:row;
border:1px solid white;


}
.weatherSkyStatusImg{
border:1px solid white;
width:40%;
height:50%;
margin:0 auto;


}
.weatherSkyStatusImg2{
border:1px solid white;
width:80%;
height:50%;
margin:0 auto;

}
.weatherSkyStatusText{
border:1px solid white;
flex-direction:column;
width:40%;
height:20%;
font-size:13px;
margin:0 auto;
}
.weatherSkyStatusText2{
border:1px solid white;
flex-direction:column;
width:100%;
height:30%;
margin:0 auto;
font-size:11px;
}
.weatherTemp{
border:1px solid white;
width:35%;
height:60%;
font-size:15px;
color:red;	
}
.weatherTemp > span{

font-size:13px;
color:blue;	
}
</style>


</head>


<body>
<!-- 날씨영역 -->
<!-- 은아 10/23 테이블 작업 -->
	<div class="weatherContainer">
	<div class="weatherBox" id="weather">
		<div class="weatherDiv">
		<c:forEach begin="0" end="9" var="i">
			<div class="weatherDay">
				<div class="weatherDayHeader">
					<div class="weatherDayNum">
						<div>Day${i+1 }</div>
						<div>${arrDate[i] }</div>
					</div>	
						
				</div>
				<c:if test="${i<3 }">
				<div class="weatherContent">
					<div class="weatherSkyStatus2">
						<div class="weatherSkyStatusImg2">
						
							<c:if test="${weatherShortList[i+i].skyStatus eq '맑음'}">
								<img src="http://openweathermap.org/img/wn/01d@2x.png" width="100%" height="80%">
							</c:if>
							<c:if test="${weatherShortList[i+i].skyStatus eq '구름많음'}">
								<img src="http://openweathermap.org/img/wn/03d@2x.png" width="100%" height="80%">
							</c:if>
							<c:if test="${weatherShortList[i+i].skyStatus eq '흐림'}">
								<img src="http://openweathermap.org/img/wn/04d@2x.png" width="100%" height="80%">
							</c:if>
							<c:if test="${weatherShortList[i+i].skyStatus eq '구름많고 한때 비'}">
								<img src="http://openweathermap.org/img/wn/09d@2x.png" width="100%" height="80%">
							</c:if>
						</div>
						<div class="weatherSkyStatusText2">
							오전:${weatherShortList[i+i].skyStatus }
						</div>
					</div>
					<div class="weatherSkyStatus2">
						<div class="weatherSkyStatusImg2">
						
							<c:if test="${weatherShortList[i+i+1].skyStatus eq '맑음'}">
								<img src="http://openweathermap.org/img/wn/01d@2x.png" width="100%" height="80%">
							</c:if>
							<c:if test="${weatherShortList[i+i+1].skyStatus eq '구름많음'}">
								<img src="http://openweathermap.org/img/wn/03d@2x.png" width="100%" height="80%">
							</c:if>
							<c:if test="${weatherShortList[i+i+1].skyStatus eq '흐림'}">
								<img src="http://openweathermap.org/img/wn/04d@2x.png" width="100%" height="80%">
							</c:if> 
							<c:if test="${weatherShortList[i+i+1].skyStatus eq '구름많고 한때 비'}">
								<img src="http://openweathermap.org/img/wn/09d@2x.png" width="100%" height="80%">
							</c:if>
						</div>
						<div class="weatherSkyStatusText2">
							오후:${weatherShortList[i+i+1].skyStatus }
						</div>
					</div>
					<div class="weatherTemp">
						<span>
							${weatherShortList[i+i].temp }&deg;</span>/${weatherShortList[i+i+1].temp }&deg;
					</div>
				</div>
				</c:if>
				<c:if test="${i>=3 }">
				<div class="weatherContent">
					<div class="weatherSkyStatus2">
						<div class="weatherSkyStatusImg2">
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusAm eq '맑음'}">
							<img src="http://openweathermap.org/img/wn/01d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusAm eq '구름많음'}">
							<img src="http://openweathermap.org/img/wn/03d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusAm eq '흐리고 비'}">
							<img src="http://openweathermap.org/img/wn/10d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusAm eq '구름많고 비'}">
							<img src="http://openweathermap.org/img/wn/09d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusAm eq '구름많고 눈'}">
							<img src="http://openweathermap.org/img/wn/13d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusAm eq '구름많고 비/눈'}">
							<img src="http://openweathermap.org/img/wn/09d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusAm eq '구름많고 소나기'}">
							<img src="http://openweathermap.org/img/wn/09d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusAm eq '흐림'}">
							<img src="http://openweathermap.org/img/wn/04d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusAm eq '흐리고 눈'}">
							<img src="http://openweathermap.org/img/wn/13d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusAm eq '흐리고 비/눈'}">
							<img src="http://openweathermap.org/img/wn/09d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusAm eq '흐리고 소나기'}">
							<img src="http://openweathermap.org/img/wn/10n@2x.png" width="100%" height="80%">
						</c:if>
						</div>
						<div class="weatherSkyStatusText2">
							오전:${weatherLongSkyStatusList[i-2].skyStatusAm }
						</div>					
					</div>
					<div class="weatherSkyStatus2">
						<div class="weatherSkyStatusImg2">
							<c:if test="${weatherLongSkyStatusList[i-2].skyStatusPm eq '맑음'}">
							<img src="http://openweathermap.org/img/wn/01d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusPm eq '구름많음'}">
							<img src="http://openweathermap.org/img/wn/03d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusPm eq '흐리고 비'}">
							<img src="http://openweathermap.org/img/wn/10d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusPm eq '구름많고 비'}">
							<img src="http://openweathermap.org/img/wn/09d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusPm eq '구름많고 눈'}">
							<img src="http://openweathermap.org/img/wn/13d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusPm eq '구름많고 비/눈'}">
							<img src="http://openweathermap.org/img/wn/09d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusPm eq '구름많고 소나기'}">
							<img src="http://openweathermap.org/img/wn/09d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusPm eq '흐림'}">
							<img src="http://openweathermap.org/img/wn/04d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusPm eq '흐리고 눈'}">
							<img src="http://openweathermap.org/img/wn/13d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusPm eq '흐리고 비/눈'}">
							<img src="http://openweathermap.org/img/wn/09d@2x.png" width="100%" height="80%">
						</c:if>
						<c:if test="${weatherLongSkyStatusList[i-2].skyStatusPm eq '흐리고 소나기'}">
							<img src="http://openweathermap.org/img/wn/10n@2x.png" width="100%" height="80%">
						</c:if>
						</div>
						<div class="weatherSkyStatusText2">
							오후:${weatherLongSkyStatusList[i-2].skyStatusPm }	
						</div>
					</div>
					<div class="weatherTemp">
						<span>${weatherLongList[i-2].minTemp }&deg;</span>/${weatherLongList[i-2].maxTemp }&deg;
					</div>
				</div>
				</c:if>
			</div>
			</c:forEach>
		</div><!-- weatherDiv1 -->
		
	
	</div><!--weatherContainer-->


</div><!--weatherContainer-->



</body>
</html>