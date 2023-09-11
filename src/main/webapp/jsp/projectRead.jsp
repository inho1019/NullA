<%@page import="escape.es"%>
<%@page import="project.projectDAO"%>
<%@page import="project.projectBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	es es = new es();	

	projectDAO pd = new projectDAO();

	projectBean pb = pd.readPR(request.getParameter("num"));
%>
<div><div class="projectReadTop"><h1><%=pb.getTitle()%></h1>
<img alt="projectIMG" onerror="this.src='img/project.png'" src="
<%=pb.getThumb()%>">
<a href="<%=pb.getUrl()%>" target="blank">접속</a>
</div>
<div class="clear"></div>
<p id="pinfo" class="info"><span><%=pb.getWriter()%></span>
&nbsp;&nbsp;|&nbsp;&nbsp;<span>조회<%=pb.getCount()%></span>
	<span style="float:right;"><%=pb.getLogtime()%></span>
</p>
<div id="readContent"><%=pb.getContent()%></div>
	<button class="lefbut" onclick="outProject();location.href='index.jsp?bdpg=<%=request.getParameter("bdpg")%>&sc=<%=request.getParameter("sc")%>'">뒤로가기</button>
	<%if(session.getAttribute("id") != null) {
	if(session.getAttribute("name").equals("admin") || pb.getWriter().equals(session.getAttribute("name"))) {%>
		<button class="rigbut" onclick="prModify()">수정</button>
		<form action="jsp/dropProc.jsp" method="post">
			<input type="hidden" name="num" value="<%=pb.getNum()%>">
			<input type="hidden" name="name" value="<%=session.getAttribute("name")%>">
			<input class="rigbut" type="submit" value="삭제">
		</form>
	<%}} %>
</div>