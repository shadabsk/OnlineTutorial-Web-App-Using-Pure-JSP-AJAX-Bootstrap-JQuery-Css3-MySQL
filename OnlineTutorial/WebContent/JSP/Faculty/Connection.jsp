<%--
    Document   : connection
    Created on : October 07, 2018, 23:05:00 PM
    Author     : Shadab Shaikh,TedirGhazali
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   	String Host = "jdbc:mysql://localhost:3306/onlinetutorialdb";
	Connection connection = null;
	Statement statement = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(Host, "root", "");
	statement = connection.createStatement();
	PreparedStatement ps=null;
%>
