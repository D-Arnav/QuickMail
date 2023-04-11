
<%@ page import="java.sql.*" %><%
  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmailBase?useSSL=false&allowPublicKeyRetrieval=true", "root", "root");
    Statement stmt = con.createStatement();
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String sql = "SELECT * FROM users WHERE email = '" + email + "' AND password = '" + password + "'";
    ResultSet rs = stmt.executeQuery(sql);
    if (rs.next()) {
      response.sendRedirect("home.jsp?email=" + email);
    } else {
      response.sendRedirect("index.jsp?login=false");
    }
    con.close();
  } catch (Exception e) {
    out.println(e);
  }

%>