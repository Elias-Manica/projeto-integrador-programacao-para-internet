/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import entidade.Project;
import apoio.ConexaoBD;
import java.sql.Connection;
import java.sql.PreparedStatement;

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


}
