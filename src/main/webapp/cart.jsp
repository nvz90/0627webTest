<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="dto.CartDTO" %>
<%@ page import="dao.CartDAO" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<style>
	.container{
		justify-content: center;
	}
	.delete{
		background-color:#be2e22;
		display: inline;
		color: white;
		white-space:nowrap;
	}	
</style>
</head>
<body>
	<%! String title = "장바구니";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class = "display-3">
				<%= title %>
			</h1>
		</div>
	</div>
	<div class="container">
		<table width="100%">
			<tr>
				<td>
					<a href="cart_deleteProcess.jsp?id=0" class="btn btn-danger"><b>전체삭제하기</b></a>
				</td>
				<td align="right">
					<a href="shippingInfo.jsp?id=0" class="btn btn-success" onclick="return CheckCart();">주문하기</a>
				</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
			<%
				String id = (String)session.getAttribute("userId");
			
				CartDAO dao = CartDAO.getInstance();
				ArrayList<CartDTO> cartList = dao.selectCart(id);
		
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
				<td><%=cart.getPrice()%></td>
				<td><%=cart.getQuantity()%></td>
				<td><%=sum%></td>
				<td><a href="cart_deleteProcess.jsp?id=<%=cart.getProductId()%>" class="delete"><b>삭제</b></a></td>
			</tr>
			<%
				}
			%>
			<tr>
				<th></th>
				<th></th>
				<th><b>총액</b></th>
				<th><%=total%></th>
				<th></th>
			</tr>
		</table>
		<a href="products.jsp" class="btn btn-secondary">&lArr;쇼핑 계속하기</a>
	</div>
<%@ include file="footer.jsp"%>
</body>
<script>
	function CheckCart(){	// 장바구니 비어있으면 주문X
		<%if(cartList.isEmpty()){%>
		alert('장바구니가 비어있습니다');
		return false;
		<%}else{%>
		return true;
		<%}%>
	}
</script>
</html>