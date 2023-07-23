<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MySQL via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MySQL via JSP</h1>
    <% 
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

  
        // Informations de connexion
        String url = "jdbc:mysql://localhost:3306/bdd_boris";
        String user = "root";
        String password = "root";

        // Charger le pilote JDBC
        Class.forName("com.mysql.jdbc.Driver");

        // Établir la connexion
        conn = DriverManager.getConnection(url, user, password);

        // Exemple de requête SQL
        String sql = "SELECT * FROM Employees";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        // Traiter les résultats (à adapter selon vos besoins)
        while (rs.next()) {
            String colonne1 = rs.getString("id");
            String colonne2 = rs.getString("first");
            String colonne3 = rs.getString("last");
            String colonne4 = rs.getString("age");

            System.out.println("ID: " + colonne1 + ", Prenom: " + colonne2 + ", Nom: " + colonne3 + ", Age: " + colonne4);

            // Faites ce que vous voulez avec les données...
        }

        System.out.println("Test");

    
        // Fermer les ressources
        if (rs != null) {
            try { rs.close(); } catch (SQLException e) { }
        }
        if (pstmt != null) {
            try { pstmt.close(); } catch (SQLException e) { }
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException e) { }
        }
    
    %>
</body>
</html>