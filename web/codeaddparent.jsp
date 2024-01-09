<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.File"%>
<%

//session
    String user = session.getAttribute("y").toString();

//getting values from form
    String name = request.getParameter("name");
    String username = request.getParameter("user");
    String password = request.getParameter("pass");
    String relation = request.getParameter("relation");

    int studentname = Integer.parseInt(request.getParameter("studentname"));

    try {
        String sql = " insert into parents(Parentname, Relationship, username, password, Studentid) values(?,?,?,?,?) ";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendance", "root", "");

        //preferred statement
        PreparedStatement pf = (PreparedStatement) con.prepareStatement(sql);
        pf.setString(1, name);
        pf.setString(2, relation);
        pf.setString(3, username);
        pf.setString(4, password);
        pf.setInt(5, studentname);
        pf.executeUpdate();

%>

<jsp:forward page="AddParent.jsp">
    <jsp:param name="msg" value="Inserted Sucessfully"></jsp:param>
</jsp:forward>

<%        } catch (Exception e) {
        e.printStackTrace();
    }
%>