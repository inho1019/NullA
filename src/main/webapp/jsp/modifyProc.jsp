<%@page import="project.projectDAO"%>
<%@page import="project.projectBean"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String url = request.getParameter("url");
	String thumb = "";
	    try {
	        org.jsoup.nodes.Document document = org.jsoup.Jsoup.connect(url).get();
	        if (document == null) {
	        	%><script>
	        		alert('링크가 올바르지 않습니다.');
	        		location.href = '../index.jsp';
	        	</script><%
	        }
	     	org.jsoup.nodes.Element imageElement = document.select("img:not([src*='data']),img:not([src*='base64']),img:not([src*='gif'])").first();
	        if (imageElement == null) {
	            imageElement = document.select("link[rel='icon'],link[rel='shortcut icon']").first();
	            thumb = imageElement.absUrl("href");
	        } else thumb = imageElement.absUrl("src");
	    } catch (IOException e) {
	    	e.printStackTrace();
	    } 
	
	
	projectBean pb = new projectBean();
	
	pb.setTitle(request.getParameter("title"));
	pb.setNum(Integer.parseInt(request.getParameter("num")));
	pb.setWriter(request.getParameter("name"));
	pb.setUrl(url);
	pb.setThumb(thumb);
	pb.setContent(request.getParameter("content").replace(System.getProperty("line.separator"), "<br>"));
	
	projectDAO pd = new projectDAO();
	
	int check = pd.modifyPR(pb);
	
	if (check == 0) {
		%><script>
		alert('잘못된 접근입니다');
		location.href='../index.jsp';
		</script><%
	} else {
		response.sendRedirect("../index.jsp?sc="+request.getParameter("sc"));
	}
%>
<h3><%=check %></h3>