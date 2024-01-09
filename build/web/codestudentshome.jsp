<%@page import="java.sql.*"%>
<%@page import="com.apps.database.*"%>
<%@page session="true" %>
<%
    ResultSet rs = null;
    ResultSet rs1 = null;
    try {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        if (((username != null) && (!username.trim().equals(""))) && ((password != null) && (!password.trim().equals("")))) {
            String sql12 = "select * from  student where Studentid = '" + username + "' and password = '" + password + "'";
            DatabaseFile db = new DatabaseFile();
            rs = db.codeselect(sql12);

            if (rs.next()) {
                session.setAttribute("x", rs.getString("username"));
                System.out.println(password);

                String day = "";
                int subjectid = 0;

                String sql = "SELECT DAYNAME(curdate())";
                DatabaseFile obj = new DatabaseFile();
                ResultSet rs2 = obj.codeselect(sql);
                while (rs2.next()) {
                    day = rs2.getString(1);

                    out.println("<tr>");
                    out.println("<td>" + day + "</td>");
                    out.println("</tr>");

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

        String sql23 = "SELECT * from advancedtimetable WHERE Day = '" + day + "' and TimeFrom BETWEEN '" + Time.valueOf(t.concat(":00:00")) + "' AND '" + Time.valueOf(t3.concat(":00:00")) + "' AND TimeTo between  '" + Time.valueOf(t.concat(":00:00")) + "' AND '" + Time.valueOf(t3.concat(":00:00")) + "'";

        // String sql23 = "SELECT * FROM advancedtimetable WHERE DAY = 'Thursday' AND TimeFrom BETWEEN '10:00:00' AND '11:00:00' AND TimeTo BETWEEN '10:00:00' AND '11:00:00'";
        DatabaseFile obj23 = new DatabaseFile();
        ResultSet rs23 = obj23.codeselect(sql23);
        if (rs23.next()) {
            subjectid = rs23.getInt("subjectid");

            String sql1 = "insert into  attendance(Studentid, subjectid, Status, Time, Date ) values('" + Integer.parseInt(username) + "', '" + subjectid + "', 'P', curtime(), curdate())";
            db.codeinsert(sql1);

%>
<jsp:forward page="welcomeStudent.jsp"></jsp:forward>
<%                                                        } else {
%>
<jsp:forward page="nosschedule.jsp">
    <jsp:param name="msg" value="No Schedule during this time"></jsp:param>
</jsp:forward>
<%
                }
            }
        }
    }
} else {
%>
<jsp:forward page="Studenthome.jsp">
    <jsp:param name="msg" value="Incorrect Username or Password"></jsp:param>
</jsp:forward>
<%
    }
} else {
%>
<jsp:forward page="Studenthome.jsp">
    <jsp:param name="msg" value="Please Fill Username or Password"></jsp:param>
</jsp:forward>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>