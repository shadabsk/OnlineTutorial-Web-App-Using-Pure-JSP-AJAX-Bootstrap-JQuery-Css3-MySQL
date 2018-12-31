<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>
	
<%
String CName=request.getParameter("details");
String name=(String)session.getAttribute("sessname");
int check=0;
if(CName!=null )
{	
	try{
		String D_ID=null;
		String C_ID=null;
		String Rno=null;
		String id = "select dept_id,CID from course where CName=? ";
		ps=connection.prepareStatement(id);
		ps.setString(1,CName);
		rs = ps.executeQuery();
		while (rs.next()) {
		D_ID=rs.getString("dept_id");
		C_ID=rs.getString("CID");
		}
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
    	String query="insert into student (Year,DOA,dept_id,Username,Last_Modified) values (YEAR(CURDATE()),CURDATE(),?,?,now())";
        ps=connection.prepareStatement(query);
        ps.setString(1,D_ID);
        ps.setString(2,name);
        check=ps.executeUpdate();
        
        String rn = "select MAX(RNO) from student ";
		ps=connection.prepareStatement(rn);
		rs = ps.executeQuery();
		while (rs.next()) {
		Rno=rs.getString("MAX(RNO)");
		}
       
		Class.forName("com.mysql.jdbc.Driver").newInstance();
    	String query1="insert into takes (RNO,CID,Year,Percentage,Grade,EnrollTime,Progress) values (?,?,YEAR(CURDATE()),0,0,now(),0)";
        ps=connection.prepareStatement(query1);
        ps.setString(1,Rno);
        ps.setString(2,C_ID);
        ps.executeUpdate();
        
        
        if(check>0){
        	response.sendRedirect("../../StudentDash.jsp");
		}
	}
		catch(Exception ex){
	        	String result="<div class='alert alert-danger'>Register was not successful</div>";
				response.setContentType("text/html");  
				response.getWriter().write(result);
			
    }
}

%>