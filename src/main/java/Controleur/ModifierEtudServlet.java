package Controleur;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.EtablirConnection;

@WebServlet("/ModifierEtudServlet")
public class ModifierEtudServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID de l'étudiant à partir des paramètres de requête
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
     // Juste avant de préparer la requête SQL
        System.out.println("ID de l'étudiant à récupérer : " + id);
        System.out.println(" de l'étudiant à récupérer : " + nom);

        // Juste après la tentative d'exécution de la requête
        System.out.println("Requête SQL exécutée avec succès");

        // Après la récupération des données de l'étudiant à partir du ResultSet
        System.out.println("Informations de l'étudiant récupérées avec succès");

        // Dans la clause catch pour afficher les exceptions SQL


        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Établir une connexion à la base de données
            EtablirConnection etablireConnection = new EtablirConnection();
            conn = etablireConnection.getConnection();

            // Préparer la requête SQL pour récupérer les informations de l'étudiant avec l'ID spécifié
            String sql = "SELECT * FROM etudiants WHERE id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            // Exécuter la requête
            rs = stmt.executeQuery();

            // Si l'étudiant est trouvé, transférer les informations à la page JSP pour affichage
            if (rs.next()) {
                request.setAttribute("id", rs.getInt("id"));
                request.setAttribute("nom", rs.getString("nom"));
                request.setAttribute("prenom", rs.getString("prenom"));
                request.setAttribute("dateNaissance", rs.getString("date_de_naissance"));
                request.setAttribute("cin", rs.getString("cin"));
                request.setAttribute("adresse", rs.getString("address"));
                request.setAttribute("filiere", rs.getString("filiere"));
                request.setAttribute("email", rs.getString("email"));

                RequestDispatcher dispatcher = request.getRequestDispatcher("ModifierEtud.jsp");
                dispatcher.forward(request, response);
            } else {
                // Gérer le cas où l'étudiant n'est pas trouvé
                response.getWriter().println("Étudiant non trouvé.");
            }
        } catch (SQLException ex) {
            // Gérer les exceptions SQL
            ex.printStackTrace();
        } 
    }
}
