<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%

//session
String user = session.getAttribute("z").toString();

//getting values from form
String leaveId = request.getParameter("index");

try
{
    if( ((user!=null) && (!user.trim().equals(""))) 
            && ((leaveId!=null) && (!leaveId.trim().equals(""))))
    {   
        String sql = "DELETE "
            + " FROM instructor_leavedetails "
            + " WHERE LeaveId = '" + leaveId + "'";
        
        DatabaseFile obj = new DatabaseFile();
        obj.codedelete(sql);
   
%>

<jsp:forward page="viewleave.jsp">
    <jsp:param name="msg" value="Deleted Sucessfully"></jsp:param>
</jsp:forward>

<%
}
else
{
%>

<jsp:forward page="viewleave.jsp">
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