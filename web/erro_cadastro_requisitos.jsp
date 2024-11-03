<%-- 
    Document   : erro_cadastro_projeto
    Created on : 3 de nov. de 2024, 14:36:56
    Author     : Elias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro no Cadastro de Requisitos</title>
        <!-- Link para o Bootstrap para estilo -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <%@include file="menu.jsp" %>
    <body>
        <div class="container mt-5">
            <div class="alert alert-danger text-center" role="alert">
                <h4 class="alert-heading">Erro ao Cadastrar o Requisito</h4>
                <p>Ocorreu um problema durante o cadastro do requisito. Por favor, verifique os dados e tente novamente.</p>
                <hr>
                <p class="mb-0">Caso o problema persista, verifique seu banco de dados.</p>
            </div>
            <div class="text-center mt-4">
                <a href="cadastro_requisitos.jsp" class="btn btn-primary">Voltar ao Cadastro de Requisitos</a>
            </div>
        </div>
        
        <!-- Script do Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-4BdrSJw1zDjtSbqq6COUo+z1HlTW4mFsva1mXzFP1af8Xp/+VoxvdSOYniQLftoI" crossorigin="anonymous"></script>
    </body>
</html>
