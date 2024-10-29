<%-- 
    Document   : login
    Created on : 27 de out. de 2024, 16:11:35
    Author     : Elias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tela de Login</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><!-- comment --></head>
        <style>
            a {
                font-size: 12px;
                color: blue;
                cursor: pointer;
                text-decoration: underline;
                margin-bottom: 5px;
            }
            button {
                margin-top: 10px;
            }
        </style>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card shadow-lg p-3 mb-5 bg-white rounded">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Login</h3>
                            <form method="post" action="acao?a=login">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Username</label>
                                    <input class="form-control" id="username" placeholder="Digite seu username" name="username" required> </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Senha</label>
                                    <input type="password" class="form-control" id="password" placeholder="Digite sua senha" name="password" required>
                                </div>
                                <a href="/signup.jsp">Gostaria de cadastrar algum usuário novo?</a>
                                <button type="submit" class="btn btn-primary w-100">Entrar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

   </body>
</html>