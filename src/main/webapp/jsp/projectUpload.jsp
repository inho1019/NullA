<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (session.getAttribute("id") == null){
	%><h3>잘못된 접근입니다</h3><%
} else { %>
<h2 style="margin-bottom: 5%">프로젝트 업로드</h2>
<form name="uploadForm" action="jsp/uploadProc.jsp" method="post">
	<div><font size="1">*링크를 앞자리(https://)까지 모두 기입해주세요.</font>
	<div class="title">링크&nbsp;
	<input type="url" name="url" class="projectUR" placeholder="https://example.com">
	</div>
	</div>
	<div class="title">이름&nbsp;
	<input type="text" name="title" class="projectTT" ></div>
	<div>설명</div>
	<textarea rows="11" class="projectTA" name="content"></textarea>
	<input type="hidden" name="writer" value="<%=session.getAttribute("name")%>">
	<input type="button" class="rigbut" onclick="checkUpload()" value="등록"> 
</form>
<% } %>