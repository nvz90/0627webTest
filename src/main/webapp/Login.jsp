<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String id = (String)session.getAttribute("userId"); // java -> jstl 변수공유하기위함
	pageContext.setAttribute("id", id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class = "display-3">로그인</h1>
		</div>
	</div>
	<div class="container">
		<!-- 세션에 id 없을시 (JSTL태그 안에 주석달면 에러뜸) -->
		<c:choose>
			<c:when test="${id == null}">
			<script>
				function validateForm(form){
					if(!form.id.value){
						alert('아이디를 입력하세요');
						return false;
					}
					if(form.pw.value==""){
						alert("패스워드를 입력하세요");
						return false;
					}
				}
			</script>
				<form style="display: flex;justify-content: center;" action="Login_process.jsp" onsubmit="return validateForm(this);"> 
					<table>
						<tr>
							<td><h3 style="align:center;">Please sign in</h3></td>
						</tr>
						<tr>
							<td><input type="text" name="id" placeholder="ID"></td>
						</tr>
						<tr>
							<td><input type="password" name="pw" placeholder="PassWord"></td>
						</tr>
						<tr>
							<td>
								<span style="color : red ; font-size : 15px;">
								<%=request.getAttribute("LoginErrMsg") == null ?
								"" : request.getAttribute("LoginErrMsg")%>
								</span>
							</td>
						</tr>
						<tr>
							<td><input type="submit" value="로그인" class="btn btn-success" style="width:100%;"></td>
						</tr>
					</table>
				</form>
			</c:when>
			<c:otherwise>
				<jsp:forward page="welcome.jsp"/>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>