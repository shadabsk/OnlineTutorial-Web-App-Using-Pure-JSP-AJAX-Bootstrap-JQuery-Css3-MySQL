<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>

<%
String upass=request.getParameter("fcpass");
String name=(String)session.getAttribute("sessname");


if(upass!=null){
	try{

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String query2="update users set Password=? where Username='"+name+"'";
		ps=connection.prepareStatement(query2);
		ps.setString(1,upass);
		ps.executeUpdate();
		
		String query="update faculty set LastModified=now() where Username='"+name+"'";
		ps=connection.prepareStatement(query);
		
		ps.executeUpdate();
	}
	catch(Exception e1){
		out.println("Exception occured");
	}
}
%>