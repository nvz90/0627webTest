<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%> <%--시간출력양식정하기 --%>
<%@ page import="java.util.Locale"%>	<%--언어,나라 설정 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to Web Market!</title>
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
	.nowtime{
		color: gray;
	}
</style>
</head>
<body>

	<%! String greeting = "웹 쇼핑몰에 오신 것을 환영합니다" ;
		String tagline = "Welcome to Web Market!";
	%>
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a", new Locale("en", "US"));
		
		Date nowTime = new Date();

	%>
	
	<div class="jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>
		</div>
	</div>
	
	<div class = "container">
		<div class = "text-center">
			<h3>
				<%= tagline %>
			</h3>
		</div>
	</div>
	<div class = "container">
		<div class = "text-center">
			<h6 class = "nowtime">
				현재 접속 시각 <%= sdf.format(nowTime) %>
			</h6>
		</div>
	</div>
	

</body>
</html>
<%@ include file="footer.jsp"%>