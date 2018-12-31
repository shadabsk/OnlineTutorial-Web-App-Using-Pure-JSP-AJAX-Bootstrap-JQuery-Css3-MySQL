<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="Connection.jsp" %>
<%
String name=request.getParameter("Uname");
String contact=request.getParameter("Ucontact");
String email=request.getParameter("UEmail");
String subject=request.getParameter("USubj");
String mesg=request.getParameter("textrem");
String GroupName="Admin";
int statusQuery = 0;
Class.forName("com.mysql.jdbc.Driver").newInstance();
if(name!=null && contact!=null && email!=null && subject!=null && mesg!=null ){
    try{
        String query="INSERT INTO `enquiry` (Name, Contact, Email, Subject, Mesg,Time,GroupName) VALUES(?,?,?,?,?,now(),?)";
        ps=connection.prepareStatement(query);
        ps.setString(1,name);
        ps.setString(2,contact);
        ps.setString(3,email);
        ps.setString(4,subject);
        ps.setString(5,mesg);
        ps.setString(6,GroupName);
        statusQuery=ps.executeUpdate();
        if(statusQuery>0){ 
        	response.setContentType("text/html");  
        	response.getWriter().write("true");  
        }
        else{
        	
        }
    }catch(Exception ex){
        out.println("Your Connection Failed");
    }
}
%>