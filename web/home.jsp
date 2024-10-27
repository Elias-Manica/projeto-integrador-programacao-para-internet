<%-- 
    Document   : home
    Created on : 27 de out. de 2024, 17:30:00
    Author     : Elias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home - Projeto Integrador</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <%@include file="menu.jsp" %>
    <body class="bg-light">
        <div class="container mt-5">
            <h1 class="text-center mb-4">Projeto Integrador: Programação para Internet</h1>
            <p class="text-center">Este sistema foi desenvolvido como parte do projeto integrador da disciplina Programação para Internet da Univates, realizado em novembro de 2024.</p>
            <p class="text-center">O projeto foi criado pelo aluno Elias Manica e tem como principal função gerenciar os requisitos de software de uma equipe de desenvolvimento. Ele permite a criação e acompanhamento de projetos e requisitos, possibilitando o controle de versionamento e a geração de relatórios detalhados sobre cada projeto.</p>
            <p class="text-center">O sistema conta com dois níveis de usuários, Admin e User, garantindo um controle de acesso adequado às necessidades de cada perfil.</p>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkW1Nk6y2tc6EXGpU52Odw+ZQ+6pC7qlAnS2V8EBbpkDX8N/pDfi" crossorigin="anonymous"></script>
    </body>
</html>
