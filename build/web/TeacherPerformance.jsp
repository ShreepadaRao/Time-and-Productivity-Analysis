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
                    <li><a href="Adminhome.jsp">Home</a></li>
                    <li><a href="AddStudent.jsp">Student</a></li>
                    <li><a href="AddTeacher.jsp">Teacher</a></li>
                    <li><a href="AddParent.jsp">Parents</a></li>
                    <li><a href="Admincalculation.jsp">Whole Attendance</a></li>
                    <li><a href="leaveapproval.jsp">Leave Approval</a></li>
                    <li><a href="academicperformance.jsp">Academic Performance</a></li>
                    <li><a href="viewacademicperformance.jsp">View Academic Performance</a></li>
                    <li class="current_page_item"><a href="TeacherPerformance.jsp">Teachers Performance</a></li>
                    <li><a href="changeadmin.jsp">Change Password</a></li>
                    <li><a href="signout.jsp">Signout</a></li>
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
                                String user = session.getAttribute("y").toString();
                                out.println("<h2><font color = red>Welcome:" + user + "</font></h2>");
                            %>

                            <%
                                int g = 1;
                                out.println("<table border='1px' align='center'>");
                                out.println("<tr>");
                                out.println("<th>Sno</th>");
                                out.println("<th>Instructor Id</th>");
                                out.println("<th>Instructor Name</th>");
                                out.println("<th>Course Name</th>");
                                out.println("<th>Subject Name</th>");
                                out.println("<th>Graph</th>");
                                out.println("<tr>");

                                try {
                                    String sql = "SELECT i.Instructorid, i.InstructorName, c.coursename, s.subjectname FROM instructor AS i LEFT JOIN subject AS s ON s.subjectid = i.subjectid LEFT JOIN course AS c ON c.courseid = i.courseid ORDER BY i.Instructorid DESC";
                                    DatabaseFile obj = new DatabaseFile();
                                    ResultSet rs = obj.codeselect(sql);
                                    
                                    while (rs.next()) {
                                        out.println("<tr>");
                                        out.println("<td>" + g++ + "</td>");
                                        out.println("<td>" + rs.getString("Instructorid") + "</td>");
                                        out.println("<td>" + rs.getString("InstructorName") + "</td>");
                                        out.println("<td>" + rs.getString("coursename") + "</td>");
                                        out.println("<td>" + rs.getString("subjectname") + "</td>");
                                        out.println("<td><a href='codeViewGraph.jsp?index=" + rs.getInt("Instructorid") + "'><img src='images/View.png'></img></a></td>");
                                        out.println("</tr>");
                                    }

                                    if (g == 1) {
                                        out.println("<tr>");
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
                            <li><a href="Adminhome.jsp">Home</a></li>
                            <li><a href="AddStudent.jsp">Student</a></li>
                            <li><a href="AddTeacher.jsp">Teacher</a></li>
                            <li><a href="AddParent.jsp">Parents</a></li>
                            <li><a href="Admincalculation.jsp">Whole Attendance</a></li>
                            <li><a href="leaveapproval.jsp">Leave Approval</a></li>
                            <li><a href="academicperformance.jsp">Academic Performance</a></li>
                            <li><a href="viewacademicperformance.jsp">View Academic Performance</a></li>
                            <li class="current_page_item"><a href="TeacherPerformance.jsp">Teachers Performance</a></li>
                            <li><a href="changeadmin.jsp">Change Password</a></li>
                            <li><a href="signout.jsp">Signout</a></li>
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