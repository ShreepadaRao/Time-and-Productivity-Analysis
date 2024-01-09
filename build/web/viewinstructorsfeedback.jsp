<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.apps.database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Time and Productivity Analysis Management System</title>
        <link href="styles/style.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <body>
        <!-- Start of top navigation/header -->
        <div id="header">
            <div id="menu">
                <ul>
                    <li><a href="welcomeStudent.jsp">Welcome</a></li>
                    <li><a href="studentdetail.jsp">Student Details</a></li>
                    <li><a href="StudentAttendance.jsp">TimeTable</a></li>
                    <li><a href="studentparent.jsp">Parents</a></li>
                    <li><a href="instructorsfeedback.jsp">Add Feedback</a></li>
                    <li class="current_page_item"><a href="viewinstructorsfeedback.jsp">View Feedback</a></li>
                    <li><a href="studentperformance.jsp">Performance</a></li>
                    <li><a href="overallperformance.jsp">Overall Performance</a></li>
                    <li><a href="updatestudentdetails.jsp">Change Password</a></li>
                    <li><a href="studentsignout.jsp">Signout</a></li>
                </ul>
            </div>
        </div>
        <!-- End of top navigation/header -->

        <!-- Start of logo -->
        <div id="logo">
            <h1><a href="#">Time and Productivity Analysis Management System</a></h1>
            <!--<h2></h2> -->
        </div>
        <!-- End of logo -->

        <hr />

        <!-- Start of actual page -->
        <div id="page">
            <div id="content">
                <div class="news">
                    <h1 class="title"><a href="#">Time and Productivity Analysis Management System</a></h1>
                    <!--<p class="meta"><small>Posted on August 10th, 2008 by <a href="#">D.Juwara</a></small></p> -->
                    <div class="entry">
                        <p>
                            <%
                                String user = session.getAttribute("x").toString();
                                out.println("<h2><font color = red>Welcome:" + user + "</font></h2>");
                            %>

                            <%
                                int g = 1;
                                out.println("<table border='1px' align='center'>");
                                out.println("<tr>");
                                out.println("<th>Sno</th>");
                                out.println("<th>Instructor Name</th>");
                                out.println("<th>Subject Name</th>");
                                out.println("<th>Concept Explanation Rating</th>");
                                out.println("<th>Practical Explanation Rating</th>");
                                out.println("<th>Explanation With Example Rating</th>");
                                out.println("<th>Feedback</th>");
                                out.println("<th>Recorded Date</th>");
                                out.println("<th>Delete</th>");
                                out.println("<tr>");

                                try {
                                    String sql = "SELECT t.FeedbackId, st.Studentname, i.InstructorName, s.subjectname, AVG(r1.rating) AS Concept_Explanation, AVG(r2.rating) AS Practical_Explanation, AVG(r3.rating) AS Example_Explanation, t.Feedback, t.RecordedDate FROM instructor_feedbackdetails AS t LEFT JOIN instructor AS i ON i.Instructorid = t.Instructorid  LEFT JOIN subject AS s ON s.subjectid = t.subjectid  LEFT JOIN ratingdetails AS r1 ON r1.ratingid = t.Concept_Explanation LEFT JOIN ratingdetails AS r2 ON r2.ratingid = t.Practical_Explanation LEFT JOIN ratingdetails AS r3 ON r3.ratingid = t.Example_Explanation  LEFT JOIN student AS st ON st.Studentid = t.Studentid  WHERE st.username = '" + user + "' ORDER BY t.RecordedDate DESC";
                                    DatabaseFile obj = new DatabaseFile();
                                    ResultSet rs = obj.codeselect(sql);

                                    while (rs.next()) {
                                        String instructorName = rs.getString("InstructorName");
                                        
                                        if(null != instructorName)
                                        {
                                            out.println("<tr>");
                                            out.println("<td>" + g++ + "</td>");
                                            out.println("<td>" + rs.getString("InstructorName") + "</td>");
                                            out.println("<td>" + rs.getString("subjectname") + "</td>");
                                            out.println("<td>" + rs.getString("Concept_Explanation") + "</td>");
                                            out.println("<td>" + rs.getString("Practical_Explanation") + "</td>");
                                            out.println("<td>" + rs.getString("Example_Explanation") + "</td>");
                                            out.println("<td>" + rs.getString("Feedback") + "</td>");
                                            out.println("<td>" + rs.getDate("RecordedDate") + "</td>");
                                            out.println("<td><a href='codeIFeedbackDelete.jsp?index=" + rs.getInt("FeedbackId") + "'><img src='images/Delete.png'></img></a></td>");
                                            out.println("</tr>");
                                        }
                                    }

                                    if (g == 1) {
                                        out.println("<tr>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td style='color:red;'>No Records Found!</td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("</tr>");
                                    }

                                    out.println("</table>");
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }

                            %>

                        </p>

                        <%                                    try {
                                if ((request.getParameter("msg") != null) && (!request.getParameter("msg").trim().equals(""))) {
                                    out.println("<h2><font color = red>" + request.getParameter("msg") + "</font></h2>");
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>

                    </div>
                </div>
            </div>

            <div id="right" class="right">
                <ul>
                    <li>
                        <h2>Title</h2>
                        <ul>
                            <li><a href="welcomeStudent.jsp">Welcome</a></li>
                            <li><a href="studentdetail.jsp">Student Details</a></li>
                            <li><a href="StudentAttendance.jsp">TimeTable</a></li>
                            <li><a href="studentparent.jsp">Parents</a></li>
                            <li><a href="instructorsfeedback.jsp">Add Feedback</a></li>
                            <li class="current_page_item"><a href="viewinstructorsfeedback.jsp">View Feedback</a></li>
                            <li><a href="studentperformance.jsp">Performance</a></li>
                            <li><a href="overallperformance.jsp">Overall Performance</a></li>
                            <li><a href="updatestudentdetails.jsp">Change Password</a></li>
                            <li><a href="studentsignout.jsp">Signout</a></li>
                        </ul>
                    </li>
                    <!--<li>
                            <h2>Affiliates</h2>
                            <ul>
                                    <li><a href="http://www.zymic.com">Zymic</a></li>
                                    <li><a href="http://www.runelocus.com">RuneLocus</a></li>
                                    <li><a href="#">Link</a></li>
                                    <li><a href="#">Link</a></li>
                            </ul>
                    </li> -->
                </ul>
            </div>
            <div style="clear: both;">&nbsp;</div>
        </div>
        <!-- End of actual page -->

        <!-- Start of footer -->
        <!-- Do not remove copyright, thank you. -->
        <div id="footer">
            <p><a><a>&copy; 2023 All Rights Reserved.</a></p>
        </div>
        <!-- End of footer -->
</html>