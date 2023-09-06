<%@page import="org.apache.jasper.JasperException"%>
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
	     	org.jsoup.nodes.Element imageElement = document.select("img:not([src*='data']),img:not([src*='base64'])").first();
	        if (imageElement == null) {
	            imageElement = document.select("link[rel='icon'],link[rel='shortcut icon']").first();
	            thumb = imageElement.absUrl("href");
	        } else thumb = imageElement.absUrl("src");
	    } catch (IOException e) {
	    	e.printStackTrace();
	    	response.sendRedirect("../error.jsp");
	    } 


	projectBean pb = new projectBean();
	
	pb.setTitle(request.getParameter("title"));
	pb.setWriter(request.getParameter("writer"));
	pb.setUrl(url);
	pb.setThumb(thumb);
	pb.setContent(request.getParameter("content").replace(System.getProperty("line.separator"), "<br>"));
	
	projectDAO pd = new projectDAO();
	pd.insertPR(pb);
	
	response.sendRedirect("../index.jsp");
%>