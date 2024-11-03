<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="dao.ProjectDAO"%>
<%@page import="entidade.Project"%>
<%@page import="entidade.User"%>

<%
    ProjectDAO projectDAO = new ProjectDAO();
    List<Project> projetos = projectDAO.listarProjetos();
%>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Listagem de Projetos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <%@include file="menu.jsp" %>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Projetos Cadastrados</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Status</th>
                        <th>Prioridade</th>
                        <th>Data de Início</th>
                        <th>Data de Término</th>
                        <% if ("Admin".equals(usuario.getRole())) { %> <!-- Somente para Admin -->
                           <th>Ações</th> <!-- Coluna de ações -->
                        <% } %>
                        
                    </tr>
                </thead>
                <tbody>
                    <% for (Project projeto : projetos) { %>
                        <tr>
                            <td><%= projeto.getId() %></td>
                            <td><%= projeto.getName() %></td>
                            <td><%= projeto.getStatus() %></td>
                            <td><%= projeto.getPriority() %></td>
                            <td><%= projeto.getStartDate() %></td>
                            <td><%= projeto.getEndDate() %></td>
                            <% if ("Admin".equals(usuario.getRole())) { %>
                               <td>
                                    <a href="acao?a=editarProjeto&id=<%= projeto.getId() %>" class="btn btn-warning btn-sm">Editar</a>
                                    <a href="acao?a=excluirProjeto&id=<%= projeto.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                                </td>
                            <% } %>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="modal fade" id="requisitosModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitle">Requisitos do Projeto</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="requisitosBody"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
