<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dto.ProductDTO" %>	
<%@ page import="dao.ProductDAO" %>

<%@ page import="dto.CartDTO" %>	
<%@ page import="dao.CartDAO" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보</title>
<style>
	.total{
		color: #dc3545;
	}
	#conta{
		background-color: #C8E3E5;
	}
	
</style>
</head>
<body>
<%! String title = "주문 정보";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class = "display-3">
				<%= title %>
			</h1>
		</div>
	</div>
	<%	
		request.setCharacterEncoding("utf-8");
	
		String userId = (String)session.getAttribute("userId");
		String id = request.getParameter("id");	//상품아이디
		
		String name = request.getParameter("name");
		String deliveryDate = request.getParameter("deliveryDate");
		String country = request.getParameter("country");
		String zipCode = request.getParameter("zipCode");
		String address = request.getParameter("address");
		
	%>
	<div id="conta" class="container">
		<div class="text-center"><h1>영수증</h1></div>
		<table width="100%">
			<tr>
				<td>배송 주소</td>
				<td align="right"><%=deliveryDate %></td>
			</tr>
			<tr>
				<td>성명:<%=name%></td>
			</tr>
			<tr>
				<td>우편번호:<%=zipCode%></td>
			</tr>
			<tr>
				<td>주소:<%=address %></td>
			</tr>
			<tr>
				<td>(<%=country%>)</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<th>상품</th>
				<th>수량</th>
				<th>가격</th>
				<th>소계</th>
			</tr>
				<%
				if(id.equals("0")){		// 장바구니에서 주문 시
					CartDAO Cdao = CartDAO.getInstance();

					ArrayList<CartDTO> cartList = Cdao.selectCart(userId);
					if(cartList==null) cartList = new ArrayList<CartDTO>();
					
					int sum = 0;
					int total = 0;
					for(int i=0; i<cartList.size(); i++){
						CartDTO cart = cartList.get(i);
						sum = cart.getPrice() * cart.getQuantity();
						total += sum;
				%>
			<tr>
				<td><%=cart.getProductId()%>-<%=cart.getPname()%></td>
				<td><%=cart.getQuantity()%></td>
				<td><%=cart.getPrice()%></td>
				<td><%=sum%></td>
			</tr>
				<%
					}
				%>
			<tr>
				<th></th>
				<th></th>
				<th><b>총액</b></th>
				<th class="total"><%=total%></th>
				<th></th>
			</tr>
				<% 
				}else{//상품상세보기에서 단일 주문시		
				
					ProductDAO Pdao = ProductDAO.getInstance();
					ProductDTO dto = Pdao.getProductById(id);
				%>	
				<tr>
					<td><%=dto.getProductId()%>-<%=dto.getPname()%></td>
					<td><%=1%></td>
					<td><%=dto.getUnitPrice()%></td>
					<td><%=1%></td>
				</tr>
				<tr>
					<th></th>
					<th></th>
					<th><b>총액</b></th>
					<th class="total"><%=dto.getUnitPrice()%></th>
					<th></th>
				</tr>
			<%
				}
			%>
			<tr>	
				<td>
					<a href="shippingInfo.jsp?id=<%=id%>" class="btn btn-secondary">이전</a>
					<a href="orderInfo_process.jsp?id=<%=id %>" class="btn btn-success">주문 완료</a>
					<a href="orderCancel.jsp" class="btn btn-secondary">취소</a>
				</td>
			</tr>
		</table>
		
		
	</div>
<%@ include file="footer.jsp"%>
</body>
</html>