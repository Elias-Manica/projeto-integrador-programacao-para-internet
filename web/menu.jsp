<%-- 
    Document   : menu
    Created on : 27 de out. de 2024
    Author     : Elias
--%>

<%@page import="entidade.User"%>
<html>

    <head>
        <%
            HttpSession sessao = request.getSession();
            User usuario = (User) sessao.getAttribute("user");
        
            if (usuario == null) {  
                response.sendRedirect("login.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Simples</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><!-- comment --></head>
    
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
            <div class="container-fluid">
                <a class="navbar-brand" href="/home.jsp">Projeto Integrador</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/home.jsp">Home</a>
                        </li>
                        <% if ("Admin".equals(usuario.getRole())) { %> <!-- Somente para Admin -->
                            <li class="nav-item">
                                <a class="nav-link" href="/cadastro_projetos.jsp">Cadastro de Projetos</a>
                            </li>
                        <% } %>
                        <li class="nav-item">
                            <a class="nav-link" href="/listagem_projetos.jsp">Listagem de Projetos</a>
                        </li>
                         <% if ("Admin".equals(usuario.getRole())) { %> <!-- Somente para Admin -->
                            <li class="nav-item">
                                <a class="nav-link" href="/cadastro_requisitos.jsp">Cadastro de Requisitos</a>
                            </li>
                        <% } %>
                        <li class="nav-item">
                            <a class="nav-link" href="/listagem_requisitos.jsp">Listagem de Requisitos</a>
                        </li>
                       
                        <li class="nav-item">
                            <a class="nav-link" href="/geracao_relatorios.jsp">Geração de relatorios</a>
                        </li>
                        <% if ("Admin".equals(usuario.getRole())) { %> <!-- Somente para Admin -->
                            <li class="nav-item">
                                <a class="nav-link" href="/users.jsp">Listar usuários</a>
                            </li>
                        <% } %>

                    </ul>
                    <form class="d-flex"  method="post" action="acao?a=logout">
                        <button class="btn btn-outline-danger" type="submit">Sair</button>
                    </form>
                </div>
            </div>
        </nav>
    </body>
</html>

