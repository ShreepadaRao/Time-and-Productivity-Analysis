<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%

//session
    String user = session.getAttribute("z").toString();

//getting values from form
    String extraId = request.getParameter("index");

    try {
        if (((user != null) && (!user.trim().equals("")))
                && ((extraId != null) && (!extraId.trim().equals("")))) {
            String sql = "DELETE "
                    + " FROM instructor_extracurricular "
                    + " WHERE ExtraId = '" + extraId + "'";

            DatabaseFile obj = new DatabaseFile();
            obj.codedelete(sql);

%>

<jsp:forward page="viewextraactivities.jsp">
    <jsp:param name="msg" value="Deleted Sucessfully"></jsp:param>
</jsp:forward>

<%        } else {
%>

<jsp:forward page="viewextraactivities.jsp">
    <jsp:param name="msg" value="Kindly fill all mandatory fields!"></jsp:param>
</jsp:forward>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>