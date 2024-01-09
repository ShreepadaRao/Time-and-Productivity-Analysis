<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%

//session
String user = session.getAttribute("x").toString();

//getting values from form
String feedbackId = request.getParameter("index");

try
{
    if( ((user!=null) && (!user.trim().equals(""))) 
            && ((feedbackId!=null) && (!feedbackId.trim().equals(""))))
    {   
        String sql = "DELETE "
            + " FROM instructor_feedbackdetails "
            + " WHERE FeedbackId = '" + feedbackId + "'";
        
        DatabaseFile obj = new DatabaseFile();
        obj.codedelete(sql);
   
%>

<jsp:forward page="viewinstructorsfeedback.jsp">
    <jsp:param name="msg" value="Deleted Sucessfully"></jsp:param>
</jsp:forward>

<%
}
else
{
%>

<jsp:forward page="viewinstructorsfeedback.jsp">
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