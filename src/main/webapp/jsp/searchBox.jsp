<%@page import="board.boardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="searchBox">
<%
boardDAO bd = new boardDAO();

String sel=request.getParameter("select");
if(sel == null) sel = "title";
else if(sel.equals("1")) sel = "title";
else if(sel.equals("2")) sel = "content";
else if (sel.equals("3")) sel = "writer";

ArrayList<boardBean> arbb = bd.searchBD(sel,request.getParameter("data"));


%>

<%for (int i = 0;i < arbb.size();i++) {
	%><div class="searchItem" onclick="mvReadS(
	'<%=arbb.get(i).getTitle()%>','<%=arbb.get(i).getWriter()%>',
	'<%=arbb.get(i).getContent()%>','<%=arbb.get(i).getNum()%>'
	,'<%=arbb.get(i).getLogtime()%>');">
	<h4><%=arbb.get(i).getTitle()%></h4>
	<p class="info"><%=arbb.get(i).getWriter()%>&nbsp;&nbsp;|
	<input type="hidden" name="title" value="<%=arbb.get(i).getTitle()%>">
	<input type="hidden" name="content" value="<%=arbb.get(i).getContent()%>">
	<input type="hidden" name="writer" value="<%=arbb.get(i).getWriter()%>">
	<span style="float:right;"><%=arbb.get(i).getLogtime()%></span>
	</p><%
	%><hr></div><%
}
%>
</div>