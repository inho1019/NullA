<%@page import="board.boardBean"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	boardBean bb = new boardBean();
	
	bb.setTitle(request.getParameter("title"));
	bb.setWriter(request.getParameter("writer"));
	bb.setContent(request.getParameter("content").replace(System.getProperty("line.separator"), "<br>"));
	boardDAO bd = new boardDAO();
	bd.insertBD(bb);
	
	response.sendRedirect("../index.jsp");
%>