<%@page import="java.sql.ResultSet"%>
<%@page import="com.apps.database.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@page import="java.util.*"%>
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
                                String dataPoints = "";
                            %>

                            <%
                                try 
                                {
                                    String instructorId = request.getParameter("index");

                                    if (null != instructorId && !instructorId.equalsIgnoreCase("")) 
                                    {
                                        String sql = "SELECT t.FeedbackId, st.Studentname, i.InstructorName, s.subjectname, AVG( r1.rating ) AS Concept_Explanation, AVG( r2.rating ) AS Practical_Explanation, AVG( r3.rating ) AS Example_Explanation, t.Feedback, t.RecordedDate FROM instructor_feedbackdetails AS t LEFT JOIN student AS st ON st.Studentid = t.Studentid LEFT JOIN subject AS s ON s.subjectid = t.subjectid LEFT JOIN ratingdetails AS r1 ON r1.ratingid = t.Concept_Explanation LEFT JOIN ratingdetails AS r2 ON r2.ratingid = t.Practical_Explanation LEFT JOIN ratingdetails AS r3 ON r3.ratingid = t.Example_Explanation LEFT JOIN instructor AS i ON i.Instructorid = t.Instructorid WHERE t.Instructorid = '" + instructorId + "' ORDER BY t.RecordedDate DESC";
                                        DatabaseFile obj = new DatabaseFile();
                                        ResultSet rs = obj.codeselect(sql);

                                        Gson gsonObj = new Gson();
                                        Map<Object,Object> map = null;
                                        List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

                                        if (rs.next()) 
                                        {
                                            String instructorName = rs.getString("InstructorName");

                                            if (null != instructorName) 
                                            {
                                                Double percentage = 0.0;
                                                Double workshop = 0.0;
                                                Double lecture = 0.0;
                                                Double journals = 0.0;
                                                Double certifications = 0.0;
                                                Double webinars = 0.0;
                                                
                                                String sql1 = "SELECT AVG(a.Percentage) AS Percentage FROM instructor_academicdetails AS a WHERE a.Instructorid = " + instructorId ;
                                                ResultSet rs1 = obj.codeselect(sql1);
                                                while (rs1.next())
                                                {
                                                   if(rs1.getDouble("Percentage") != 0)
                                                   {
                                                        percentage = rs1.getDouble("Percentage")/10; 
                                                   }
                                                }
                                                
                                                System.out.println(percentage);
                                                
                                                String sql2 = "SELECT COUNT(*) AS workshop FROM instructor_extracurricular WHERE Instructorid = '"+ instructorId +"' AND categoryid = 1";
                                                ResultSet rs2 = obj.codeselect(sql2);
                                                while (rs2.next())
                                                {
                                                   if(rs2.getDouble("workshop") != 0)
                                                   {
                                                        workshop = rs2.getDouble("workshop") * 10/ rs2.getDouble("workshop"); 
                                                   }
                                                }
                                                
                                                System.out.println(workshop);
                                                
                                                String sql3 = "SELECT COUNT(*) AS lecture FROM instructor_extracurricular WHERE Instructorid = '"+ instructorId +"' AND categoryid = 2";
                                                ResultSet rs3 = obj.codeselect(sql3);
                                                while (rs3.next())
                                                {
                                                   if(rs3.getDouble("lecture") != 0)
                                                   {
                                                        lecture = rs3.getDouble("lecture") * 10/ rs3.getDouble("lecture"); 
                                                   }
                                                }
                                                
                                                System.out.println(lecture);
                                                
                                                String sql4 = "SELECT COUNT(*) AS journals FROM instructor_extracurricular WHERE Instructorid = '"+ instructorId +"' AND categoryid = 3";
                                                ResultSet rs4 = obj.codeselect(sql4);
                                                while (rs4.next())
                                                {
                                                    if(rs4.getDouble("journals") != 0)
                                                    {
                                                        journals = rs4.getDouble("journals") * 10/ rs4.getDouble("journals"); 
                                                    }
                                                }
                                                
                                                System.out.println(journals);
                                                
                                                String sql5 = "SELECT COUNT(*) AS certifications FROM instructor_extracurricular WHERE Instructorid = '"+ instructorId +"' AND categoryid = 4";
                                                ResultSet rs5 = obj.codeselect(sql5);
                                                while (rs5.next())
                                                {
                                                    if(rs5.getDouble("certifications") != 0)
                                                    {
                                                        certifications = rs5.getDouble("certifications") * 10/ rs5.getDouble("certifications"); 
                                                    }
                                                }
                                                
                                                System.out.println(certifications);

                                                String sql6 = "SELECT COUNT(*) AS webinars FROM instructor_extracurricular WHERE Instructorid = '"+ instructorId +"' AND categoryid = 5";
                                                ResultSet rs6 = obj.codeselect(sql6);
                                                while (rs6.next())
                                                {
                                                    if(rs6.getDouble("webinars") != 0)
                                                    {
                                                        webinars = rs6.getDouble("webinars") * 10/ rs6.getDouble("webinars"); 
                                                    }
                                                }
                                                
                                                System.out.println(webinars);

                                                Double rating = rs.getDouble("Concept_Explanation") * 2
                                                        + rs.getDouble("Practical_Explanation") * 2
                                                        + rs.getDouble("Example_Explanation") * 2
                                                        + percentage * 2;

                                                System.out.println("Rating::" + rating);
                                                
                                                Double extras = (workshop + lecture + journals + certifications + webinars) * 2;
                                                
                                                System.out.println("Extras::" + extras);
                                                
                                                map = new HashMap<Object,Object>(); 
                                                map.put("label", "Performance Rating"); 
                                                map.put("y", rating);
                                                list.add(map);
                                                
                                                map = new HashMap<Object,Object>(); 
                                                map.put("label", "Extra Curricular Activity"); 
                                                map.put("y", extras); 
                                                list.add(map);

                                                dataPoints = gsonObj.toJson(list);  
                                                
                                                if(rating >= 70)
                                                {
                                                    out.println("<h2><font color = red>Good Performance</font></h2>");
                                                }
                                                else
                                                {
                                                    out.println("<h2><font color = red>Low Performance</font></h2>");
                                                }
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
                                        title: {
                                                text: "Teacher Performance Graph By Category"
                                        },
                                        axisX: {
                                                title: "Category"
                                        },
                                        axisY: {
                                                title: "Percentage(%)",
                                                includeZero: true
                                        },
                                        data: [{
                                                type: "column",
                                                yValueFormatString: "##.#0 '%'",
                                                dataPoints: <%out.print(dataPoints);%>
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