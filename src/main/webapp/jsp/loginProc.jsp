<%@page import="user.userBean"%>
<%@page import="user.userDAO"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	userBean ub = new userBean();
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	

	userDAO ud = new userDAO();
	ub = ud.loginUS(id);
	if (ub.getPass() == null) {
		%><script>alert('아이디나 비밀번호가 올바르지 않습니다')
		history.back();</script><%
	}else if(ub.getPass().equals(pass)) {
		session.setAttribute("id", id);
		session.setAttribute("name", ub.getName());
		session.setAttribute("email", ub.getEmail());
		session.setAttribute("gender", ub.getGender());
		session.setMaxInactiveInterval(10800);
		%><script>alert('로그인 성공')
		location.href='../index.jsp';</script><%
	} else {
		%><script>alert('아이디나 비밀번호가 올바르지 않습니다')
		history.back();</script><%
	}
%>
