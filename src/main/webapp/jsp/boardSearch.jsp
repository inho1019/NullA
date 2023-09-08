<%@page import="escape.es"%>
<%@page import="board.boardDAO"%>
<%@page import="board.boardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<select name="searchSel" id="searchSel">
	<option value="1">제목</option>
	<option value="2">내용</option>
	<option value="3">글쓴이</option>
</select>
<input type="search" placeholder="검색" id="searchBoard" class="mobileSe">
<div style="clear: both;"></div>
<div id="searchBox">
<%
boardDAO bd = new boardDAO();
es es = new es();
ArrayList<boardBean> arbb = bd.selectBD();
for (int i = 0;i < arbb.size();i++) {
	%><div class="searchItem" onclick="mvReadS(
	'<%=es.escape(arbb.get(i).getTitle())%>','<%=arbb.get(i).getWriter()%>',
	'<%=es.escape(arbb.get(i).getContent())%>','<%=arbb.get(i).getNum()%>'
	,'<%=arbb.get(i).getLogtime()%>');">
	<h4><%=es.escape(arbb.get(i).getTitle())%></h4>
	<p class="info"><%=arbb.get(i).getWriter()%>&nbsp;&nbsp;|
	<input type="hidden" name="title" value="<%=es.escape(arbb.get(i).getTitle())%>">
	<input type="hidden" name="content" value="<%=es.escape(arbb.get(i).getContent())%>">
	<input type="hidden" name="writer" value="<%=arbb.get(i).getWriter()%>">
	<span style="float:right;"><%=arbb.get(i).getLogtime()%></span>
	</p><%
	%><hr></div><%
}
%>
</div>
