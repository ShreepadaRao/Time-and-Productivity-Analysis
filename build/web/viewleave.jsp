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
                    <li><a href="welcometeacher.jsp">Welcome</a></li>
                    <li><a href="StaffDetail.jsp">Staff Details</a></li>
                    <li><a href="Stafftimetable.jsp">Staff TimeTable</a></li>
                    <li><a href="extraactivities.jsp">Extracurricular Activities</a></li>
                    <li><a href="viewextraactivities.jsp">View Activities</a></li>
                    <li><a href="applyleave.jsp">Apply Leave</a></li>
                    <li class="current_page_item"><a href="viewleave.jsp">View Leaves</a></li>
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
                                out.println("<th>Leave Type Name</th>");
                                out.println("<th>Leave Date</th>");
                                out.println("<th>Reason</th>");
                                out.println("<th>Status</th>");
                                out.println("<th>Approved/Rejected Date</th>");
                                out.println("<th>Recorded Date</th>");
                                out.println("<th>Delete</th>");
                                out.println("<tr>");

                                try {
                                    String sql = "SELECT l.LeaveId, l.Instructorid, t.leavetypename, l.LeaveDate, l.Reason, l.Status, l.UpdatedDate, l.RecordedDate FROM instructor_leavedetails AS l LEFT JOIN leavetype AS t ON t.leavetypeid = l.leavetypeid LEFT JOIN instructor AS i ON i.Instructorid = l.Instructorid WHERE i.username = '" + user + "' ORDER BY l.RecordedDate DESC";
                                    DatabaseFile obj = new DatabaseFile();
                                    ResultSet rs = obj.codeselect(sql);

                                    while (rs.next()) {
                                        out.println("<tr>");
                                        out.println("<td>" + g++ + "</td>");
                                        out.println("<td>" + rs.getString("leavetypename") + "</td>");
                                        out.println("<td>" + rs.getString("LeaveDate") + "</td>");
                                        out.println("<td>" + rs.getString("Reason") + "</td>");

                                        if (rs.getString("Status").equalsIgnoreCase("0")) {
                                            out.println("<td>UnApproved</td>");
                                        } else {
                                            out.println("<td>Approved</td>");
                                        }

                                        Date UpdatedDate = rs.getDate("UpdatedDate");
                                        
                                        if (null != UpdatedDate) {
                                            out.println("<td>" + rs.getDate("UpdatedDate") + "</td>");
                                        } else {
                                            out.println("<td style='color: red;'>-</td>");
                                        }

                                        out.println("<td>" + rs.getDate("RecordedDate") + "</td>");
                                        out.println("<td><a href='codeLeaveDelete.jsp?index=" + rs.getInt("LeaveId") + "'><img src='images/Delete.png'></img></a></td>");
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
                            <li><a href="StaffDetail.jsp">Staff Details</a></li>
                            <li><a href="Stafftimetable.jsp">Staff TimeTable</a></li>
                            <li><a href="extraactivities.jsp">Extracurricular Activities</a></li>
                            <li><a href="viewextraactivities.jsp">View Activities</a></li>
                            <li><a href="applyleave.jsp">Apply Leave</a></li>
                            <li class="current_page_item"><a href="viewleave.jsp">View Leaves</a></li>
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