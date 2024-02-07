package Controleur;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import model.EtablirConnection;

@WebServlet("/SupprimeEtudServlet")
public class SupprimeEtudServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer l'ID de l'étudiant à supprimer à partir des paramètres de la requête
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            // Établir une connexion à la base de données
            EtablirConnection etablireConnection = new EtablirConnection();
            Connection conn = etablireConnection.getConnection();

            // Préparer la requête de suppression
            PreparedStatement ps = conn.prepareStatement("DELETE FROM etudiants WHERE id = ?");
            ps.setInt(1, id);

            // Exécuter la requête de suppression
            int rowCount = ps.executeUpdate();

            // Définir un attribut pour indiquer le succès de la suppression
            request.setAttribute("suppressionSuccess", rowCount > 0);

            // Rediriger vers la page de recherche des étudiants
            RequestDispatcher dispatcher = request.getRequestDispatcher("RechercheEtud.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            // Gérer les erreurs de base de données
            e.printStackTrace();
        }
    }

}
