<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%

//session
String user = session.getAttribute("y").toString();

//getting values from form
String academicId = request.getParameter("index");

try
{
    if( ((user!=null) && (!user.trim().equals(""))) 
            && ((academicId!=null) && (!academicId.trim().equals(""))))
    {   
        String sql = "DELETE "
            + " FROM instructor_academicdetails "
            + " WHERE AcademicId = '" + academicId + "'";
        
        DatabaseFile obj = new DatabaseFile();
        obj.codedelete(sql);
   
%>

<jsp:forward page="viewacademicperformance.jsp">
    <jsp:param name="msg" value="Deleted Sucessfully"></jsp:param>
</jsp:forward>

<%
}
else
{
%>

<jsp:forward page="viewacademicperformance.jsp">
    <jsp:param name="msg" value="Kindly fill all mandatory fields!"></jsp:param>
</jsp:forward>

<%
}        
}
catch(Exception e)
{
e.printStackTrace();
}
%>