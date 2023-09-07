<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (session.getAttribute("id") == null){
	%><h3>잘못된 접근입니다</h3><%
} else { %>
<h2 style="margin-bottom: 5%">글작성</h2>
<form name="writeForm" action="jsp/writeProc.jsp" method="post">
	<div class="title">제목&nbsp;
	<input type="text" name="title" class="boardTT" maxlength="100"></div>
	<div>내용</div>
	<textarea rows="10" class="boardTA" name="content"></textarea>
	<input type="hidden" name="writer" value="<%=session.getAttribute("name")%>">
	<input type="button" class="rigbut" onclick="checkInput(0,0)" value="등록"> 
</form>
<% } %>