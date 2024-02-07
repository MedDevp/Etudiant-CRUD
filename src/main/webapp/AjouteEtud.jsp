<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des étudiants</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
        /* Styles pour la barre latérale */
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

        /* Styles pour la partie principale */
        .main {
            margin-left: 250px; /* Ajuste la marge gauche pour laisser de l'espace à la barre latérale */
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        form {
            width: 80%;
            margin: auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box; /* Pour inclure le padding dans la largeur */
        }
        button[type="submit"] {
            background-color: #4CAF50; /* Couleur verte */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        button[type="submit"]:hover {
            background-color: #45a049; /* Légère variation de couleur au survol */
        }
        .message {
        padding: 10px;
        width: 80%;
        margin: 20px auto 0px;
        border-radius: 5px;
        font-size: 16px;
        font-weight: bold;
    }

    .success {
        background-color: #dff0d8; /* Couleur verte pour les messages de succès */
        color: #3c763d;
    }

    .error {
        background-color: #f2dede; /* Couleur rouge pour les messages d'erreur */
        color: #a94442;
    }
    </style>
</head>
<body>
    <div class="sidebar">
        <a href="AjouteEtud.jsp">Ajouter Étudiant</a>
		<a href="RechercheEtud.jsp">Rechercher Étudiant</a>
        <a href="ModifierEtud.jsp">Modifié les informations d'Étudiant</a>
    </div>

    <div class="main">
        <!-- Formulaire pour ajouter un étudiant -->
        <h2 id="ajouter-etudiant">Ajouter un étudiant</h2>
        <form action="AjouteEtudServlet" method="post">
            <label for="nom">Nom :</label>
            <input type="text" id="nom" name="nom" required><br>

            <label for="prenom">Prénom :</label>
            <input type="text" id="prenom" name="prenom" required><br>
            
            <label for="date">Date de naissance :</label>
            <input type="date" id="birthdate" name="date" required><br>
            
            <label for="cin">CIN :</label>
            <input type="text" id="cin" name="cin" required><br>

            <label for="address">Adresse :</label>
            <input type="text" id="address" name="address" required><br>

            <label for="filiere">Filière :</label>
            <input type="text" id="filiere" name="filiere" required><br>
            
            <label for="email">E-mail :</label>
            <input type="text" id="email" name="email" required><br>

            <button type="submit">Ajouter</button>
        </form>

		        <%-- Affichage du message de succès ou d'erreur --%>
		<% if (request.getAttribute("successMessage") != null) { %>
		    <div class="message success">
		        <p><%= request.getAttribute("successMessage") %></p>
		    </div>
		<% } else if (request.getAttribute("errorMessage") != null) { %>
		    <div class="message error">
		        <p><%= request.getAttribute("errorMessage") %></p>
		    </div>
		<% } %>

    </div>
</body>
</html>
