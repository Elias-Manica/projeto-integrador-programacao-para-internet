<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dao.RequirementDAO"%>
<%@page import="entidade.Requirement"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Listagem de Requisitos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <%@include file="menu.jsp" %>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Requisitos Cadastrados</h2>

            <!-- Filtros -->
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="filterProject" class="form-label">Filtrar por Prioridade</label>
                    <select class="form-select" id="filterProject">
                        <option value="">Todos</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="filterPriority" class="form-label">Filtrar por Complexidade</label>
                    <select class="form-select" id="filterPriority">
                        <option value="">Todas</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="col-md-4 d-flex align-items-end">
                    <button class="btn btn-primary">Aplicar Filtros</button>
                </div>
            </div>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Projeto</th>
                        <th>Prioridade</th>
                        <th>Complexidade</th>
                        <% if ("Admin".equals(usuario.getRole())) { %> <!-- Somente para Admin -->
                           <th>Ações</th> <!-- Coluna de ações -->
                        <% } %>
                    </tr>
                </thead>
                <tbody>
                <% 
                    RequirementDAO requirementDAO = new RequirementDAO();
                    List<Requirement> requisitos = requirementDAO.listarRequisitos();
                    for (Requirement req : requisitos) { 
                %>
                    <tr>
                        <td><%= req.getId() %></td>
                        <td><%= req.getTitle() %></td>
                        <td><%= req.getProjectId() %></td> <!-- Mostrando o ID do projeto; para o nome, ajuste conforme necessário -->
                        <td><%= req.getPriority() %></td>
                        <td><%= req.getComplexity() %></td>
                        <% if ("Admin".equals(usuario.getRole())) { %> <!-- Somente para Admin -->
                           <td>
                                <a href="acao?a=editarRequisito&id=<%= req.getId() %>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="acao?a=excluirRequisito&id=<%= req.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                            </td>
                        <% } %>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
