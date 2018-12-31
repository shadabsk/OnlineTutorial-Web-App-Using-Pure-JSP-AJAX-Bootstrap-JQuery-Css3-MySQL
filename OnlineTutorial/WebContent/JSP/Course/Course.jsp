<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>
	
<%
String dept_id=null;
String FID=null;
String CID=null;
String name=(String)session.getAttribute("sessname");
String id = "select dept_id,FID from faculty where Username='"+name+"'";
rs = statement.executeQuery(id);
while (rs.next()) {
	dept_id=rs.getString("dept_id");
	FID=rs.getString("FID");
}
String Cname=request.getParameter("cname");
String Cdura=request.getParameter("cduration");
String Out=request.getParameter("cout");
String pre=request.getParameter("prereq");

int check=0;
if(Cname!=null && Cdura!=null && Out!=null && pre!=null)
{
	try{
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
    	String query="insert into course (dept_id,Cname,COutcome,CDuration,CPreq,Last_Modified) values (?,?,?,?,?,now())";
        ps=connection.prepareStatement(query);
        ps.setString(1,dept_id);
        ps.setString(2,Cname);
        ps.setString(3,Out);
        ps.setString(4,Cdura);
        ps.setString(5,pre);
        check=ps.executeUpdate();
        
        String c_id = "select MAX(CID) from course";
        rs = statement.executeQuery(c_id);
        while (rs.next()) {
        	CID=rs.getString("MAX(CID)");
        }
        
        String query2="insert into teaches (CID,FID,YEAR) values (?,?,YEAR(CURDATE() ) )";
        ps=connection.prepareStatement(query2);
        ps.setString(1,CID);
        ps.setString(2,FID);
        ps.executeUpdate();

        if(check>0){
        	String result="<div class='alert alert-info'>Course has been created successfully</div>";
			response.setContentType("text/html");  
			response.getWriter().write(result);
		}
	}
		catch(Exception ex){
	        	String result="<div class='alert alert-danger'>Course creation failed</div>";
				response.setContentType("text/html");  
				response.getWriter().write(result);
			
    }
}


%>