<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "dto.ProductDTO" %>
<%@ page import = "dao.ProductDAO" %>
<%
	String Pid = request.getParameter("Pid");
	System.out.println(Pid);
	ProductDAO dao = ProductDAO.getInstance();
	dao.deleteProduct(Pid);
	response.sendRedirect("products.jsp?");
%>