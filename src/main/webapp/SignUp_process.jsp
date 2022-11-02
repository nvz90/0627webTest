<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");	

	String id = request.getParameter("id");
	String pw1 = request.getParameter("pw1");
	String pw2 = request.getParameter("pw2");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String phoneNum = request.getParameter("phoneNum");
	String address = request.getParameter("address");
										
	String birthday = year + "-" + month + "-" + day;
	String email = email1+"@"+email2;
					
	System.out.println(birthday);
	System.out.println(email);
%>
<sql:setDataSource var="dataSource"
						url="jdbc:mysql://localhost:3306/jspwebmarket"
						driver="com.mysql.jdbc.Driver"
						user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
	INSERT INTO MEMBER2(id,pass,name,gender,birthday,email,phoneNum,address) VALUES (?,?,?,?,?,?,?,?)
		<sql:param value="<%=id %>"/>
		<sql:param value="<%=pw1 %>"/>
		<sql:param value="<%=name %>"/>
		<sql:param value="<%=gender %>"/>
		<sql:param value="<%=birthday %>"/>
		<sql:param value="<%=email %>"/>
		<sql:param value="<%=phoneNum %>"/>
		<sql:param value="<%=address %>"/>
</sql:update>
<c:import var="url" url="Login.jsp" />
${url}	<!-- 저장 후 사용가능 -->
</body>
</html>
