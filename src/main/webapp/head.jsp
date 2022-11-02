<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
	#navbar-brand{
		font-size: 15px;
	}
</style>
</head>
<body>
	<nav class = "navbar navbar-expand navbar-dark bg-dark">	
		<div class = "container">
			<div class ="navbar-header">
				<a class = "navbar-brand" href="./welcome.jsp">Home</a>
			</div>
			<div>
				<%if(session.getAttribute("userId")== null){ %>
					<a id = "navbar-brand" class = "navbar-brand" href="Login.jsp">로그인</a>
					<a id = "navbar-brand" class = "navbar-brand" href="SignUp.jsp">회원가입</a>
				<%}else{ %>
					<span style="color:#AFAFAF; font-size: 1rem;"><%=session.getAttribute("userId")%>님 &nbsp;</span>
					<a id = "navbar-brand" class = "navbar-brand" href="Logout.jsp">로그아웃</a>
					<a id = "navbar-brand" class = "navbar-brand" href="addProduct.jsp">상품 등록</a>
					<a id = "navbar-brand" class = "navbar-brand" href="products.jsp?Pcrud=<%=1%>">상품 수정</a> 	<!-- num == 1 일시 수정 -->
					<a id = "navbar-brand" class = "navbar-brand" href="products.jsp?Pcrud=<%=2%>">상품 삭제</a>	<!-- num == 2 일시 삭제 -->
					<a id = "navbar-brand" class = "navbar-brand" href="cart.jsp">장바구니</a>
				<%} %>
				<a id = "navbar-brand" class = "navbar-brand" href="products.jsp">상품 목록</a>
			</div>
		</div>
	</nav>
</body>
</html>