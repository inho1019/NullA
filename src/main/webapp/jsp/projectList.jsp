<%@page import="java.util.ArrayList"%>
<%@page import="project.projectDAO"%>
<%@page import="project.projectBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	projectBean pb = new projectBean();
	projectDAO pd = new projectDAO();
	ArrayList<projectBean> arpb = pd.selectPR();
%>
<input type="hidden" value="<%=arpb.size()%>" id="hdnPB">
<div id="scrollBut">
	<img id="up" alt="up" src="img/scrollButton.png" onclick="mvScroll(-10)">
	<img id="down" alt="down" src="img/scrollButton.png" onclick="mvScroll(10)">
</div>
<div id="projectScroll" >
	<div id="projectBox">
	<%
		for(int i = 0;i < arpb.size();i++) {
			%><div class="projectItem" onclick='location.href="index.jsp?num=<%=arpb.get(i).getNum()%>"'><%
			%><div class="projectThumb"><img alt="projectIMG" onerror="this.src='img/project.png'" src="
			<%=arpb.get(i).getThumb()%>"></div>
			<h4><%=arpb.get(i).getTitle()%></h4>
			<div><b>BY&nbsp;</b><%=arpb.get(i).getWriter()%></div>
			</div><%
		}
	%>
	</div>
</div>