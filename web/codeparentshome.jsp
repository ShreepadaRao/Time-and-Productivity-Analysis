<%@page import="java.sql.*"%>
<%@page import="com.apps.database.*"%>
<%
    ResultSet rs = null;

    try {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        if (((username != null) && (!username.trim().equals(""))) && ((password != null) && (!password.trim().equals("")))) {
            String sql = "select * from  parents where username = '" + username + "' and password = '" + password + "'";
            DatabaseFile db = new DatabaseFile();
            rs = db.codeselect(sql);

            if (rs.next()) {
                session.setAttribute("p", username);

                System.out.println(password);

%>
<jsp:forward page="welcomeparent.jsp"></jsp:forward>
<%            } else {
%>
<jsp:forward page="Parentshome.jsp">
    <jsp:param name="msg" value="Incorrect Username or Password"></jsp:param>
</jsp:forward>
<%
    }
} else {
%>
<jsp:forward page="Parentshome.jsp">
    <jsp:param name="msg" value="Incorrect Username or Password"></jsp:param>
</jsp:forward>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>