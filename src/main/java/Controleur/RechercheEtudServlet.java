package Controleur;

import model.EtablirConnection;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RechercheEtudServlet")
public class RechercheEtudServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cin = request.getParameter("cin");

        String sql = "SELECT * FROM etudiants WHERE cin = ?";
        
        try {
            EtablirConnection etablireConnection = new EtablirConnection();
            Connection conn = etablireConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cin);
            
            ResultSet rs = ps.executeQuery();
            
            // Transférer le résultat à la page JSP
            request.setAttribute("resultatsRecherche", rs);

            RequestDispatcher dispatcher = request.getRequestDispatcher("RechercheEtud.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
