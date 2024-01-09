<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.apps.database.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Time and Productivity Analysis Management System</title>
        <link href="styles/style.css" rel="stylesheet" type="text/css" media="screen" />
        <script src="scripts/canvasjs.min.js"></script>
    </head>
    <body>
        <!-- Start of top navigation/header -->
        <div id="header">
            <div id="menu">
                <ul>
                    <li><a href="welcomeStudent.jsp">Welcome</a></li>
                    <li><a href="studentdetail.jsp">Student Details</a></li>
                    <li><a href="StudentAttendance.jsp">TimeTable</a></li>
                    <li><a href="studentparent.jsp">Parents Details</a></li>
                    <li><a href="instructorsfeedback.jsp">Add Feedback</a></li>
                    <li><a href="viewinstructorsfeedback.jsp">View Feedback</a></li>
                    <li class="current_page_item"><a href="studentperformance.jsp">Performance</a></li>
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
                                String dataPoints = "";
                            %>

                            <%
                                try 
                                {
                                    String sql = "SELECT sf.FeedbackId, i.InstructorName, st.Studentname, s.subjectname, AVG(r1.rating) AS learning, AVG(r2.rating) AS listening, AVG(r3.rating) AS communication, AVG(r4.rating) AS answering, AVG(r5.rating) AS assignment, AVG(r6.rating) AS overallrating, sf.Feedback, sf.RecordedDate FROM student_feedbackdetails AS sf  LEFT JOIN instructor AS i ON i.Instructorid = sf.Instructorid  LEFT JOIN subject AS s ON s.subjectid = sf.subjectid  LEFT JOIN ratingdetails AS r1 ON r1.ratingid = sf.Learning LEFT JOIN ratingdetails AS r2 ON r2.ratingid = sf.Listening LEFT JOIN ratingdetails AS r3 ON r3.ratingid = sf.Communication LEFT JOIN ratingdetails AS r4 ON r4.ratingid = sf.Answering LEFT JOIN ratingdetails AS r5 ON r5.ratingid = sf.Assignment LEFT JOIN ratingdetails AS r6 ON r6.ratingid = sf.OverallRating LEFT JOIN student AS st ON st.Studentid = sf.Studentid  WHERE st.username = '" + user + "' ORDER BY sf.RecordedDate DESC";
                                    DatabaseFile obj = new DatabaseFile();
                                    ResultSet rs = obj.codeselect(sql);
                                    
                                    Gson gsonObj = new Gson();
                                    Map<Object,Object> map = null;
                                    List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

                                    if (rs.next()) 
                                    {
                                        String instructorName = rs.getString("InstructorName");
                                        
                                        if(null != instructorName)
                                        {
                                            map = new HashMap<Object,Object>(); map.put("label", "Learning"); 
                                            map.put("y", rs.getDouble("learning"));
                                            map.put("exploded", true); 
                                            list.add(map);
                                            
                                            map = new HashMap<Object,Object>(); map.put("label", "Listening"); 
                                            map.put("y", rs.getDouble("listening")); 
                                            list.add(map);
                                            
                                            map = new HashMap<Object,Object>(); map.put("label", "Communication"); 
                                            map.put("y", rs.getDouble("communication")); 
                                            list.add(map);
                                            
                                            map = new HashMap<Object,Object>(); map.put("label", "Answering"); 
                                            map.put("y", rs.getDouble("answering")); 
                                            list.add(map);
                                            
                                            map = new HashMap<Object,Object>(); map.put("label", "Assignment"); 
                                            map.put("y", rs.getDouble("assignment")); 
                                            list.add(map);
                                            
                                            map = new HashMap<Object,Object>(); map.put("label", "OverallRating"); 
                                            map.put("y", rs.getDouble("overallrating")); 
                                            list.add(map);
                                            
                                            dataPoints = gsonObj.toJson(list);                                            
                                        } 
                                        else 
                                        {
                                            out.println("<h2><font color = red>Sufficient data is not yet avilable to generate graph.</font></h2>");
                                        }
                                    } 
                                    else 
                                    {
                                        out.println("<h2><font color = red>Sufficient data is not yet avilable to generate graph.</font></h2>");
                                    }
                                } 
                                catch (Exception e) 
                                {
                                    e.printStackTrace();
                                }
                            %>
                            
                            <script type="text/javascript">
                                window.onload = function() { 
                                var chart = new CanvasJS.Chart("chartContainer", {
                                        theme: "light2",
                                        animationEnabled: true,
                                        exportFileName: "Student Performance Graph By Category",
                                        exportEnabled: true,
                                        title:{
                                                text: "Student Performance Graph By Category"
                                        },
                                        data: [{
                                                type: "pie",
                                                showInLegend: true,
                                                legendText: "{label}",
                                                toolTipContent: "{label}: <strong>{y}%</strong>",
                                                indexLabel: "{label} {y}%",
                                                dataPoints : <%out.print(dataPoints);%>
                                        }]
                                });

                                chart.render();
                                }
                            </script>
                                        
                            <div id="chartContainer" style="height: 370px; width: 100%;"></div>
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
                            <li><a href="studentparent.jsp">Parents Details</a></li>
                            <li><a href="instructorsfeedback.jsp">Add Feedback</a></li>
                            <li><a href="viewinstructorsfeedback.jsp">View Feedback</a></li>
                            <li class="current_page_item"><a href="studentperformance.jsp">Performance</a></li>
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