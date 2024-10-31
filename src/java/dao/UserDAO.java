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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
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
    
    public ArrayList<User> listarUsuarios() {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
        } catch (Exception e) {
            System.out.println("Erro ao listar usuário: " + e.getMessage());
        }
        
        return users;
    }

    // Editar o cargo do usuário
    public boolean editarCargo(int userId, String newRole) {
        String sql = "UPDATE users SET role = ? WHERE id = ?";
        try {
            Connection con = ConexaoBD.getInstance().getConnection();
           PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, newRole);
            ps.setInt(2, userId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Erro ao editar usuário: " + e.getMessage());
           return false;
        }
    }

    // Deletar usuário
    public boolean deletarUsuario(int userId) {
        String sql = "DELETE FROM users WHERE id = ?";
        
        try {
           Connection con = ConexaoBD.getInstance().getConnection();
           PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId); // Define o parâmetro do ID do usuário

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
            
        } catch (Exception e) {
            System.out.println("Erro ao excluir user: " + e);
            return false;
        }
    }

}

