<%@page import="project.projectBean"%>
<%@page import="project.projectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	projectDAO pd = new projectDAO();

	projectBean pb = pd.readPR(request.getParameter("num"),0);
 	String sc = "0";
	if(request.getParameter("sc") != null) {
		sc = request.getParameter("sc");
	}
	if (session.getAttribute("id") == null){
		%><h3>잘못된 접근입니다</h3><%
	} else { %>
	<h2 style="margin-bottom: 5%">프로젝트 수정</h2>
	<form name="modifyForm" action="jsp/modifyProc.jsp" method="post">
		<div><font size="1">*링크를 앞자리(https://)까지 모두 기입해주세요.</font>
		<div class="title">링크&nbsp;
		<input type="url" name="url" class="projectUR"
		maxlength="1000" value="<%=pb.getUrl()%>">
		</div>
		</div>
		<div class="title">이름&nbsp;
		<input type="text" name="title" class="projectTT" maxlength="100" 
		value="<%=pb.getTitle()%>"></div>
		<div>설명</div>
		<textarea rows="11" class="projectTA" name="content"><%=pb.getContent()%></textarea>
		<input type="hidden" name="name" value="<%=session.getAttribute("name")%>">
		<input type="hidden" name="num" value="<%=request.getParameter("num")%>">
		<input type="hidden" name="hdnS" value="<%=request.getParameter("sc")%>">
		<input type="button" class="rigbut" onclick="checkUpload(1)" value="등록"> 
	</form>
<% } %>