<%@ page import="java.sql.*" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmailBase?useSSL=false&allowPublicKeyRetrieval=true", "root", "root");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String date = dtf.format(now);
        if (from != null) {
            String sql = "INSERT INTO emails VALUES('" + from + "', '" + to + "', '" + subject + "', '" + content + "', '" + date + "')";
            Statement stmt = con.createStatement();
            stmt.executeUpdate(sql);
            out.println("<h1>Email Sent Successfully</h1>");
        } else {
            out.println("Sending Failed");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>