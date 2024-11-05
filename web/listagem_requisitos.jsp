<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dao.RequirementDAO"%>
<%@page import="entidade.Requirement"%>
<%@page import="entidade.Project"%>
<%@page import="entidade.Requirement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProjectDAO"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Listagem de Requisitos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
     <%
        List<Project> listaProjetos = new ProjectDAO().listarIdProjetos();
    %>
    <%
        List<Requirement> requisitos = (List<Requirement>) request.getAttribute("requisitos");

        // Se os requisitos ainda não foram carregados, buscar todos
        if (requisitos == null) {
            RequirementDAO requirementDAO = new RequirementDAO();
            requisitos = requirementDAO.listarRequisitos();
        }
    %>

    <%@include file="menu.jsp" %>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Requisitos Cadastrados</h2>

            <!-- Filtros -->
            <form class="row mb-3" method="post"  action="acao?a=listarRequisitos" >
                <div class="col-md-4">
                    <label for="filterProject" class="form-label">Filtrar por Prioridade</label>
                    <select class="form-select" id="filterProject" name="priority">
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
                    <select class="form-select" id="filterPriority" name="complexity">
                        <option value="">Todas</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                        <label for="project" class="form-label">Filtrar por projeto</label>
                        <select class="form-select" id="project" name="project">
                            <option value="" selected>Selecione o projeto</option>
                            <% if (listaProjetos != null && !listaProjetos.isEmpty()) {
                                for (Project projeto : listaProjetos) { %>
                                <option value="<%= projeto.getId() %>"><%= projeto.getName() %> - <%= projeto.getId() %></option>
                                <% }
                            } else { %>
                                <option value="">Nenhum projeto disponível</option>
                            <% } %>
                        </select>
                    </div>
                <div class="col-md-4 d-flex align-items-end">
                    <button class="btn btn-primary" type="submit">Aplicar Filtros</button>
                </div>
            </form>

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
                    if (requisitos != null) {
                        for (Requirement req : requisitos) { 
                %>
                    <tr>
                        <td><%= req.getId() %></td>
                        <td><%= req.getTitle() %></td>
                        <td><%= req.getProjectId() %></td> <!-- Mostrando o ID do projeto; ajuste conforme necessário -->
                        <td><%= req.getPriority() %></td>
                        <td><%= req.getComplexity() %></td>
                        <% if ("Admin".equals(usuario.getRole())) { %> <!-- Somente para Admin -->
                           <td>
                                <a href="acao?a=editarRequisito&id=<%= req.getId() %>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="acao?a=excluirRequisito&id=<%= req.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                            </td>
                        <% } %>
                    </tr>
                <% 
                        }
                    } else { 
                %>
                    <tr>
                        <td colspan="6" class="text-center">Nenhum requisito encontrado.</td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
