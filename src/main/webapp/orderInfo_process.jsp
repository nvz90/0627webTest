<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dto.ProductDTO" %>	
<%@ page import="dao.ProductDAO" %>
<%@ page import="dto.CartDTO" %>	
<%@ page import="dao.CartDAO" %>
<%@ page import="dao.OrderDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String userId = (String)session.getAttribute("userId");
	
	if(id == null) return;
	
	String name = request.getParameter("name");
	String deliveryDate = request.getParameter("deliveryDate");
	String country = request.getParameter("country");
	String zipCode = request.getParameter("zipCode");
	String address = request.getParameter("address");
	
	// 여기서 order테이블에 배송정보랑 장바구니테이블 넣을지
	//	orderInfo_process에서 order테이블에 넣을지
	
	OrderDAO Odao = OrderDAO.getInstance();
	
	
	response.sendRedirect("orderComplete.jsp");
	
	

%>