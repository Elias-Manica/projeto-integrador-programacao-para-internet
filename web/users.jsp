<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidade.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.List" %>
<%@include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Gerenciar Usuários</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h3 class="text-center">Lista de Usuários</h3>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome de Usuário</th>
                        <th>Cargo</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        UserDAO userDAO = new UserDAO();
                        List<User> users = userDAO.listarUsuarios();

                        for (User user : users) {
                    %>
                    <tr>
                        <td><%= user.getId() %></td>
                        <td><%= user.getUsername() %></td>
                        <td>
                            <form action="acao" method="post" class="d-inline">
                                <select name="newRole" class="form-select">
                                    <option value="Admin" <%= user.getRole().equals("Admin") ? "selected" : "" %>>Admin</option>
                                    <option value="User" <%= user.getRole().equals("User") ? "selected" : "" %>>User</option>
                                </select>
                                <input type="hidden" name="id" value="<%= user.getId() %>">
                                <button type="submit" name="a" value="editarCargo" class="btn btn-warning btn-sm mt-1">Salvar</button>
                            </form>
                        </td>
                        <td>
                            <form action="acao?a=deletarUsuario" method="post" class="d-inline">
                                <input type="hidden" name="id" value="<%= user.getId() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Excluir</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
