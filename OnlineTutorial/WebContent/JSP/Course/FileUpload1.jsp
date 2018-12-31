<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@page import="java.io.File"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.*"%>
<%@ include file="Connection.jsp" %>
<%
	
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   String filePath = "D:/DBMSMini/OnlineTutorial/WebContent/MediaFiles/";
   String filePath2="MediaFiles/";

   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File("c:\\temp"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
      try{ 
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();
       
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )  {
                String fieldName = fi.getFieldName();
                String fileName = fi.getName();
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();
                file = new File( filePath + fileName) ;
                fi.write( file ) ;
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String query1="insert into dummy (Media) values (?)";
            	ps=connection.prepareStatement(query1);
            	ps.setString(1,filePath2+fileName);
            	ps.executeUpdate();
            	%>
            	<script type="text/javascript">
            	window.close();
            	</script>
            	<%
            }
         }
        
         
         
      }catch(Exception ex) {
         System.out.println(ex);
      }
      
      
   }
   
   
   else{
      
   }

   
    
%>