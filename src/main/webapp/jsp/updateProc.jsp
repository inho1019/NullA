<%@page import="board.boardBean"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	boardBean bb = new boardBean();

	bb.setNum(Integer.parseInt(request.getParameter("num")));
	bb.setWriter(request.getParameter("name"));
	bb.setTitle(request.getParameter("title"));
	bb.setContent(request.getParameter("content").replace(System.getProperty("line.separator"), "<br>"));

	boardDAO bd = new boardDAO();
	int check = bd.updateBD(bb);
	
	if (check == 0) {
		%><script>
		alert('잘못된 접근입니다');
		location.href='../index.jsp';
		</script><%
	} else {
		response.sendRedirect("../index.jsp?bdpg="+request.getParameter("upg"));
	}
%>