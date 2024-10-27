<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Projetos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <%@include file="menu.jsp" %>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Cadastro de Projetos</h2>
            <form>
                <div class="mb-3">
                    <label for="name" class="form-label">Nome do Projeto</label>
                    <input type="text" class="form-control" id="name" placeholder="Digite o nome do projeto" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Descrição</label>
                    <textarea class="form-control" id="description" rows="3" placeholder="Descrição do projeto"></textarea>
                </div>
                <div class="mb-3">
                    <label for="start_date" class="form-label">Data de Início</label>
                    <input type="date" class="form-control" id="start_date" required>
                </div>
                <div class="mb-3">
                    <label for="end_date" class="form-label">Data de Término</label>
                    <input type="date" class="form-control" id="end_date">
                </div>
                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select class="form-select" id="status">
                        <option selected>Selecione o status</option>
                        <option value="Em andamento">Em andamento</option>
                        <option value="Concluído">Concluído</option>
                        <option value="Pendente">Pendente</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="priority" class="form-label">Prioridade</label>
                    <input type="number" class="form-control" id="priority" min="1" max="5" placeholder="Prioridade (1-5)" required>
                </div>
                <button type="submit" class="btn btn-primary">Cadastrar Projeto</button>
            </form>
        </div>
    </body>
</html>
