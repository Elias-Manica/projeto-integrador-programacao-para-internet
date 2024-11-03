/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servelet;

import dao.ProjectDAO;
import dao.UserDAO;
import entidade.Project;
import entidade.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Elias
 */
public class acao extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet acao</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet acao at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       String a = request.getParameter("a");

        if ("editarProjeto".equals(a)) {
            int codigo = Integer.parseInt(request.getParameter("id"));
            Project projeto = new ProjectDAO().consultar(codigo);
            request.setAttribute("projeto", projeto);
            encaminharPagina("cadastro_projetos.jsp", request, response);
        }

        if ("excluirProjeto".equals(a)) {
            int codigo = Integer.parseInt(request.getParameter("id"));
            if (new ProjectDAO().excluir(codigo)) {
                encaminharPagina("listagem_projetos.jsp", request, response);
            } else {
                encaminharPagina("erro_cadastro_projeto.jsp", request, response);
            }
        }

       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
         String a = request.getParameter("a");

        if (a.equals("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            System.out.println("Username: " + username);
            System.out.println("Password: " + password);

            User user = new UserDAO().autenticar(username, password);

            if (user != null) {
                HttpSession sessao = request.getSession();
                sessao.setAttribute("user", user);

                encaminharPagina("home.jsp", request, response);
            } else {
                encaminharPagina("erro.jsp", request, response);
            }
        }

        if (a.equals("logout")) {
            HttpSession sessao = request.getSession();
            sessao.invalidate();

            encaminharPagina("login.jsp", request, response);
        }
        if (a.equals("cadastrarUsuario")) {
            // Pega os parâmetros do formulário de cadastro
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String userType = request.getParameter("userType");

            User newUser = new User();
            newUser.setUsername(username);
            newUser.setPasswordHash(password);
            newUser.setRole(userType);

            UserDAO userDAO = new UserDAO();
            boolean isRegistered = userDAO.cadastrar(newUser);

            if (isRegistered) {
                encaminharPagina("login.jsp", request, response);
            } else {
                encaminharPagina("erro_cadastro_user.jsp", request, response);
            }
        }
        
        
        if (a.equals("editarCargo")) {
            int userId = Integer.parseInt(request.getParameter("id"));
            String newRole = request.getParameter("newRole");

            UserDAO userDAO = new UserDAO();
            boolean isEdited = userDAO.editarCargo(userId, newRole);

            if (isEdited) {
                encaminharPagina("users.jsp", request, response);
            } else {
                encaminharPagina("erro.jsp", request, response);
            }
        }

        if (a.equals("deletarUsuario")) {
            int userId = Integer.parseInt(request.getParameter("id"));

            UserDAO userDAO = new UserDAO();
            boolean isDeleted = userDAO.deletarUsuario(userId);

            if (isDeleted) {
                encaminharPagina("users.jsp", request, response);
            } else {
                encaminharPagina("erro.jsp", request, response);
            }
        }
        
        if ("cadastroProjetos".equals(a)) {
            String codigo = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            // Converte as datas para java.sql.Date
            java.sql.Date startDate = java.sql.Date.valueOf(request.getParameter("start_date"));
            java.sql.Date endDate = request.getParameter("end_date").isEmpty() ? null : java.sql.Date.valueOf(request.getParameter("end_date"));

            String status = request.getParameter("status");
            int priority = Integer.parseInt(request.getParameter("priority"));

            User usuario = (User) request.getSession().getAttribute("user");
            int userId = usuario.getId();

            Project project = new Project();

            // Verifica se é para atualizar ou cadastrar novo projeto
            if (codigo != null && !codigo.isEmpty()) {
                int id = Integer.parseInt(codigo);
                project.setId(id);
            } else {
                project.setId(0);
            }

            // Define os valores do projeto
            project.setName(name);
            project.setDescription(description);
            project.setStartDate(startDate);
            project.setEndDate(endDate);
            project.setStatus(status);
            project.setPriority(priority);
            project.setUserId(userId);

            ProjectDAO projectDAO = new ProjectDAO();
            boolean sucesso;

            // Decide se vai cadastrar ou atualizar
            if (project.getId() == 0) { // Novo projeto
                sucesso = projectDAO.cadastrarProjeto(project);
            } else { // Atualizar projeto existente
                sucesso = projectDAO.atualizar(project);
            }

            if (sucesso) {
                encaminharPagina("listagem_projetos.jsp", request, response);
            } else {
                encaminharPagina("erro_cadastro_projeto.jsp", request, response);
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void encaminharPagina(String pagina, HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher rd = request.getRequestDispatcher(pagina);
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println("Erro ao encaminhar: " + e);
        }
    }
}
