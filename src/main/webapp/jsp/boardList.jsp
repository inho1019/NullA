<%@page import="board.boardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	boardDAO bd = new boardDAO();
	
	ArrayList<boardBean> arbb = bd.selectBD();
	
	int pg = 0;
	if(request.getParameter("bdpg") != null) pg = Integer.parseInt(request.getParameter("bdpg"))*5;
	int pgc = (int)pg/5;
	int arbs = arbb.size();
	int pgCount = (int)arbs/5;
	if(arbs%5 == 0) pgCount -= 1;
	
	int finish = pg+5;
	if(arbb.size() < pg+5) finish = arbb.size();

	int a = 0;
	int b = pgCount;
	if (pgCount >= 10) {
		if (pgc >= 5 && pgc <= pgCount - 6) {
			a = pgc-4;
			b = pgc+5;
		} else if (pgc < 5) {
			b = 9;
		} else if (pgc > pgCount - 6) {
			a = pgCount - 9;
		}
	}
	for (int i = pg;i < finish;i++) {
		%><div class="listItem" onclick="mvRead(
		'<%=arbb.get(i).getTitle()%>','<%=arbb.get(i).getWriter()%>',
		'<%=arbb.get(i).getContent()%>','<%=arbb.get(i).getNum()%>'
		,'<%=arbb.get(i).getLogtime()%>');">
		<h4><%=arbb.get(i).getTitle()%></h4>
		<p class="info"><%=arbb.get(i).getWriter()%>&nbsp;&nbsp;|
		<span style="float:right;"><%=arbb.get(i).getLogtime()%></span>
		</p><%
		%><hr></div><%
	}
	
	if (pgCount > 0) {
		%><div id="pageCount"><%
		if(pgc >= 5) {%>&nbsp;<a href="index.jsp?bdpg=<%=pgc-4%>">&lt;</a>&nbsp;<% };
		for (int i = a;i <= b;i++) {
			if (i != pgc) {%><a style="margin:0 1px 0 1px" href="index.jsp?bdpg=<%=i%>">[<%=i+1%>]</a><%;}
			else {%><span style="margin:0 1px 0 1px">[<%=i+1%>]</span><% };
		}
		if(pgc <= pgCount - 6) {%><a href="index.jsp?bdpg=<%=pgc+5%>">&gt;</a>&nbsp;<% };
		%><br><a href="index.jsp">&laquo;</a>&nbsp;&nbsp;<a href="index.jsp?bdpg=<%=pgCount%>">&raquo;</a><%
		%></div><%
	}
%>