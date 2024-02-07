package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class EtablirConnection {
    
    private static final String URL = "jdbc:mysql://localhost:3306/gestion_etudiants";
    private static final String UTILISATEUR = "root";
    private static final String MOT_DE_PASSE = "";

    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, UTILISATEUR, MOT_DE_PASSE);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
