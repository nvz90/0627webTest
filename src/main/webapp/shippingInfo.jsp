<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송정보</title>
</head>
<body>
	<%! String title = "배송 정보" ;
		%>
		<div class="jumbotron">
			<div class="container">
				<h1 class = "display-3">
						<%= title %>
				</h1>
			</div>
		</div>
		<%
			String id = request.getParameter("id");
		%>
		<div class="container">
		<form action="orderInfo.jsp?id=<%=id%>" name="formSI" method="post">
			<table>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name">	</td>	 	
				</tr>
				<tr>
					<th>배송일</th>
					<td><input type="text" name="deliveryDate"></td>
				</tr>
				<tr>
					<th></th>
					<td>(yyyy/mm/dd)</td>
				</tr>
				<tr>
					<th>국가명</th>
					<td><input type="text" name="country"></td>
				</tr> 
				 <tr>
					<th>우편번호</th>
					<td> <input type="text" name="zipCode"></td>
				</tr> 
				<tr>
					<th>주소</th>
					<td> <input type="text" name="address"></td>
				</tr> 
				<tr>
					<td>
						<%if(id.equals("0")){ %>
						<a href="cart.jsp" class ="btn btn-secondary">이전</a>
						<%}else{ %>
						<a href="product.jsp?id=<%=id%>" class="btn btn-secondary">이전</a>
						<%} %>
						<input type="button" class="btn btn-primary" value="등록" onclick="CheckShippingInfo()">
						<a href="products.jsp" class ="btn btn-secondary">취소</a>
						
					</td>
				</tr> 		
			</table>
			</form>	
		</div>
		<script>
			function CheckShippingInfo(){
				
				var form = document.formSI;
				
				// 입력란 빈칸 확인
				if(form.name.value==""){
					alert("성명 입력하세요");
					form.name.focus();
					return false;
				}else if(form.deliveryDate.value==""){
					alert("배송일 입력하세요");
					form.deliveryDate.focus();
					return false;
				}else if(form.country.value==""){
					alert("국가명 입력하세요");
					form.country.focus();
					return false;
				}else if(form.zipCode.value==""){
					alert("우편번호 입력하세요");
					form.zipCode.focus();
					return false;
				}else if(form.address.value==""){
					alert("주소 입력하세요");
					form.address.focus();
					return false;
				}
				
				var regExr = /^[가-힣]{2,5}$/;
				//한글 2~5글자 확인
				if(!regExr.test(form.name.value)){
					alert("2~5글자 한글만 입력");
					form.name.focus();
					return false
				}
				//배송일 yyyy/mm/dd
				regExr = /^\d{4}\/(0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[01])$/;
				if(!regExr.test(form.deliveryDate.value)){
					alert("예를 들어 2022/08/30 처럼 입력하세요");
					form.deliveryDate.focus();
					return false
				}
				//국가명
				regExr =  /^[가-힣]{2,12}$/;
				if(!regExr.test(form.country.value)){
					alert("국가명 2~12사이 입력하세요");
					form.country.focus();
					return false
				}
				//우편번호 
				regExr = /^\d{5}/;
				if(!regExr.test(form.zipCode.value)){
					alert("숫자 5개 입력하세요");
					form.zipCode.focus();
					return false
				}
				
				form.submit();
			}

		</script>
		
<%@ include file="footer.jsp"%>
</body>
</html>