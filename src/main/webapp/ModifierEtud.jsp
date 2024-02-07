<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier une personne</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/modifier.css">
    <style>
        /* Ajout de styles pour la barre latérale */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #333;
            padding-top: 20px;
            color: #fff;
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
        .container {
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
    </style>
</head>
<body>
    <!-- Barre latérale -->
    <div class="sidebar">
        <a href="AjouteEtud.jsp">Ajouter Étudiant</a>
        <a href="RechercheEtud.jsp">Rechercher Étudiant</a>
        <a href="ModifierEtud.jsp">Modifier les informations d'Étudiant</a>
    </div>

	<div class="container">
    <h1 class="header">Modifier Étudiant</h1>
    <form action="ModifierEtudServlet" method="post">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>" required>
        
        <!-- Champ pour le nom -->
        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" value="<%= request.getParameter("nom") %>" required>
        
        <!-- Champ pour le prénom -->
        <label for="prenom">Prénom :</label>
        <input type="text" id="prenom" name="prenom" value="<%= request.getParameter("prenom") %>" required>
        
        <!-- Champ pour la date de naissance -->
        <label for="dateNaissance">Date de Naissance :</label>
        <input type="date" id="dateNaissance" name="dateNaissance" value="<%= request.getParameter("dateNaissance") %>" required>
        
        <!-- Champ pour le CIN -->
        <label for="cin">CIN :</label>
        <input type="text" id="cin" name="cin" value="<%= request.getParameter("cin") %>" required>
        
        <!-- Champ pour l'adresse -->
        <label for="adresse">Adresse :</label>
        <input type="text" id="adresse" name="adresse" value="<%= request.getParameter("adresse") %>" required>
        
        <!-- Champ pour la filière -->
        <label for="filiere">Filière :</label>
        <input type="text" id="filiere" name="filiere" value="<%= request.getParameter("filiere") %>" required>
        
        <!-- Champ pour l'email -->
        <label for="email">Email :</label>
        <input type="email" id="email" name="email" value="<%= request.getParameter("email") %>" required>
        
        <!-- Bouton pour soumettre le formulaire -->
        <button type="submit">Enregistrer</button>
    </form>

	</div>
</body>
</html>
