<%@page import="com.apps.database.*"%>
<%@page import="java.sql.*"%>
<%

//session
String user = session.getAttribute("z").toString();

//getting values from form
String leavetypeid = request.getParameter("leavetype");
String reason = request.getParameter("reason");
String leaveDate = request.getParameter("datepicker");
int instructorid = 0;

try
{
    if( ((user!=null) && (!user.trim().equals(""))) 
            && (!leavetypeid.trim().equals("select")) 
            && ((leaveDate!=null) && (!leaveDate.trim().equals(""))))
    {   
        String sql = "SELECT Instructorid FROM instructor WHERE username = '"+user+"'";
        DatabaseFile obj = new DatabaseFile();
        ResultSet rs = obj.codeselect(sql);

        while(rs.next())
        {
            instructorid = rs.getInt("Instructorid");
        }
                                     
        String sql1 = "INSERT INTO instructor_leavedetails(Instructorid, leavetypeid, LeaveDate, Reason, Status, RecordedDate) VALUES(?, ?, ?, ?, ?, now())";
    
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendance", "root", "");
            
        //preferred statement
        PreparedStatement pf = (PreparedStatement) con.prepareStatement(sql1);
        pf.setInt(1, instructorid);
        pf.setString(2, leavetypeid);
        pf.setString(3, leaveDate);
        pf.setString(4, reason);
        pf.setString(5, "0");
        pf.executeUpdate();
                      
        %>

        <jsp:forward page="applyleave.jsp">
            <jsp:param name="msg" value="Inserted Sucessfully"></jsp:param>
        </jsp:forward>

        <%
    }
    else
    {
        %>
    
        <jsp:forward page="applyleave.jsp">
            <jsp:param name="msg" value="Kindly fill all mandatory fields!"></jsp:param>
        </jsp:forward>

        <%
    }        
}
catch(Exception e)
{
    e.printStackTrace();
}
%>