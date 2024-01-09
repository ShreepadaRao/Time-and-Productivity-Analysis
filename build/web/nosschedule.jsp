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
                    <li class="current_page_item"><a href="StudentAttendance.jsp">TimeTable</a></li>
                    <li><a href="studentparent.jsp">Parents</a></li>
                    <li><a href="instructorsfeedback.jsp">Add Feedback</a></li>
                    <li><a href="viewinstructorsfeedback.jsp">View Feedback</a></li>
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
                        </p>

                        <%
                            try {
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
                            <li class="current_page_item"><a href="StudentAttendance.jsp">TimeTable</a></li>
                            <li><a href="studentparent.jsp">Parents</a></li>
                            <li><a href="instructorsfeedback.jsp">Add Feedback</a></li>
                            <li><a href="viewinstructorsfeedback.jsp">View Feedback</a></li>
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