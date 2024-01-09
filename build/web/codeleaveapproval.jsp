<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%
    //session
    String user = session.getAttribute("y").toString();

    //getting values from form
    String leaveId = request.getParameter("index");
    String status = request.getParameter("index1");

    try {
        if (((user != null) && (!user.trim().equals("")))
                && ((status != null) && (!status.trim().equals("")))
                && ((leaveId != null) && (!leaveId.trim().equals("")))) {
            String sql = "UPDATE instructor_leavedetails "
                    + " SET Status = '"+status+"', "
                    + " UpdatedDate = now() "
                    + " WHERE LeaveId = '" + leaveId + "'";

            DatabaseFile obj = new DatabaseFile();
            obj.codeupdate(sql);

%>

<jsp:forward page="leaveapproval.jsp">
    <jsp:param name="msg" value="Approved Sucessfully"></jsp:param>
</jsp:forward>

<%                } else {
%>

<jsp:forward page="leaveapproval.jsp">
    <jsp:param name="msg" value="Kindly fill all mandatory fields!"></jsp:param>
</jsp:forward>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>