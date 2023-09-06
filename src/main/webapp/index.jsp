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
        <section id="projectSec">
            <div id="projectList">
	        	<img src="img/search.png" onclick="mvFind(0)" class="lefbut" id="dodbogi">
	        	<%if (session.getAttribute("name") != null) {%>
    	    	<button onclick="mvUpload()" class="rigbut">프로젝트 업로드</button>
    	    	<%} %>
    	    	<div class="clear"></div>
   				<jsp:include page="jsp/projectList.jsp"></jsp:include>
        	</div>
        	<div id="projectUpload">
        		<jsp:include page="jsp/projectUpload.jsp"></jsp:include>
        		<button class="lefbut" onclick="backUpload()">취소</button>
        	</div>
        </section>
        <section id="boardSec">
        	<div id="boardList">
	        	<img src="img/search.png" onclick="mvSearch(0)" class="lefbut" id="dodbogi">
	        	<%if (session.getAttribute("name") != null) {%>
    	    	<button onclick="mvWrite()" class="rigbut">글작성</button>
    	    	<%} %>
    	    	<div class="clear"></div>
        		<jsp:include page="jsp/boardList.jsp"></jsp:include>
        	</div>
        	<div id="boardWrite">
        		<jsp:include page="jsp/boardWrite.jsp"></jsp:include>
        		<button class="lefbut" onclick="backWrite('boardWrite')">취소</button>
        	</div>
        	<div id="boardRead">
				<jsp:include page="jsp/boardRead.jsp"></jsp:include>
        	</div>
        	<div id="boardUpdate">
				<jsp:include page="jsp/boardUpdate.jsp"></jsp:include>
        	</div>
        	<div id="boardSearch">
        	<button class="rigbut" onclick="backWrite('boardSearch')">취소</button>
        		<jsp:include page="jsp/boardSearch.jsp"></jsp:include>
        	</div>
        </section>
    </main>
    <footer style="text-align: center;">
    	png,ico by Freepik
    </footer>
</div>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>