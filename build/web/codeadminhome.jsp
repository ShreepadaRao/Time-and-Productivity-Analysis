<%@page import="java.sql.*"%>
<%@page import="com.apps.database.*"%>
<%@page session="true" %>
<%
    ResultSet rs = null;

    try {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        if (((username != null) && (!username.trim().equals(""))) && ((password != null) && (!password.trim().equals("")))) {
            String sql = "select * from  admin where username = '" + username + "' and password = '" + password + "'";
            DatabaseFile db = new DatabaseFile();
            rs = db.codeselect(sql);

            if (rs.next()) {
                session.setAttribute("y", username);

                System.out.println(password);

%>
<jsp:forward page="Admin.jsp"></jsp:forward>
<%            } else {
%>
<jsp:forward page="Adminhome.jsp">
    <jsp:param name="msg" value="Incorrect Username or Password"></jsp:param>
</jsp:forward>
<%
    }
} else {
%>
<jsp:forward page="Adminhome.jsp">
    <jsp:param name="msg" value="Incorrect Username or Password"></jsp:param>
</jsp:forward>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>