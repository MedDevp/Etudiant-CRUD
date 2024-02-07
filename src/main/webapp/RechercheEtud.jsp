<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      	<%@ page import="java.sql.*, model.EtablirConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Résultat de la recherche</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }
        .modifier {
            color: #ffffff; 
            background-color: #ff7f00; 
            padding: 5px 10px; 
            text-decoration: none; 
            border-radius: 4px; 
        }
        .supprimer {
            color: #ffffff; 
            background-color: #ff0000; 
            padding: 5px 10px; 
            text-decoration: none; 
            border-radius: 4px; 
        }
        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #333;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 10px;
            display: block;
            color: #fff;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #555;
        }
        .container{
        	margin-left: 250px; 
            padding: 20px;
            }
            th {
        background-color: #f0f0f0; 
    }
    .message{
    	padding: 10px;
        
        border-radius: 5px;
        font-size: 16px;
        font-weight: bold;
        background-color: #dff0d8; 
        color: #3c763d;
    }
    </style>
</head>
<body>
	<div class="sidebar">
	        <a href="AjouteEtud.jsp">Ajouter Étudiant</a>
			<a href="RechercheEtud.jsp">Rechercher Étudiant</a>
	        <a href="ModifierEtud.jsp">Modifié les informations d'Étudiant</a>
	    </div>
    <div class="container"> 
        <h1 class="header">Recherche</h1>
        <div class="content">   
            <form action="RechercheEtudServlet" method="post">
			    <label for="cin">CIN :</label><br>
			    <input type="text" id="cin" name="cin" placeholder="Entrer un CIN..." required>
			    <button type="submit">Recherche</button>
			</form>


            <hr>
            <h2>Résultats de la recherche</h2>
            <table>
    <tr>                    
        <th>Nom</th>
        <th>Prénom</th>
        <th>Date de Naissance</th>
        <th>CIN</th>
        <th>Adresse</th>
        <th>Filière</th>
        <th>Email</th>
        <th>Action</th>
    </tr>
    <% ResultSet rs = (ResultSet) request.getAttribute("resultatsRecherche"); %>
    <% if (rs != null) { %>
        <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getString("nom") %></td>
                <td><%= rs.getString("prenom") %></td>
                <td><%= rs.getString("date_de_naissance") %></td>
                <td><%= rs.getString("cin") %></td>
                <td><%= rs.getString("address") %></td>
                <td><%= rs.getString("filiere") %></td>
                <td><%= rs.getString("email") %></td>
                <td>                   
<a href="ModifierEtudServlet?id=<%= rs.getInt("id") %>" class="modifier">Modifier</a>
					<a href="SupprimeEtudServlet?id=<%= rs.getInt(1) %>" class="supprimer" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet étudiant ?');">Supprimer</a>
                </td>
            </tr>
        <% } %>
    <% } else { %>
        <tr>
            <td colspan="8">Aucun résultat trouvé avec ce CIN.</td>
        </tr>
    <% } %>
    
    
</table>
	<% if (request.getAttribute("suppressionSuccess") != null) { %>
                <p style="color: green;" class="message">L'étudiant a été supprimé avec succès.</p>
            <% } %>

        </div>
    </div>  
</body>
</html>
