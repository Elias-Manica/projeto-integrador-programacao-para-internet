<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Listagem de Projetos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            function showRequisitos(projectName) {
                document.getElementById('modalTitle').innerText = 'Requisitos do Projeto: ' + projectName;
                document.getElementById('requisitosBody').innerHTML = `
                    <ul>
                        <li><b>Requisito 1:</b> Versão 1 - Complexidade: 3 - Prioridade: 4</li>
                        <li><b>Requisito 2:</b> Versão 2 - Complexidade: 4 - Prioridade: 5</li>
                    </ul>`;
                var requisitosModal = new bootstrap.Modal(document.getElementById('requisitosModal'));
                requisitosModal.show();
            }
        </script>
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
                        <th>Ações</th> <!-- Coluna de ações -->
                    </tr>
                </thead>
                <tbody>
                    <tr onclick="showRequisitos('Projeto A')" style="cursor:pointer;">
                        <td>1</td>
                        <td>Projeto A</td>
                        <td>Em andamento</td>
                        <td>4</td>
                        <td>2024-01-01</td>
                        <td>2024-12-31</td>
                        <td>
                            <button class="btn btn-warning btn-sm">Editar</button>
                            <button class="btn btn-danger btn-sm">Excluir</button>
                        </td>
                    </tr>
                    <tr onclick="showRequisitos('Projeto B')" style="cursor:pointer;">
                        <td>2</td>
                        <td>Projeto B</td>
                        <td>Concluído</td>
                        <td>3</td>
                        <td>2024-03-15</td>
                        <td>2024-09-15</td>
                        <td>
                            <button class="btn btn-warning btn-sm">Editar</button>
                            <button class="btn btn-danger btn-sm">Excluir</button>
                        </td>
                    </tr>
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
