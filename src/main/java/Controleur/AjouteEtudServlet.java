package Controleur;

import model.EtablirConnection;


import java.io.IOException;
import java.sql.*;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/AjouteEtudServlet")
public class AjouteEtudServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String address = request.getParameter("address");
        String date = request.getParameter("date");
        String cin = request.getParameter("cin");
        String filiere = request.getParameter("filiere");
        String email = request.getParameter("email");


        String sql = "INSERT INTO etudiants (nom, prenom, date_de_naissance,cin, address, filiere ,email) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            EtablirConnection etablireConnection = new EtablirConnection();
            Connection conn = etablireConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, nom);
            ps.setString(2, prenom);
            ps.setString(3, date);
            ps.setString(4, cin);
            ps.setString(5, address);
            ps.setString(6, filiere);
            ps.setString(7, email);

            
            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                // L'étudiant a été enregistré avec succès
                request.setAttribute("successMessage", "L'étudiant a été ajouté avec succès.");
            } else {
                // Une erreur s'est produite lors de l'enregistrement de l'étudiant
                request.setAttribute("errorMessage", "Une erreur s'est produite lors de l'enregistrement de l'étudiant.");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("AjouteEtud.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
}
