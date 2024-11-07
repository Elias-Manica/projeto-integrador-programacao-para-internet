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
        <title>Geração de Relatórios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <%@include file="menu.jsp" %>
    <%
        List<Project> listaProjetos = new ProjectDAO().listarIdProjetos();
    %>
    
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Geração de Relatórios</h2>
            <form method="post" action="acao?a=gerarRelatorio" target="_blank">
                <div class="mb-3">
                        <label for="project" class="form-label">Filtrar por projeto</label>
                        <select class="form-select" id="project" name="project" required>
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
                <button type="submit" class="btn btn-primary">Gerar Relatório</button>
            </form>
        </div>
    </body>
</html>
