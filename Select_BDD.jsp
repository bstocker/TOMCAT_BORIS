<%@ page import="java.sql.*"%>
<html>
<head>
<title>JDBC Connection example</title>
</head>

<body>
<h1>JDBC Connection example</h1>

<%
  String db = request.getParameter("bdd_boris");
  String user = "root"; // assumes database name is the same as username
  try {
    java.sql.Connection con;
    Class.forName("org.gjt.mm.mysql.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/"+db, user, "root");
    out.println (db+ "database successfully opened.");
  }
  catch(SQLException ex) {
    out.println("SQLException caught: " +ex.getMessage());
  }
%>

</body>