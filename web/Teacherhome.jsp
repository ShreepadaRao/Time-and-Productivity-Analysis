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
                    <li ><a href="index.jsp">Home</a></li>
                    <li><a href="Studenthome.jsp">Student</a></li>
                    <li class="current_page_item"><a href="Teacherhome.jsp">Teacher</a></li>
                    <li><a href="Parentshome.jsp">Parents</a></li>
                    <li><a href="Adminhome.jsp">Admin</a></li>
                    <!--			<li><a href="#">Signout</a></li>-->
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
                        <p>Teacher Login Form</p>
                        <form action="codeteachershome.jsp" method="post">
                            <table border="0px" align="center">
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
                                        <td><input type="submit" value="Login"/><input type="reset" value="Clear" /></td>
                                </tr>
                            </table>
                        </form>
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
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="Studenthome.jsp">Student</a></li>
                            <li><a href="Teacherhome.jsp">Teacher</a></li>
                            <li><a href="Parentshome.jsp">Parents</a></li>
                            <li><a href="Adminhome.jsp">Admin</a></li>
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