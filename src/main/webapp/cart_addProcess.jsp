<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDTO"%>
<%@ page import="dao.ProductDAO" %>
<%@page import="dto.CartDTO"%>
<%@ page import="dao.CartDAO" %>

	<%
		String userId = (String)session.getAttribute("userId");
		
		if(userId ==  null){
			response.sendRedirect("products.jsp");
		
		}else{
			String id = request.getParameter("id");
			ProductDAO pDAO = ProductDAO.getInstance();	
			ProductDTO product = pDAO.getProductById(id);	//id에 해당하는 제품
			CartDAO cDAO = CartDAO.getInstance();
			
			ArrayList<CartDTO> cartList = cDAO.selectCart(userId);
			
			int count = 0;
			if(!cartList.isEmpty()){	// cartList null일때 굳이 돌릴 필요X
				for(int i=0; i<cartList.size(); i++){
					if(cartList.get(i).getProductId().equals(id)){	// 장바구니에 이미 해당상품 있을시 수량 1만 더하기
						cDAO.updateCart(id, userId); // 장바구니에 상품추가 초기에는 수량, 서브토탈 1로 초기화
						count+=1;
					}
				}
			}
			
			if(count == 0)cDAO.addCart(userId, product.getProductId(), product.getPname(), product.getUnitPrice(), 1, 1);
			response.sendRedirect("cart.jsp");
		}
	%>
