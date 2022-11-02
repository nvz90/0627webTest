<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
<%@ page import = "dto.ProductDTO" %>
<%@ page import = "dao.ProductDAO" %>
<%
	String Pid = request.getParameter("id");
	System.out.println(Pid);
	ProductDAO dao = ProductDAO.getInstance();
	ProductDTO dto = dao.getProductById(Pid);
	System.out.println("22" + dto.getCategory());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class = "display-3">상품 수정</h1>
		</div>
	</div>
	<div class="container">
		<div class="col-md-4">
			<img src=".\img\<%=dto.getImageName()%>" style="width:100%">
		</div>
		<form action="updateProduct_process.jsp?Pid=<%=Pid%>" name="formPU" method="post" enctype="multipart/form-data">
			<table style=" border-collapse: separate;border-spacing: 0 10px;">
				<tr>
					<td>상품코드 : </td>
					<td>
						<%=dto.getProductId() %>
					</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td>
						<input type="text" name="pname" value="<%=dto.getPname()%>">
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
						 <input type="text" name="unitPrice" value="<%=dto.getUnitPrice()%>">
					</td>
				</tr>
				<tr>
					<td>상세정보</td>
					<td>
						<input type="text" name="description" value="<%=dto.getDescription()%>">
					</td>
				</tr>
				<tr>
					<td>제조사</td>
					<td>
						<input type="text" name="mnufacturer" value="<%=dto.getMnufacturer()%>">
					</td>
				</tr>
				<tr>
					<td>분류</td>
					<td>
						<input type="text" name="category" value="<%=dto.getCategory()%>">
					</td>
				</tr>
				<tr>
					<td>재고 수</td>
					<td>
						<input type="text" name="unitsInStock" value="<%=dto.getUnitsInStock()%>">
					</td>
				</tr>
				<tr>
					<td>상태</td>
					<td>
						<%
							if(dto.getCondition().equals("new")){
						%>
							신규 제품
							<input type="radio" name="condition" value="new" checked>
							중고 제품
							<input type="radio" name="condition" value="used">
							재생 제품
							<input type="radio" name="condition" value="restore">
						<%
							}else if(dto.getCondition().equals("used")){
						%>
							신규 제품
							<input type="radio" name="condition" value="new">
							중고 제품
							<input type="radio" name="condition" value="used" checked>
							재생 제품
							<input type="radio" name="condition" value="restore">
						<%
							}else if(dto.getCondition().equals("restore")){
						%>
							신규 제품
							<input type="radio" name="condition" value="new">
							중고 제품
							<input type="radio" name="condition" value="used">
							재생 제품
							<input type="radio" name="condition" value="restore" checked>
						<%} %>
					</td>
				</tr>
				<tr>
					<td>이미지</td>
					<td>
						<input type="file" name="imageName">
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="등록" onclick="CheckUpdateProduct()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		function CheckUpdateProduct(){
			var regExr = /^P\d{4,11}/			
			var form = document.formPU;
	
			if(form.pname.value != ""){		//입력시 유효성검사 실행
				//상품명 글자길이 확인
				arr = [...form.pname.value]
				if(arr.length > 12){
					alert("상품명 글자길이는 5~12까지 입니다.");
					form.pname.focus();
					return false;
				}else if(arr.length < 5){
					alert("상품코드 글자길이는 5~12까지 입니다.");
					form.productId.focus();
					return false;
				}
			}else if(form.unitPrice.value !=""){
				//상품가격 양수, 숫자, 소숫점 2자리까지 확인	
				if(!/^(\d*)[\.]?(\d{1,2})?$/g.test(form.unitPrice.value)){
					alert("양수이고, 소수점 둘째 자리까지 입력하세요");
					form.unitPrice.focus();
					return false
				}
			}else if(form.unitsInStock.value !=""){
				//재고수 숫자인지 확인
				arr = [...form.unitsInStock.value]
				for(var i=0; i<arr.length; i++){
					if(isNaN(arr[i])){
						alert("재고수는 숫자만 입력하세요");
						form.unitsInStock.focus();
						return false;
					}
				}
			}
			form.submit();			
		}
	</script>
	
<%@ include file="footer.jsp"%>
</body>

</body>
</html>