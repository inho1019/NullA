<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String rpg = "0";
	if(request.getParameter("bdpg") != null) {
		rpg = request.getParameter("bdpg");
	}
 %>
<div><h3 id="readTitle"></h3>
<p class="info"><span id="readWriter"></span>&nbsp;&nbsp;|
	<span style="float:right;" id="readDate"></span>
</p>
</div><hr/>
<div id="readContent"></div>
	<button class="lefbut" onclick="backWrite('boardRead')">취소</button>
	<button class="rigbut" onclick="mvUpdate()" id="upbut">수정</button>
<form action="jsp/deleteProc.jsp">
	<input type="hidden" id="hdnR" name="num">
	<input type="hidden" name="rpg" value="<%=rpg %>">
	<input type="hidden" name="name" value="<%=session.getAttribute("name")%>">
	<input class="rigbut" type="submit" value="삭제" id="delbut">
</form>