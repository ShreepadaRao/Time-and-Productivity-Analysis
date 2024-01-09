<%@page session="true" %>
<%
    try {
        session.invalidate();

%>
<jsp:forward page="index.jsp" ></jsp:forward>
<%        } catch (Exception e) {
        e.printStackTrace();
    }
%>