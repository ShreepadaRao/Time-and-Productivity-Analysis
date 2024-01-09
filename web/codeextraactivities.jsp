<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%

//session
    String user = session.getAttribute("z").toString();

//getting values from form
    String categoryid = request.getParameter("category");
    String name = request.getParameter("name");
    String subject = request.getParameter("subject");
    String venue = request.getParameter("venue");
    String description = request.getParameter("description");
    String attendedDate = request.getParameter("datepicker");
    int instructorid = 0;

    try {
        if (((user != null) && (!user.trim().equals("")))
                && (!categoryid.trim().equals("select"))
                && ((name != null) && (!name.trim().equals("")))
                && ((subject != null) && (!subject.trim().equals("")))
                && ((venue != null) && (!venue.trim().equals("")))
                && ((attendedDate != null) && (!attendedDate.trim().equals("")))) {
            String sql = "SELECT Instructorid FROM instructor WHERE username = '" + user + "'";
            DatabaseFile obj = new DatabaseFile();
            ResultSet rs = obj.codeselect(sql);

            while (rs.next()) {
                instructorid = rs.getInt("Instructorid");
            }

            String sql1 = "INSERT INTO instructor_extracurricular(Instructorid, categoryid, Name, Subject, Venue, Description, AttendedDate, RecordedDate) VALUES(?,?,?,?,?,?,?, now())";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendance", "root", "");

            //preferred statement
            PreparedStatement pf = (PreparedStatement) con.prepareStatement(sql1);
            pf.setInt(1, instructorid);
            pf.setString(2, categoryid);
            pf.setString(3, name);
            pf.setString(4, subject);
            pf.setString(5, venue);
            pf.setString(6, description);
            pf.setString(7, attendedDate);
            pf.executeUpdate();

%>

<jsp:forward page="extraactivities.jsp">
    <jsp:param name="msg" value="Inserted Sucessfully"></jsp:param>
</jsp:forward>

<%        } else {
%>

<jsp:forward page="extraactivities.jsp">
    <jsp:param name="msg" value="Kindly fill all mandatory fields!"></jsp:param>
</jsp:forward>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>