<%@page import="project.projectBean"%>
<%@page import="project.projectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="escape.es"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1">
<meta name="HandheldFriendly" content="true" />
<link rel="icon" href="img/null.ico">
    
<title>NullA</title>
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/board.css">
<link rel="stylesheet" href="css/animation.css">
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/project.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
<input type="hidden" id="sessionName" value="<%=session.getAttribute("name")%>">
<div id="all">
    <header>
        <section id="logoSec">
        <div id="logo" onclick="location.href='index.jsp'">NullA</div>
        </section>
        <section id="userSec">
        	<div id="user">
        		<jsp:include page="jsp/user.jsp"></jsp:include>
        	</div>
        	<div id="login">
        		<jsp:include page="jsp/login.jsp"></jsp:include>
        	</div>
        	<div id="register">
        		<jsp:include page="jsp/register.jsp"></jsp:include>
        	</div>
        </section>
    </header>
    <div class="clear"></div>
    <main>
        <section id="projectRead">
        	<div id="projectR">
				<jsp:include page="jsp/projectRead.jsp"></jsp:include>
			</div>
        	<div id="projectM">
				<jsp:include page="jsp/projectModify.jsp"></jsp:include>
			</div>
        </section>
        <section id="projectNull">
       	</section>
    </main>
     <footer style="text-align: center;">
    	Email : dagapro21@gmail.com
	<p style="font-size:12px">png,ico by Freepik</p>
    </footer>
</div>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
