/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import entidade.Project;
import apoio.ConexaoBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Elias
 */
public class ProjectDAO {
    public boolean cadastrarProjeto(Project project) {
        boolean sucesso = false;
        
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "INSERT INTO projects (name, description, start_date, end_date, status, priority, user_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, project.getName());
            ps.setString(2, project.getDescription());
            ps.setDate(3, project.getStartDate());
            ps.setDate(4, project.getEndDate());
            ps.setString(5, project.getStatus());
            ps.setInt(6, project.getPriority());
            ps.setInt(7, project.getUserId());
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                sucesso = true;
            }
            
        } catch (Exception e) {
            System.out.println("Erro ao cadastrar projeto: " + e.getMessage());
        }
        
        return sucesso;
    }
    
    public List<Project> listarProjetos() {
        List<Project> projetos = new ArrayList<>();
        
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "SELECT id, name, status, priority, start_date, end_date FROM projects";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Project projeto = new Project();
                projeto.setId(rs.getInt("id"));
                projeto.setName(rs.getString("name"));
                projeto.setStatus(rs.getString("status"));
                projeto.setPriority(rs.getInt("priority"));
                projeto.setStartDate(rs.getDate("start_date"));
                projeto.setEndDate(rs.getDate("end_date"));
                
                projetos.add(projeto);
            }
            
        } catch (Exception e) {
            System.out.println("Erro ao listar projetos: " + e.getMessage());
        }
        
        return projetos;
    }
    
    public Project consultar(int id) {
        Project projeto = null;
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "SELECT * FROM projects WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                projeto = new Project();
                projeto.setId(rs.getInt("id"));
                projeto.setName(rs.getString("name"));
                projeto.setDescription(rs.getString("description"));
                projeto.setStartDate(rs.getDate("start_date"));
                projeto.setEndDate(rs.getDate("end_date"));
                projeto.setStatus(rs.getString("status"));
                projeto.setPriority(rs.getInt("priority"));
            }
        } catch (Exception e) {
            System.out.println("Erro ao consultar projeto: " + e.getMessage());
        }
        return projeto;
    }

    public boolean excluir(int id) {
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "DELETE FROM projects WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao excluir projeto: " + e.getMessage());
        }
        return false;
    }

    public boolean atualizar(Project project) {
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "UPDATE projects SET name = ?, description = ?, start_date = ?, end_date = ?, status = ?, priority = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, project.getName());
            ps.setString(2, project.getDescription());
            ps.setDate(3, project.getStartDate());
            ps.setDate(4, project.getEndDate());
            ps.setString(5, project.getStatus());
            ps.setInt(6, project.getPriority());
            ps.setInt(7, project.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao atualizar projeto: " + e.getMessage());
        }
        return false;
    }

}
