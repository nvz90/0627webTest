<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dto.ProductDTO" %>	
<%@ page import="dao.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="head.jsp" %>
<!DOCTYPE html>

<html>
<head>
<title>상품 목록</title>
<meta charset="UTF-8">
</head>

<body>
	<%! String title = "상품 목록" ;
	%>
	<div class="jumbotron">
			<div class="container">
				<h1 class = "display-3">상품 목록</h1>
			</div>
		</div>
	
	<%
		ProductDAO dao = ProductDAO.getInstance();
		ArrayList<ProductDTO> listOfProducts = dao.getAllProducts();
	%>
	<div class=container>
		<div class="row" align="center">
			<%
				String Pcrud = request.getParameter("Pcrud");
				for(int i = 0; i < listOfProducts.size(); i++){
					ProductDTO product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
			<img src=".\img\<%=product.getImageName()%>"
				style="width:100%">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><%=product.getUnitPrice() %>원
				
				<p><%if(Pcrud == null){%>
					<a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary">상세 정보 &raquo;</a>
				<%}else if(Pcrud.equals("1")){%>
					<a href="./updateProduct.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary">상세 수정 &raquo;</a>
				<%}else if(Pcrud.equals("2")){%>
					<a href="./deleteProduct.jsp?id=<%=product.getProductId()%>" onclick = "return ClickDelete();" class="btn btn-secondary">상세 삭제 &raquo;</a>
				<%}%>
			</div>
			<%
				}
			%>
		</div>
		<p> <a href="addProduct.jsp"class="btn btn-secondary">상품등록</a>
	</div>
<%@ include file="footer.jsp"%>
</body>
<script>
	function ClickDelete(){
		return confirm("상품 삭제하십니까?");
	}
</script>
</html>