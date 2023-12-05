<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
    Connection conn = null;
    String url = "jdbc:mariadb://localhost:3306/films";
    String utilisateur = "root";
    String motDePasse = "root";

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, utilisateur, motDePasse);
        // Connexion établie avec succès, vous pouvez exécuter des requêtes SQL ici
    } catch (SQLException e) {
        out.println("Erreur de connexion : " + e.getMessage());
    } catch (ClassNotFoundException e) {
        out.println("Erreur de chargement du pilote : " + e.getMessage());
    } finally {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            out.println("Erreur lors de la fermeture de la connexion : " + e.getMessage());
        }
    }
%>

