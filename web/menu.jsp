<%-- 
    Document   : menu
    Created on : 27 de out. de 2024
    Author     : Elias
--%>

<%-- 
    Document   : menu
    Created on : 27 de out. de 2024
    Author     : Elias
--%>

<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Projeto Integrador</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Cadastro</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Projetos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Requisitos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Relatórios</a>
                </li>
            </ul>
            <form class="d-flex" action="/login.jsp">
                <button class="btn btn-outline-danger" type="submit">Sair</button>
            </form>
        </div>
    </div>
</nav>

