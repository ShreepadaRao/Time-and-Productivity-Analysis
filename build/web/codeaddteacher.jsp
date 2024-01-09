<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%

//session
    String user = session.getAttribute("y").toString();

//getting values from form
    String name = request.getParameter("name");
    String username = request.getParameter("user");
    String password = request.getParameter("pass");
    int studentname = Integer.parseInt(request.getParameter("studentname"));
    int coursename = Integer.parseInt(request.getParameter("coursename"));

    try {
        String sql = " insert into instructor(InstructorName, username, password, courceid, subjectid) values(?,?,?,?,?) ";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendance", "root", "");

        //preferred statement
        PreparedStatement pf = (PreparedStatement) con.prepareStatement(sql);
        pf.setString(1, name);
        pf.setString(2, username);
        pf.setString(3, password);
        pf.setInt(4, studentname);
        pf.setInt(5, coursename);
        pf.executeUpdate();

%>

<jsp:forward page="AddTeacher.jsp">
    <jsp:param name="msg" value="Inserted Sucessfully"></jsp:param>
</jsp:forward>

<%        } catch (Exception e) {
        e.printStackTrace();
    }
%>