<%@page import="java.io.File"%>
<form action="CreateFolder.jsp" method="post">
    <h2>
        Create New Folder
    </h2>
    <input name="createfolder" type="text">
    <input type="submit" value="Create Folder">
</form>
<%
    String createfolder = request.getParameter("createfolder");
    String path = "D:/DBMSMini/OnlineTutorial/WebContent/MediaFiles/" + createfolder; 
    File f = new File(path);
    if(!f.exists())
    	f.mkdirs();
%>