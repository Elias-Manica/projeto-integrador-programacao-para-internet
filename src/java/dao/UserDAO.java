/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entidade.User;
import apoio.ConexaoBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author Elias
 */
public class UserDAO {

    // Autenticação de usuário
    public User autenticar(String username, String passwordHash) {
        User user = null;
        
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "SELECT * FROM users WHERE username = ? AND password_hash = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, passwordHash);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPasswordHash(rs.getString("password_hash"));
                user.setRole(rs.getString("role"));
            }
            
        } catch (Exception e) {
            System.out.println("Erro ao autenticar usuário: " + e.getMessage());
        }
        
        return user;
    }

    // Cadastro de novo usuário
    public boolean cadastrar(User user) {
        boolean sucesso = false;
        
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            String sql = "INSERT INTO users (username, password_hash, role) VALUES (?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPasswordHash());
            ps.setString(3, user.getRole());
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                sucesso = true;
            }
            
        } catch (Exception e) {
            System.out.println("Erro ao cadastrar usuário: " + e.getMessage());
        }
        
        return sucesso;
    }
}

