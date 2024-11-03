<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="entidade.Project"%>
<%@page import="entidade.Requirement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProjectDAO"%>

<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Requisitos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <%@include file="menu.jsp" %>
       <%
        List<Project> listaProjetos = new ProjectDAO().listarIdProjetos();
    %>
    <%
        Requirement requisito = (Requirement) request.getAttribute("requisitos");
        if (requisito == null) {
            requisito = new Requirement();
        }
    %>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="text-center mb-4"><%= requisito.getId() == 0 ? "Cadastro" : "Edição" %> de Requisitos</h2>

            <form method="post" action="acao?a=cadastrarRequisito">
                <input type="hidden" name="id" value="<%= requisito.getId() %>">

                <% if (requisito.getId() == 0) { %>
                    <!-- Exibe o select de projetos apenas se for cadastro -->
                    <div class="mb-3">
                        <label for="project" class="form-label">Projeto</label>
                        <select class="form-select" id="project" name="project" required>
                            <option value="" selected>Selecione o projeto</option>
                            <% if (listaProjetos != null && !listaProjetos.isEmpty()) {
                                for (Project projeto : listaProjetos) { %>
                                    <option value="<%= projeto.getId() %>"><%= projeto.getName() %></option>
                                <% }
                            } else { %>
                                <option value="">Nenhum projeto disponível</option>
                            <% } %>
                        </select>
                    </div>
                <% } else { %>
                    <!-- Campo oculto para o ID do projeto em caso de edição -->
                    <input type="hidden" name="project" value="<%= requisito.getProjectId() %>">
                <% } %>

                <div class="mb-3">
                    <label for="title" class="form-label">Título do Requisito</label>
                    <input type="text" class="form-control" id="title" name="title" 
                           placeholder="Título do requisito" required
                           value="<%= requisito.getTitle() != null ? requisito.getTitle() : "" %>">
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Descrição</label>
                    <textarea class="form-control" id="description" name="description" rows="3" 
                              placeholder="Descrição do requisito"><%= requisito.getDescription() != null ? requisito.getDescription() : "" %></textarea>
                </div>
                <div class="mb-3">
                    <label for="priority" class="form-label">Prioridade</label>
                    <input type="number" class="form-control" id="priority" name="priority" min="1" max="5" 
                           placeholder="Prioridade (1-5)" required
                           value="<%= requisito.getPriority() %>">
                </div>
                <div class="mb-3">
                    <label for="complexity" class="form-label">Complexidade</label>
                    <input type="number" class="form-control" id="complexity" name="complexity" min="1" max="5" 
                           placeholder="Complexidade (1-5)" required
                           value="<%= requisito.getComplexity() %>">
                </div>

                <button type="submit" class="btn btn-primary">
                    <%= requisito.getId() == 0 ? "Cadastrar Requisito" : "Atualizar Requisito" %>
                </button>
            </form>
        </div>
    </body>
</html>
