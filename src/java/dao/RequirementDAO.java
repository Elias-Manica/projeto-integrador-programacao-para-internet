/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import entidade.Requirement;
import apoio.ConexaoBD;

/**
 *
 * @author Elias
 */
public class RequirementDAO {
    public boolean salvar(Requirement requirement) {
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "INSERT INTO requirements (project_id, title, description, priority, complexity) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, requirement.getProjectId());
            ps.setString(2, requirement.getTitle());
            ps.setString(3, requirement.getDescription());
            ps.setInt(4, requirement.getPriority());
            ps.setInt(5, requirement.getComplexity());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao salvar requisito: " + e.getMessage());
        }
        return false;
    }

    public boolean atualizar(Requirement requirement) {
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "UPDATE requirements SET project_id = ?, title = ?, description = ?, priority = ?, complexity = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, requirement.getProjectId());
            ps.setString(2, requirement.getTitle());
            ps.setString(3, requirement.getDescription());
            ps.setInt(4, requirement.getPriority());
            ps.setInt(5, requirement.getComplexity());
            ps.setInt(6, requirement.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao atualizar requisito: " + e.getMessage());
        }
        return false;
    }

    public boolean excluir(int id) {
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "DELETE FROM requirements WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Erro ao excluir requisito: " + e.getMessage());
        }
        return false;
    }

    public List<Requirement> listarRequisitos() {
        List<Requirement> requisitos = new ArrayList<>();
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "SELECT id, title, project_id, priority, complexity FROM requirements";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Requirement req = new Requirement();
                req.setId(rs.getInt("id"));
                req.setTitle(rs.getString("title"));
                req.setProjectId(rs.getInt("project_id"));
                req.setPriority(rs.getInt("priority"));
                req.setComplexity(rs.getInt("complexity"));
                requisitos.add(req);
            }
        } catch (Exception e) {
            System.out.println("Erro ao listar requisitos: " + e.getMessage());
        }
        return requisitos;
    }
    
    public Requirement consultar(int id) {
        Requirement requisito = null;
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "SELECT * FROM requirements WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                requisito = new Requirement();
                requisito.setId(rs.getInt("id"));
                requisito.setTitle(rs.getString("title"));
                requisito.setProjectId(rs.getInt("project_id"));
                requisito.setPriority(rs.getInt("priority"));
                requisito.setComplexity(rs.getInt("complexity"));
                requisito.setDescription(rs.getString("description"));
            }
        } catch (Exception e) {
            System.out.println("Erro ao consultar projeto: " + e.getMessage());
        }
        return requisito;
    }
    
    public List<Requirement> listarRequisitosPorProjeto(int projectId) {
        List<Requirement> requisitos = new ArrayList<>();
        
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "SELECT * FROM requirements WHERE project_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, projectId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Requirement requisito = new Requirement();
                requisito.setId(rs.getInt("id"));
                requisito.setTitle(rs.getString("title"));
                requisito.setProjectId(rs.getInt("project_id"));
                requisito.setPriority(rs.getInt("priority"));
                requisito.setComplexity(rs.getInt("complexity"));
                requisito.setDescription(rs.getString("description"));
                requisitos.add(requisito);
            }
        } catch (Exception e) {
            System.out.println("Erro ao consultar projeto: " + e.getMessage());
        }

        return requisitos;
    }

}
