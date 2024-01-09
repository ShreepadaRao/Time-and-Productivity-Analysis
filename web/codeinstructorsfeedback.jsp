<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%

//session
    String user = session.getAttribute("x").toString();

//getting values from form
    String instructorid = request.getParameter("instructor");
    String subjectid = request.getParameter("subject");
    String concept = request.getParameter("concept");
    String practical = request.getParameter("practical");
    String example = request.getParameter("example");
    String feedback = request.getParameter("feedback");
    int studentid = 0;

    try {
        if (((user != null) && (!user.trim().equals("")))
                && (!instructorid.trim().equals("select"))
                && (!subjectid.trim().equals("select"))
                && (!concept.trim().equals("select"))
                && (!practical.trim().equals("select"))
                && (!example.trim().equals("select"))) {
            String sql = "SELECT Studentid FROM student WHERE username = '" + user + "'";
            DatabaseFile obj = new DatabaseFile();
            ResultSet rs = obj.codeselect(sql);

            while (rs.next()) {
                studentid = rs.getInt("Studentid");
            }

            String sql1 = "INSERT INTO instructor_feedbackdetails(Instructorid, Studentid, subjectid, Concept_Explanation, Practical_Explanation, Example_Explanation, Feedback, RecordedDate) VALUES(?, ?, ?, ?, ?, ?, ?, now())";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendance", "root", "");

            //preferred statement
            PreparedStatement pf = (PreparedStatement) con.prepareStatement(sql1);
            pf.setString(1, instructorid);
            pf.setInt(2, studentid);
            pf.setString(3, subjectid);
            pf.setString(4, concept);
            pf.setString(5, practical);
            pf.setString(6, example);
            pf.setString(7, feedback);
            pf.executeUpdate();
%>

<jsp:forward page="instructorsfeedback.jsp">
    <jsp:param name="msg" value="Inserted Sucessfully"></jsp:param>
</jsp:forward>

<%        } else {
%>

<jsp:forward page="instructorsfeedback.jsp">
    <jsp:param name="msg" value="Kindly fill all mandatory fields!"></jsp:param>
</jsp:forward>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>