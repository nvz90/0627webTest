<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dto.ProductDTO" %>	
<%@ page import="dao.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보</title>

<style>
	.buy{
		color:white;
		background:#4BBDDC;
		padding:5px;
	}
	.cart{
		color:black;
		background:#f3c73c;
		padding:5px;
	}
	.list{
		color:white;
		background:#4D4D4D;
		padding:5px;
	}
	.product{
		padding:5px;
	}
	#pName{
		background-color:#dc3545;;
		display: inline;
		color: white;
		white-space:nowrap;
	}
</style>
</head>
<body>
	<%! String title = "상품 정보" ;
		%>
		
		<div class="jumbotron">
			<div class="container">
				<h1 class = "display-3">
						<%= title %>
				</h1>
			</div>
		</div>
		<%
			ProductDAO dao = ProductDAO.getInstance();
			String id = request.getParameter("id");
			ProductDTO product = dao.getProductById(id);
		%>
		<div class="container">
				<div class="col-md-5">
						<img src=".\img\<%=product.getImageName()%>"
						style="width:100%">
						<h4>
							<%=product.getPname()%>
						</h4>
							<%=product.getDescription()%>
						<p>
							<b>상품 코드:</b>
							<b id="pName">
								<%=product.getProductId()%>
							</b>
						<p>
							<b>제조사:</b>
							<%=product.getMnufacturer()%>
						<p>
							<b>분류:</b>
							<%=product.getCategory()%>
						<p>
							<b>재고 수:</b>
							<%=product.getUnitsInStock()%>
						<p>	
							<h4><%=product.getUnitPrice()%>원</h4>
					<div class="product">
						<a href="shippingInfo.jsp?id=<%=product.getProductId()%>" class="buy"><b>상품주문</b></a>
						<a href="cart_addProcess.jsp?id=<%=product.getProductId()%>" class="cart"><b>장바구니</b></a>
						<a href="products.jsp" class="list"><b>상품 목록</b></a>
					</div>
				</div>
			<%@ include file="footer.jsp"%>
		</div>
</body>
</html>