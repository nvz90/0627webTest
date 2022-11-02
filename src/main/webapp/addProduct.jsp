<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<style>
	p{
		
	}
	
</style>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class = "display-3">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<form action="addProduct_process.jsp" name="formPA" method="post" enctype="multipart/form-data">
			<table style=" border-collapse: separate;border-spacing: 0 10px;">
				<tr>
					<td>상품코드</td>
					<td>
						<input type="text" name="productId">
					</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td>
						<input type="text" name="pname">
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
						 <input type="text" name="unitPrice">
					</td>
				</tr>
				<tr>
					<td>상세정보</td>
					<td>
						<input type="text" name="description">
					</td>
				</tr>
				<tr>
					<td>제조사</td>
					<td>
						<input type="text" name="mnufacturer">
					</td>
				</tr>
				<tr>
					<td>분류</td>
					<td>
						<input type="text" name="category">
					</td>
				</tr>
				<tr>
					<td>재고 수</td>
					<td>
						<input type="text" name="unitsInStock">
					</td>
				</tr>
				<tr>
					<td>상태</td>
					<td>
						신규 제품
						<input type="radio" name="condition" value="new">
						중고 제품
						<input type="radio" name="condition" value="used">
						재생 제품
						<input type="radio" name="condition" value="restore">
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
						<input type="button" value="등록" onclick="CheckAddProduct()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		function CheckAddProduct(){
			var regExr = /^P\d{4,11}/
			//var str = document.formPA.codeProduct.value;
			//var result = regExr.exec(str)
			//console.log(result)			
			
			var form = document.formPA;
			
			// 입력란 빈칸 확인
			if(form.productId.value==""){
				alert("상품코드 입력하세요");
				form.productId.focus();
				return false;
			}else if(form.pname.value==""){
				alert("상품명 입력하세요");
				form.pname.focus();
				return false;
			}else if(form.unitPrice.value==""){
				alert("상품가격 입력하세요");
				form.unitPrice.focus();
				return false;
			}else if(form.unitsInStock.value==""){
				alert("재고 수 입력하세요");
				form.unitsInStock.focus();
				return false;
			}
			// 상품코드 첫 글자 P인지 확인 And 글자길이 확인
			var arr = [...form.productId.value]
			if(arr[0] != "P" ){
				alert("상품코드 첫 글자는 P로 시작하세요");
				form.productId.focus();
				return false;
			}else if(arr.length > 12){
				alert("상품코드 글자길이는 5~12까지 입니다.");
				form.productId.focus();
				return false;
			}else if(arr.length < 5){
				alert("상품코드 글자길이는 5~12까지 입니다.");
				form.productId.focus();
				return false;
			}
			// 상품코드 첫 글자 이후 숫자인지 확인
			for(var i=1; i<arr.length; i++){
				if(isNaN(arr[i])){
					alert("상품코드는 P와 숫자로 조합하세요");
					form.productId.focus();
					return false;
				}
			}
			//상품명 글자길이 확인
			arr = [...form.pname.value]
			if(arr.length > 12){
				alert("상품명 글자길이는 5~12까지 입니다.");
				form.pname.focus();
				return false;
			}else if(arr.length < 4){
				alert("상품명 글자길이는 5~12까지 입니다.");
				form.pname.focus();
				return false;
			}
			//재고수 숫자인지 확인
			arr = [...form.unitsInStock.value]
			for(var i=0; i<arr.length; i++){
				if(isNaN(arr[i])){
					alert("재고수는 숫자만 입력하세요");
					form.unitsInStock.focus();
					return false;
				}
			}
			//상품가격 양수, 숫자, 소숫점 2자리까지 확인	
			if(!/^(\d*)[\.]?(\d{1,2})?$/g.test(form.unitPrice.value)){
				alert("양수이고, 소수점 둘째 자리까지 입력하세요");
				form.unitPrice.focus();
				return false
			}
			
			form.submit();			
		}
	</script>
	
<%@ include file="footer.jsp"%>
</body>
</html>