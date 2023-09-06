<%@page import="board.boardBean"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	boardBean bb = new boardBean();

	String num = request.getParameter("num");
	String name = request.getParameter("name");

	boardDAO bd = new boardDAO();
	
	int check = bd.deleteBD(num,name);
	
	if (check == 0) {
		%><script>
		alert('잘못된 접근입니다');
		location.href='index.jsp';
		</script><%
	} else {
		response.sendRedirect("../index.jsp?bdpg="+request.getParameter("rpg"));
	}
%>