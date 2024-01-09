<%@page import="java.sql.Time"%>
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
                    <li><a href="StaffDetail.jsp">Staff Details</a></li>
                    <li class="current_page_item"><a href="Stafftimetable.jsp">Staff TimeTable</a></li>
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
                                out.println("<th>Day</th>");
                                out.println("<th>TimeFrom</th>");
                                out.println("<th>TimeTo</th>");
                                out.println("<th>SubjectName</th>");
                                out.println("<tr>");

                                String day = "";

                                try {
                                    String sql = "SELECT DAYNAME(curdate())";
                                    DatabaseFile obj = new DatabaseFile();
                                    ResultSet rs = obj.codeselect(sql);
                                    while (rs.next()) {
                                        day = rs.getString(1);

                                        String sql22 = "SELECT curtime( )";
                                        DatabaseFile obj22 = new DatabaseFile();
                                        ResultSet rs22 = obj22.codeselect(sql22);

                                        while (rs22.next()) {
                                            Time time = rs22.getTime(1);
                                            System.out.println("Actual Time :" + time);

                                            String sql23 = "SELECT adv.TimeFrom, adv.TimeTo, sub.subjectname FROM advancedtimetable AS adv LEFT JOIN subject AS sub ON sub.subjectid = adv.subjectid LEFT JOIN instructor AS i ON i.Instructorid = adv.Instructorid WHERE DAY = '" + day + "' AND TimeFrom >= '" + time + "' AND i.username = '" + user + "';";
                                            DatabaseFile obj23 = new DatabaseFile();
                                            ResultSet rs23 = obj23.codeselect(sql23);

                                            while (rs23.next()) {
                                                out.println("<tr>");
                                                out.println("<td>" + g++ + "</td><td>" + day + "</td><td>" + rs23.getTime("TimeFrom") + "</td><td>" + rs23.getTime("TimeTo") + "</td><td>" + rs23.getString("subjectname") + "</td>");
                                                out.println("</tr>");
                                            }

                                            if (g == 1) {
                                                out.println("<tr>");
                                                out.println("<td></td>");
                                                out.println("<td></td>");
                                                out.println("<td style='color:red;'>No Records Found!</td>");
                                                out.println("<td></td>");
                                                out.println("<td></td>");
                                                out.println("</tr>");
                                            }
                                        }
                                    }

                                    out.println("</table>");
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
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
                            <li><a href="StaffDetail.jsp">Staff Details</a></li>
                            <li class="current_page_item"><a href="Stafftimetable.jsp">Staff TimeTable</a></li>
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