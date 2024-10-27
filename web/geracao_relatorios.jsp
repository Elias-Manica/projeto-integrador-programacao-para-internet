<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Geração de Relatórios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <%@include file="menu.jsp" %>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Geração de Relatórios</h2>
            <form>
                <div class="mb-3">
                    <label for="project" class="form-label">Projeto</label>
                    <select class="form-select" id="project">
                        <option selected>Selecione o projeto</option>
                        <!-- Exemplo de projetos -->
                        <option value="1">Projeto A</option>
                        <option value="2">Projeto B</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="report_type" class="form-label">Tipo de Relatório</label>
                    <select class="form-select" id="report_type">
                        <option selected>Selecione o tipo de relatório</option>
                        <option value="status">Relatório de Status</option>
                        <option value="prioridade">Relatório de Prioridade</option>
                        <option value="complexidade">Relatório de Complexidade</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Gerar Relatório</button>
            </form>
        </div>
    </body>
</html>
