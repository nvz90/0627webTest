<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dto.ProductDTO" %>	
<%@ page import="dao.ProductDAO" %>

<%@ page import = "com.oreilly.servlet.*" %>	<!--파일업로드 MultipartRequest -->
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>				<!--여기까지 -->

	<%
		MultipartRequest multi = new MultipartRequest(request,
				"D:\\Java\\eclipse-workspace\\WEBMarket\\src\\main\\webapp\\img",
				5 * 1024 * 1024,"utf-8", new DefaultFileRenamePolicy());
			
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement();
		String filename = multi.getFilesystemName(file);
		
		request.setCharacterEncoding("UTF-8");
		
		ProductDAO dao = ProductDAO.getInstance();
		String productId = multi.getParameter("productId");
		String pname = multi.getParameter("pname");
		String unitPrice = multi.getParameter("unitPrice");
		Integer casted_unitPrice = Integer.parseInt(unitPrice);
		String description = multi.getParameter("description");
		String mnufacturer = multi.getParameter("mnufacturer");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		long casted_unitsInStock = Long.parseLong(unitsInStock);
		String condition = multi.getParameter("condition");
		
		//System.out.println(filename);
		
		String userId = (String)session.getAttribute("userId");
		
		dao.addProduct(productId, pname, casted_unitPrice,
						description, mnufacturer, category,
						casted_unitsInStock, condition, filename, userId); 
		//dao.close();
		
		response.sendRedirect("products.jsp");
	
	%>