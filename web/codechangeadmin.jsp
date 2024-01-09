<%@page import="java.sql.*"%>
<%@page import="com.apps.database.*"%>
<%

//session
    String user = session.getAttribute("y").toString();

//getting values from form
    String username = request.getParameter("user");
    String password = request.getParameter("pass");

    try {
        String sql = " update admin set username = ? , password  = ? where  username = ?";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendance", "root", "");

        //preferred statement
        PreparedStatement pf = (PreparedStatement) con.prepareStatement(sql);
        pf.setString(1, username);
        pf.setString(2, password);
        pf.setString(3, user);
        pf.executeUpdate();

        user = username;

%>

<jsp:forward page="changeadmin.jsp">
    <jsp:param name="msg" value="Updated Sucessfully"></jsp:param>
</jsp:forward>

<%        } catch (Exception e) {
        e.printStackTrace();
    }
%>