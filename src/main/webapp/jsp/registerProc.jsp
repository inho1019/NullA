<%@page import="user.userDAO"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ub" class="user.userBean">
	<jsp:setProperty name="ub" property="*"/>
</jsp:useBean>
<%
	userDAO ud = new userDAO();
	int d = ud.insertUS(ub);

	if (d == 0) {
		%><script>
		alert('회원가입 성공');
		location.href='../index.jsp';
		</script><%
	} else if(d == 1) {
		%><script>
			alert('중복된 아이디입니다');
			history.back();
		</script><%
	} else if(d == 2) {
		%><script>
			alert('중복된 닉네임입니다');
			history.back();
		</script><%
	}
%>