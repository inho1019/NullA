<%@page import="escape.es"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.projectDAO"%>
<%@page import="project.projectBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String scroll = "0";
	if(request.getParameter("sc") != null) scroll = request.getParameter("sc");
	projectBean pb = new projectBean();
	projectDAO pd = new projectDAO();
	ArrayList<projectBean> arpb = pd.selectPR();
	
	es es = new es();
	
	int bdpg = 0;
	if(request.getParameter("bdpg") != null) bdpg = Integer.parseInt(request.getParameter("bdpg"));
%>
<input type="hidden" value="<%=arpb.size()%>" id="hdnPB">
<input type="hidden" value="<%=scroll%>" id="hdnSC">
<div id="scrollBut">
	<img id="up" alt="up" src="img/up.png" onclick="mvScroll(-10)">
	<img id="down" alt="down" src="img/down.png" onclick="mvScroll(10)">
</div>
<div id="projectScroll" >
	<div id="projectBox">
	<%
		for(int i = 0;i < arpb.size();i++) {
			%><div class="projectItem" onclick='mvProject();location.href="project.jsp?num=<%=arpb.get(i).getNum()%>&sc=<%=i%>&bdpg=<%=bdpg%>"'><%
			%><div class="projectThumb"><img alt="projectIMG" onerror="this.src='img/project.png'" src="
			<%=arpb.get(i).getThumb()%>"></div>
			<h4><%=es.escape(arpb.get(i).getTitle())%></h4>
			<div><b>BY&nbsp;</b><%=arpb.get(i).getWriter()%></div>
			<input type="hidden" name="writer" value="<%=arpb.get(i).getWriter()%>">
			<input type="hidden" name="title" value="<%=es.escape(arpb.get(i).getTitle())%>">
			<input type="hidden" name="content" value="<%=es.escape(arpb.get(i).getContent())%>">
			</div><%
		}
	%>
	</div>
</div>