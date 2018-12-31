<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>
	
<%
String a=request.getParameter("user");
String b=request.getParameter("pass");
String c=request.getParameter("fname");
String d=request.getParameter("mname");
String e=request.getParameter("lname");
String f=request.getParameter("emailid");
String g=request.getParameter("contactno");
String h=request.getParameter("address");
String i=request.getParameter("dob");
String j=request.getParameter("age");
String k=request.getParameter("question");
String l=request.getParameter("ans");

String desig=request.getParameter("des");
String depart=request.getParameter("dep");
String qual=request.getParameter("qua");
String special=request.getParameter("special");
String Exp=request.getParameter("exp");

int check=0;

if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null && h!=null && i!=null && j!=null && k!=null && l!=null)
{
	try{
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
    	String query="insert into users (Username,Password,Fname,Mname,Lname,EmailID,ContactNo,Address,DOB,Age,Quest,Ans,CreationTime,LastModified) values (?,?,?,?,?,?,?,?,?,?,?,?,now(),now())";
        ps=connection.prepareStatement(query);
        ps.setString(1,a);
        ps.setString(2,b);
        ps.setString(3,c);
        ps.setString(4,d);
        ps.setString(5,e);
        ps.setString(6,f);
        ps.setString(7,g);
        ps.setString(8,h);
        ps.setString(9,i);
        ps.setString(10,j);
        ps.setString(11,k);
        ps.setString(12,l);
        check=ps.executeUpdate();
        if(check>0){
        	String result="<div class='alert alert-info'>The faculty has been enrolled successfully</a></div>";
			response.setContentType("text/html");  
			response.getWriter().write(result);
		}
	}
		catch(Exception ex){
	        	String result="<div class='alert alert-danger'>Register was not successful</div>";
				response.setContentType("text/html");  
				response.getWriter().write(result);
			
    }
}

if(a!=null){
	try{
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String query2="insert into belongs (GroupName,Username) values ('Faculty',?)";
			ps=connection.prepareStatement(query2);
			ps.setString(1,a);
			ps.executeUpdate();
		}
	catch(Exception e1){
		out.println("Exception occured");
	}
}

if(desig!=null && depart!=null && qual!=null && special!=null && Exp!=null){
	try{
		String dept_id=null;
		String id = "select dept_id from department where dept_name=? ";
		ps=connection.prepareStatement(id);
		ps.setString(1,depart);
		rs = ps.executeQuery();
		while (rs.next()) {
		id=rs.getString("dept_id");
		}

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String query2="insert into faculty (Designation,Qualification,Specialization,Experience,DOJ,dept_id,Username) values (?,?,?,?,CURDATE(),?,?)";
		ps=connection.prepareStatement(query2);
		ps.setString(1,desig);
		ps.setString(2,qual);
		ps.setString(3,special);
		ps.setString(4,Exp);
		ps.setString(5,id);
		ps.setString(6,a);
		ps.executeUpdate();
	}
catch(Exception e1){
	out.println("Exception occured");
}
	
}
%>