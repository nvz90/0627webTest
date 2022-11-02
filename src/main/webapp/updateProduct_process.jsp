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

	
	ProductDAO dao = ProductDAO.getInstance();
	String Pid = multi.getParameter("Pid");
	ProductDTO dto = dao.getProductById(Pid);
	
	request.setCharacterEncoding("UTF-8");
	
	// null이면 기존 값
	String filename = multi.getFilesystemName(file); if(filename == null)filename = dto.getImageName();
	String pname = multi.getParameter("pname"); if(pname == null)pname = dto.getPname();
	String description = multi.getParameter("description"); if(description == null)description = dto.getDescription();
	String mnufacturer = multi.getParameter("mnufacturer"); if(mnufacturer == null)mnufacturer = dto.getMnufacturer();
	String category = multi.getParameter("category"); if(category == null)category = dto.getCategory();
	String condition = multi.getParameter("condition"); if(condition == null)condition = dto.getCondition();
	String imageName = multi.getParameter("imageName"); if(imageName == null)imageName = dto.getImageName();
	
	String unitPrice = multi.getParameter("unitPrice");
	String unitsInStock = multi.getParameter("unitsInStock");
	
	int caseted_unitPrice = unitPrice == null ? caseted_unitPrice = dto.getUnitPrice() : ( caseted_unitPrice = Integer.parseInt(unitPrice) );
	
	long caseted_unitsInStock = unitsInStock == null ? caseted_unitsInStock = dto.getUnitsInStock() : ( caseted_unitsInStock = Long.parseLong(unitsInStock) );
	
	System.out.println("상품명 " + pname );
	System.out.println("설명 " + description );
	System.out.println("제조사 " + mnufacturer );
	System.out.println("분류 " + category );
	System.out.println("상태 " + condition );
	System.out.println("이미지이름 " + filename );
	System.out.println("가격 " + unitPrice );
	System.out.println("재고수 " + unitsInStock );
	System.out.println("아이디 " + dto.getProductId() );
	
	//업데이트 메서드
	dao.updateProduct(dto.getProductId(), pname, caseted_unitPrice, description, 
					mnufacturer, category, caseted_unitsInStock, 
					condition, filename);
	
	response.sendRedirect("products.jsp");
%>