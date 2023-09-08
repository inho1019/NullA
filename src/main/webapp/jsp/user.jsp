<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String gen = (String)session.getAttribute("gender");
if (session.getAttribute("id") == null){
	%><div onclick="login()" id="inLogin">로그인</div><%
} else {
	%><div id="userInfo">
	<%if(gen.equals("0")){
	%><img id="profile" alt="man" src="img/man.png">
	<%} else {%><img id="profile" alt="woman" src="img/woman.png"><%} %>
		<table style="width:65%;margin:0 auto;border-collapse: collapse;">
			<tr height="20" style="border-bottom: 1.2px solid grey">
				<td align="center" width="35%" >이름</td>
				<td width="65%"><div class="textOver" >
				<%=session.getAttribute("name")%></div></td>
			</tr> 
			<tr height="20" style="border-bottom: 1.2px solid grey">
				<td align="center" width="35%">아이디</td>
				<td class="textOver" width="65%"><%=session.getAttribute("id")%></td>
			</tr> 
			<tr height="20" align="left">
				<td colspan="2">
					<div id=userIcon>
						<img src="img/userlist.png" onclick="mvSearch(1)" id="userIMG">
						<img src="img/userproject.png" onclick="chSearch(1)" id="userIMG">
						<img src="img/logout.png" id="userIMG" onclick="location.href='jsp/logout.jsp'">
					</div>
				</td>
			</tr> 
		</table>
	</div><%
}
%>