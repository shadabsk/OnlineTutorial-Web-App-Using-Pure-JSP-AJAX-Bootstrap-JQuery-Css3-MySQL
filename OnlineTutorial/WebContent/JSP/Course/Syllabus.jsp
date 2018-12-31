<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>
	
<%
String CName=request.getParameter("cname");
String Chapt=request.getParameter("chap1");
String Topic=request.getParameter("topic1");
String Edit=request.getParameter("editora");
String Weight=request.getParameter("wt1");

int check=0;
if(CName!=null && Chapt!=null && Topic!=null && Edit!=null && Weight!=null )
{	
	try{
		String C_ID=null;
		String id = "select CID from course where CName=? ";
		ps=connection.prepareStatement(id);
		ps.setString(1,CName);
		rs = ps.executeQuery();
		while (rs.next()) {
		C_ID=rs.getString("CID");
		}
		
		String Media=null;
		String md = "select Media from dummy where id in (select MAX(id) from dummy)";
		ps=connection.prepareStatement(md);
		rs = ps.executeQuery();
		while (rs.next()) {
		Media=rs.getString("Media");
		}
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
    	String query="insert into tutorial (CID,Year,Topic,content,Name,Weightage,Media) values (?,YEAR(CURDATE()),?,?,?,?,?)";
        ps=connection.prepareStatement(query);
        ps.setString(1,C_ID);
        ps.setString(2,Topic);
        ps.setString(3,Edit);
        ps.setString(4,Chapt);
        ps.setString(5,Weight);
        ps.setString(6,Media);
        
        check=ps.executeUpdate();
        if(check>0){
        	String result="<div class='alert alert-info'>Records Inserted</div>";
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

%>