

<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="Connection.jsp" %>
<%
String name=request.getParameter("user");
int statusQuery = 0;
String dbname="";
Class.forName("com.mysql.jdbc.Driver").newInstance();
if(name!=null ){
    try{
        String query="SELECT * FROM users WHERE Username='"+name+"'";
        ps=connection.prepareStatement(query);
        rs=ps.executeQuery();
        while (rs.next()) {
        	dbname=rs.getString("Username");
        }
        if(dbname.equals(name)){
        	String status="'<div class='alert alert-danger'>Username not available</div>'";
        	response.setContentType("text/plain");
        	response.setCharacterEncoding("UTF-8"); 
        	response.getWriter().write(status); 
	
        }
        else{
        	String status="'<div class='alert alert-success'>Username available</div>'";
        	response.setContentType("text/plain");
        	response.setCharacterEncoding("UTF-8"); 
        	response.getWriter().write(status); 
        	
        }
    }catch(Exception ex){
        out.println("Your Connection Failed");
    }
}
%>