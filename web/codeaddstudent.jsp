<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%

//session
    String user = session.getAttribute("y").toString();

//getting values from form
    String name = request.getParameter("name");
    String username = request.getParameter("user");
    String password = request.getParameter("pass");
    String coursename = request.getParameter("coursename");
    System.out.println("coursename:" + coursename);
    String DOB = request.getParameter("datepicker");
    String Email = request.getParameter("email");

    try {
        String sql = " insert into student(Studentname, type, username, password, courseid, DOB, Emailid ) values(?,?,?,?,?,?,?) ";

        /*FileInputStream fis = null;
         File file = new File(path.concat(password));
         fis = new FileInputStream(file);*/
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendance", "root", "");

        //preferred statement
        PreparedStatement pf = (PreparedStatement) con.prepareStatement(sql);
        pf.setString(1, name);
        pf.setString(2, "Student");
        pf.setString(3, username);
        pf.setString(4, password);
        pf.setString(5, coursename);
        pf.setString(6, DOB);
        pf.setString(7, Email);

        //pf.setBinaryStream(13, fis, (int) file.length());
        pf.executeUpdate();

%>

<jsp:forward page="AddStudent.jsp">
    <jsp:param name="msg" value="Inserted Sucessfully"></jsp:param>
</jsp:forward>

<%        } catch (Exception e) {
        e.printStackTrace();
    }
%>