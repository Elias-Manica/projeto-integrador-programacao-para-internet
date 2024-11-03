<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="entidade.Project"%>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Projetos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <%@include file="menu.jsp" %>
    <%
        Project projeto = (Project) request.getAttribute("projeto");
        if (projeto == null) {
            projeto = new Project();
        }
    %>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="text-center mb-4"><%= projeto.getId() == 0 ? "Cadastro" : "Editar" %> de Projeto</h2>
            <form method="post" action="acao?a=cadastroProjetos">
                <input type="hidden" name="id" value="<%= projeto.getId() %>">

                <div class="mb-3">
                    <label for="name" class="form-label">Nome do Projeto</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Digite o nome do projeto" value="<%= projeto.getName() %>" required>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Descrição</label>
                    <textarea class="form-control" id="description" name="description" rows="3" placeholder="Descrição do projeto" required><%= projeto.getDescription() %></textarea>
                </div>

                <div class="mb-3">
                    <label for="start_date" class="form-label">Data de Início</label>
                    <input type="date" class="form-control" name="start_date" id="start_date" value="<%= projeto.getStartDate() %>" required>
                </div>

                <div class="mb-3">
                    <label for="end_date" class="form-label">Data de Término (opcional)</label>
                    <input type="date" class="form-control" id="end_date" name="end_date" value="<%= projeto.getEndDate() %>">
                </div>

                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select class="form-select" id="status" name="status">
                        <option value="Em andamento" <%= "Em andamento".equals(projeto.getStatus()) ? "selected" : "" %>>Em andamento</option>
                        <option value="Concluído" <%= "Concluído".equals(projeto.getStatus()) ? "selected" : "" %>>Concluído</option>
                        <option value="Pendente" <%= "Pendente".equals(projeto.getStatus()) ? "selected" : "" %>>Pendente</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="priority" class="form-label">Prioridade</label>
                    <input type="number" class="form-control" id="priority" name="priority" min="1" max="5" placeholder="Prioridade (1-5)" value="<%= projeto.getPriority() %>" required>
                </div>

                <button type="submit" class="btn btn-primary"><%= projeto.getId() == 0 ? "Cadastrar Projeto" : "Atualizar Projeto" %></button>
            </form>
        </div>
    </body>
</html>
