<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
%>
<html lang="en">
<head>
    <title>Welcome <% out.print(email); %>!!</title>
    <script>
        function compose(){
            window.location.href="compose.jsp?email=<% out.print(email); %>";
        }
    </script>
    <style>
        .container {
            display: grid;
            grid-template-columns: 1fr 6fr;
            grid-template-rows: 1fr 6fr;
            grid-template-areas: "header header" "sidebar main";
            gap: 10px 10px;
            height: 100vh;
        }

        .header {
            grid-area: header;
            background-color: #f1f1f1;
            padding: 10px;
            font-size: 28px;
            font-family: sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .sidebar {
            grid-template-areas: "compose" "logout";
            grid-area: sidebar;
            background-color: #f1f1f1;
            padding: 10px;
        }

        .main {
            grid-area: main;
            background-color: #f1f1f1;
            padding: 10px;
        }

        .emails {
            display: flex;
            flex-direction: column;
            height: 100%;
            padding: 10px;
        }

        .email {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            box-shadow: 0 0 5px 0 rgba(0,0,0,0.3);
            margin-top: 10px;
        }

        .compose {
            height: 75px;
            padding: 10px;
            border: none;
            background-color: #333;
            width: 100%;
            color: white;
            font-size: 16px;
            font-family: sans-serif;
            cursor: pointer;
        }
    </style>
</head>

<body>
<div class="container">

    <div class="header"> Hello <% out.print(email); %>! You can view your emails here! </div>

    <div class="sidebar">
        <button class="compose" onclick="compose()">Compose</button>
    </div>

    <div class="main">
        <div class="emails">
            <%
                try {
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmailBase", "root", "root");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("select * from emails where `to`='" + email + "'");

                    while (rs.next()) {
                        out.println("<button class='email'>");
                        out.println("<span class='from'><b>From:</b> " + rs.getString("from") + "</span>");
                        out.println("<span class='subject'><b>Subject:</b> " + rs.getString("subject") + "</span>");
                        out.println("<span class='content'>" + rs.getString("content") + "</span>");
                        out.println("<span class='date'>" + rs.getString("date") + "</span>");
                        out.println("</button>");
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            %>
            <!-- <button class="email">
                <span class="from"><b>From:</b> Gowtham</span>
                <span class="subject"><b>Subject:</b> Welcome to the site</span>
                <span class="content">Hello! Hope this email finds you well, I wanted to let you know that ...</span>
                <span class="date">2017-01-01</span>
            </button> -->
        </div>
    </div>

</div>
</body>