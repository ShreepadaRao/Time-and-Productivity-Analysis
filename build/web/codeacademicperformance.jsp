<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%

//session
    String user = session.getAttribute("y").toString();

//getting values from form
    String instructorid = request.getParameter("instructor");
    String courseid = request.getParameter("course");
    String subjectid = request.getParameter("subject");
    String percentage = request.getParameter("percentage");
    String academicyear = request.getParameter("academicyear");

    try {
        if (((user != null) && (!user.trim().equals("")))
                && (!instructorid.trim().equals("select"))
                && (!courseid.trim().equals("select"))
                && (!subjectid.trim().equals("select"))
                && ((percentage != null) && (!percentage.trim().equals("")))
                && ((academicyear != null) && (!academicyear.trim().equals("")))) {
           
            String sql1 = "INSERT INTO instructor_academicdetails(Instructorid, courseid, subjectid, Percentage, Year, RecordedDate) VALUES(?, ?, ?, ?, ?, now())";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendance", "root", "");

            //preferred statement
            PreparedStatement pf = (PreparedStatement) con.prepareStatement(sql1);
            pf.setString(1, instructorid);
            pf.setString(2, courseid);
            pf.setString(3, subjectid);
            pf.setString(4, percentage);
            pf.setString(5, academicyear);
            pf.executeUpdate();
%>

<jsp:forward page="academicperformance.jsp">
    <jsp:param name="msg" value="Inserted Sucessfully"></jsp:param>
</jsp:forward>

<%        } else {
%>

<jsp:forward page="academicperformance.jsp">
    <jsp:param name="msg" value="Kindly fill all mandatory fields!"></jsp:param>
</jsp:forward>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>