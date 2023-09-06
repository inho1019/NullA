<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String upg = "0";
	if(request.getParameter("bdpg") != null) {
		upg = request.getParameter("bdpg");
	}
	if (session.getAttribute("id") == null){
		%><h3>잘못된 접근입니다</h3><%
	} else { %>
	<h2 style="margin-bottom: 5%">글수정</h2>
	<form name="updateForm" action="jsp/updateProc.jsp" method="post">
		<div class="title">제목&nbsp;
		<input type="text" name="title" class="boardTT" ></div>
		<div>내용</div>
		<textarea rows="10" class="boardTA" name="content"></textarea>
		<input type="hidden" id="hdnU" name="num">
		<input type="hidden" name="upg" value="<%=upg%>">
		<input type="hidden" name="name" value="<%=session.getAttribute("name")%>">
		<input type="button" class="rigbut" onclick="checkInput(1,1)" value="등록"> 
	</form>
	<button class="lefbut" onclick="upCancel()">취소</button>
<% } %>