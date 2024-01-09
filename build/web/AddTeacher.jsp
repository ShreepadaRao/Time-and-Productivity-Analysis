<%@page import="java.sql.ResultSet"%>
<%@page import="com.apps.database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Time and Productivity Analysis Management System</title>
        <link href="styles/style.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="styles/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="scripts/jquery-1.5.js"></script>
        <script src="scripts/jquery-ui-1.8.17.custom.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $("#datepicker").datepicker({dateFormat: "yy-mm-dd"}).val()
            });
        </script>
    </head>
    <body>
        <!-- Start of top navigation/header -->
        <div id="header">
            <div id="menu">
                <ul>
                    <li><a href="Admin.jsp">Home</a></li>
                    <li><a href="AddStudent.jsp">Student</a></li>
                    <li class="current_page_item"><a href="AddTeacher.jsp">Teacher</a></li>
                    <li><a href="AddParent.jsp">Parents</a></li>
                    <li><a href="Admincalculation.jsp">Whole Attendance</a></li>
                    <li><a href="leaveapproval.jsp">Leave Approval</a></li>
                    <li><a href="academicperformance.jsp">Academic Performance</a></li>
                    <li><a href="viewacademicperformance.jsp">View Academic Performance</a></li>
                    <li><a href="TeacherPerformance.jsp">Teachers Performance</a></li>
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

                            <form action="codeaddteacher.jsp" method="post">
                                <table border="0px" align="center">
                                    <tr>
                                        <td>Instructor Name:</td>
                                        <td><input type="text" name="name"/></td>
                                    </tr>

                                    <tr>
                                        <td>Coursename:</td>
                                        <td>
                                            <select name="coursename">
                                                <option value="select">-Select-</option>
                                                <%
                                                    try {
                                                        String sql1 = "select * from course";
                                                        DatabaseFile obj1 = new DatabaseFile();
                                                        ResultSet rs1 = obj1.codeselect(sql1);
                                                        while (rs1.next()) {
                                                %>

                                                <option value="<%=rs1.getInt(1)%>"><%=rs1.getString(2)%></option>

                                                <%
                                                        }
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>
                                            </select>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Subject Name:</td>
                                        <td>
                                            <select name="studentname">
                                                <option value="select">-Select-</option>
                                                <%
                                                    try {
                                                        String sql1 = "select * from subject";
                                                        DatabaseFile obj1 = new DatabaseFile();
                                                        ResultSet rs1 = obj1.codeselect(sql1);
                                                        while (rs1.next()) {
                                                %>

                                                <option value="<%=rs1.getInt(1)%>"><%=rs1.getString(2)%></option>

                                                <%
                                                        }
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>
                                            </select>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Username:</td>
                                        <td><input type="text" name="user"/></td>
                                    </tr>
                                    <tr>
                                        <td>Password:</td>
                                        <td><input type="password" name="pass"/></td>
                                    </tr>

                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><input type="submit" value="Submit"/><input type="reset" value="Clear" /></td>
                                    </tr>
                                </table>
                            </form>

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
                            <li><a href="Admin.jsp">Home</a></li>
                            <li><a href="AddStudent.jsp">Student</a></li>
                            <li class="current_page_item"><a href="AddTeacher.jsp">Teacher</a></li>
                            <li><a href="AddParent.jsp">Parents</a></li>
                            <li><a href="Admincalculation.jsp">Whole Attendance</a></li>
                            <li><a href="leaveapproval.jsp">Leave Approval</a></li>
                            <li><a href="academicperformance.jsp">Academic Performance</a></li>
                            <li><a href="viewacademicperformance.jsp">View Academic Performance</a></li>
                            <li><a href="TeacherPerformance.jsp">Teachers Performance</a></li>
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