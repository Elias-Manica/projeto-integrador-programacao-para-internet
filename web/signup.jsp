<%-- 
    Document   : cadastro
    Created on : 27 de out. de 2024, 16:21:12
    Author     : Elias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tela de Cadastro</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            a {
                font-size: 12px;
                color: blue;
                cursor: pointer;
                text-decoration: underline;
            }
            button {
                margin-top: 10px;
            }
        </style>
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card shadow-lg p-3 mb-5 bg-white rounded">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Cadastro de Usuário</h3>
                            <form method="post">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Nome de Usuário</label>
                                    <input type="text" class="form-control" id="username" placeholder="Digite o nome de usuário" name="username" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Senha</label>
                                    <input type="password" class="form-control" id="password" placeholder="Digite a senha" name="password" required>
                                </div>
                                <div class="mb-3">
                                    <label for="userType" class="form-label">Tipo de Usuário</label>
                                    <select class="form-control" id="userType" name="userType" required>
                                        <option value="admin">Admin</option>
                                        <option value="user">User</option>
                                    </select>
                                </div>
                                <a href="/login.jsp">Já tem o usuário? Faça o login</a>
                                <button type="submit" class="btn btn-primary w-100">Cadastrar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
