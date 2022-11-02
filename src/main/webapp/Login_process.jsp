<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "dao.MemberDAO" %>
<%@page import = "dto.MemberDTO" %>

<%	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberDTO(id, pw);
	dao.close();
	
	if(dto.getId() != null){
		session.setAttribute("userId", dto.getId());
		response.sendRedirect("Login.jsp");
	}else{
		request.setAttribute("LoginErrMsg", "로그인오류입니다.");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>
