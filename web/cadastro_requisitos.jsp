<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Requisitos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <%@include file="menu.jsp" %>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Cadastro de Requisitos</h2>
            <form>
                <div class="mb-3">
                    <label for="project" class="form-label">Projeto</label>
                    <select class="form-select" id="project">
                        <option selected>Selecione o projeto</option>
                        <!-- Exemplo de projetos disponíveis -->
                        <option value="1">Projeto A</option>
                        <option value="2">Projeto B</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="title" class="form-label">Título do Requisito</label>
                    <input type="text" class="form-control" id="title" placeholder="Título do requisito" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Descrição</label>
                    <textarea class="form-control" id="description" rows="3" placeholder="Descrição do requisito"></textarea>
                </div>
                <div class="mb-3">
                    <label for="priority" class="form-label">Prioridade</label>
                    <input type="number" class="form-control" id="priority" min="1" max="5" placeholder="Prioridade (1-5)" required>
                </div>
                <div class="mb-3">
                    <label for="complexity" class="form-label">Complexidade</label>
                    <input type="number" class="form-control" id="complexity" min="1" max="5" placeholder="Complexidade (1-5)" required>
                </div>
                <button type="submit" class="btn btn-primary">Cadastrar Requisito</button>
            </form>
        </div>
    </body>
</html>
