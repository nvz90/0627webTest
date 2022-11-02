<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class = "display-3">회원가입</h1>
		</div>
	</div>
	<div class="container">
		<form action="SignUp_process.jsp" name="formL" method="post">
			<table style=" border-collapse: separate;border-spacing: 0 10px;">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw1"></td>
				</tr>
				<tr>
					<td>비밀번호 재확인</td>
					<td><input type="password" name="pw2"></td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						남
						<input type="radio" name=gender value="man">
						여
						<input type="radio" name="gender" value="woman">
					</td>
				</tr>
				<tr>
					<td>생일</td>
					<td>
						<input type="text" name="year" style="width:30%;">
						<select name="month">
			             	<option value="1">1</option> 
			                <option value="2">2</option>
			                <option value="3">3</option> 
			                <option value="4">4</option>
			                <option value="5">5</option> 
			                <option value="6">6</option>
			                <option value="7">7</option> 
			                <option value="8">8</option>
			                <option value="9">9</option> 
			                <option value="10">10</option>
			                <option value="11">11</option> 
			                <option value="12">12</option>
			            </select>
			            <input type="text" name="day" style="width:3rem;">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="email1">@
						<select name="email2">
			             	<option value="naver">naver.com</option> 
			                <option value="google">gmail.com</option>
			            </select>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phoneNum"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>
						<input class="btn btn-primary" type="button" value="등록" onclick="CheckAddMember()">
						<a href="/welcome.jsp" class="btn btn-primary">취소</a>
					</td>
				</tr>

			</table>
		</form>
		<script>
			function CheckAddMember(){
				
				var form = document.formL;
				
				// 입력란 빈칸 확인
				if(form.id.value==""){
					alert("아이디 입력하세요");
					form.id.focus();
					return false;
				}else if(form.pw1.value==""){
					alert("비밀번호 입력하세요");
					form.pw1.focus();
					return false;
				}else if(form.pw2.value==""){
					alert("비밀번호 재확인 입력하세요");
					form.pw2.focus();
					return false;
				}else if(form.gender.value==""){
					alert("성별 체크하세요");
					form.gender.focus();
					return false;
				}else if(form.year.value==""){
					alert("생일 년도 입력하세요");
					form.year.focus();
					return false;
				}else if(form.month.value==""){
					alert("생일 월 입력하세요");
					form.month.focus();
					return false;
				}else if(form.day.value==""){
					alert("생일 일 입력하세요");
					form.day.focus();
					return false;
				}else if(form.email1.value==""){
					alert("이메일 입력하세요");
					form.email1.focus();
					return false;
				}else if(form.email2.value==""){
					alert("도메인주소 체크하세요");
					form.email2.focus();
					return false;
				}else if(form.phoneNum.value==""){
					alert("전화번호 입력하세요");
					form.phoneNum.focus();
					return false;
				}else if(form.address.value==""){
					alert("주소 입력하세요");
					form.address.focus();
					return false;
				}
				
				
				form.submit();
			}

		</script>
	</div>
	
</body>
</html>