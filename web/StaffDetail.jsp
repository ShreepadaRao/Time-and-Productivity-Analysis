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
                    <li><a href="welcometeacher.jsp">Welcome</a></li>
                    <li class="current_page_item"><a href="StaffDetail.jsp">Staff Details</a></li>
                    <li><a href="Stafftimetable.jsp">Staff TimeTable</a></li>
                    <li><a href="extraactivities.jsp">Extracurricular Activities</a></li>
                    <li><a href="viewextraactivities.jsp">View Activities</a></li>
                    <li><a href="applyleave.jsp">Apply Leave</a></li>
                    <li><a href="viewleave.jsp">View Leaves</a></li>
                    <li><a href="studentsfeedback.jsp">Add Feedback</a></li>
                    <li><a href="viewstudentsfeedback.jsp">View Feedback</a></li>
                    <li><a href="updatestaffdetail.jsp">Change Password</a></li>
                    <li><a href="staffsignout.jsp">Signout</a></li>
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
                                String user = session.getAttribute("z").toString();
                                out.println("<h2><font color = red>Welcome:" + user + "</font></h2>");
                            %>

                            <%
                                int g = 1;
                                out.println("<table border='1px' align='center'>");
                                out.println("<tr>");
                                out.println("<th>Sno</th>");
                                out.println("<th>InstructorName</th>");
                                out.println("<th>Coursename</th>");
                                out.println("<th>Handling Subject</th>");
                                out.println("<tr>");

                                try {
                                    String sql = "select stu.InstructorName, cou.coursename, sub.subjectname from instructor as stu left join  course as cou on cou.courseid  = stu.courseid left join subject as sub on sub.subjectid = stu .subjectid where stu.username = '" + user + "'";
                                    DatabaseFile obj = new DatabaseFile();
                                    ResultSet rs = obj.codeselect(sql);
                                    while (rs.next()) {
                                        out.println("<tr>");
                                        out.println("<td>" + g++ + "</td><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td>");
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
                            <li><a href="welcometeacher.jsp">Welcome</a></li>
                            <li class="current_page_item"><a href="StaffDetail.jsp">Staff Details</a></li>
                            <li><a href="Stafftimetable.jsp">Staff TimeTable</a></li>
                            <li><a href="extraactivities.jsp">Extracurricular Activities</a></li>
                            <li><a href="viewextraactivities.jsp">View Activities</a></li>
                            <li><a href="applyleave.jsp">Apply Leave</a></li>
                            <li><a href="viewleave.jsp">View Leaves</a></li>
                            <li><a href="studentsfeedback.jsp">Add Feedback</a></li>
                            <li><a href="viewstudentsfeedback.jsp">View Feedback</a></li>
                            <li><a href="updatestaffdetail.jsp">Change Password</a></li>
                            <li><a href="staffsignout.jsp">Signout</a></li>
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