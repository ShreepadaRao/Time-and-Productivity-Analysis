<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%

//session
    String user = session.getAttribute("z").toString();

//getting values from form
    String studentid = request.getParameter("student");
    String subjectid = request.getParameter("subject");
    String learning = request.getParameter("learning");
    String listening = request.getParameter("listening");
    String communication = request.getParameter("communication");
    String answering = request.getParameter("answering");
    String assignment = request.getParameter("assignment");
    String overallrating = request.getParameter("overallrating");
    String feedback = request.getParameter("feedback");
    int instructorid = 0;

    try {
        if (((user != null) && (!user.trim().equals("")))
                && (!studentid.trim().equals("select"))
                && (!subjectid.trim().equals("select"))
                && (!learning.trim().equals("select"))
                && (!listening.trim().equals("select"))
                && (!communication.trim().equals("select"))
                && (!answering.trim().equals("select"))
                && (!assignment.trim().equals("select"))
                && (!overallrating.trim().equals("select"))) {
            String sql = "SELECT Instructorid FROM instructor WHERE username = '" + user + "'";
            DatabaseFile obj = new DatabaseFile();
            ResultSet rs = obj.codeselect(sql);

            while (rs.next()) {
                instructorid = rs.getInt("Instructorid");
            }

            String sql1 = "INSERT INTO student_feedbackdetails(Instructorid, Studentid, subjectid, Learning, Listening, Communication, Answering, Assignment, OverallRating, Feedback, RecordedDate) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendance", "root", "");

            //preferred statement
            PreparedStatement pf = (PreparedStatement) con.prepareStatement(sql1);
            pf.setInt(1, instructorid);
            pf.setString(2, studentid);
            pf.setString(3, subjectid);
            pf.setString(4, learning);
            pf.setString(5, listening);
            pf.setString(6, communication);
            pf.setString(7, answering);
            pf.setString(8, assignment);
            pf.setString(9, overallrating);
            pf.setString(10, feedback);
            pf.executeUpdate();

%>

<jsp:forward page="studentsfeedback.jsp">
    <jsp:param name="msg" value="Inserted Sucessfully"></jsp:param>
</jsp:forward>

<%        } else {
%>

<jsp:forward page="studentsfeedback.jsp">
    <jsp:param name="msg" value="Kindly fill all mandatory fields!"></jsp:param>
</jsp:forward>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>