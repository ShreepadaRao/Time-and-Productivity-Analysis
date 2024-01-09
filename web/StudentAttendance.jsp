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
                    <li><a href="studentdetail.jsp">Student Details</a></li>
                    <li class="current_page_item"><a href="StudentAttendance.jsp">TimeTable</a></li>
                    <li><a href="studentparent.jsp">Parents Details</a></li>
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

                                        if (day.trim().equals("Saturday")) {
                            %>
                            <jsp:forward page="sholiday.jsp">
                                <jsp:param name="msg" value="Holiday"></jsp:param>
                            </jsp:forward>
                            <%
                            } else if (day.trim().equals("Sunday")) {
                            %>
                            <jsp:forward page="sholiday.jsp">
                                <jsp:param name="msg" value="Holiday"></jsp:param>
                            </jsp:forward>
                            <%
                            } else {
                                String sql22 = "SELECT curtime( )";
                                DatabaseFile obj22 = new DatabaseFile();
                                ResultSet rs22 = obj22.codeselect(sql22);
                                while (rs22.next()) {
                                    Time time = rs22.getTime(1);
                                    System.out.println("time :" + time);

                                    String t = time.toString().substring(0, time.toString().indexOf(":"));

                                    System.out.println("time :" + t);

                                    int t2 = Integer.parseInt(time.toString().substring(0, time.toString().indexOf(":")));

                                    System.out.println("time :" + t2);

                                    t2++;

                                    String t3 = Integer.toString(t2);

                                    System.out.println("time :" + t3);

                                    String sql23 = "SELECT adv.TimeFrom, adv.TimeTo,sub.subjectname from advancedtimetable as adv left join subject as sub on sub.subjectid = sub.subjectid WHERE Day = '" + day + "' and TimeFrom BETWEEN '" + Time.valueOf(t.concat(":00:00")) + "' AND '" + Time.valueOf(t3.concat(":00:00")) + "' AND TimeTo between  '" + Time.valueOf(t.concat(":00:00")) + "' AND '" + Time.valueOf(t3.concat(":00:00")) + "'";

                                    // String sql23 = "SELECT * FROM advancedtimetable WHERE DAY = 'Thursday' AND TimeFrom BETWEEN '10:00:00' AND '11:00:00' AND TimeTo BETWEEN '10:00:00' AND '11:00:00'";
                                    DatabaseFile obj23 = new DatabaseFile();
                                    ResultSet rs23 = obj23.codeselect(sql23);
                                    if (rs23.next()) {

                                        out.println("<tr>");
                                        out.println("<td>" + g++ + "</td><td>" + day + "</td><td>" + rs23.getTime("TimeFrom") + "</td><td>" + rs23.getTime("TimeTo") + "</td><td>" + rs23.getString("subjectname") + "</td>");
                                        out.println("</tr>");

                                    } else {
                            %>
                            <jsp:forward page="nosschedule.jsp">
                                <jsp:param name="msg" value="No Schedule during this time frame"></jsp:param>
                            </jsp:forward>
                            <%
                                                }
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
                            <li><a href="studentdetail.jsp">Student Details</a></li>
                            <li class="current_page_item"><a href="StudentAttendance.jsp">TimeTable</a></li>
                            <li><a href="studentparent.jsp">Parents Details</a></li>
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