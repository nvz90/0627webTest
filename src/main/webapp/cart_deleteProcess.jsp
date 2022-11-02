<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dto.ProductDTO" %>	
<%@ page import="dao.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="dto.CartDTO"%>
<%@ page import="dao.CartDAO" %>

<%
	CartDAO dao = CartDAO.getInstance();
	String id = request.getParameter("id");
	String userId = (String)session.getAttribute("userId");
	
	if(id.equals("0")){
		dao.deleteAllCart(userId);
	}else{
		dao.deleteCart(id, userId);
	}
	response.sendRedirect("cart.jsp");
%>