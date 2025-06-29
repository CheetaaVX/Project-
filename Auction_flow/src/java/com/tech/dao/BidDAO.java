/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.dao;

/**
 *
 * @author amitp_s2vptkn
 */
import com.tech.entities.Product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BidDAO {
    
    
    // program to fetch data for bill
    public List<Product> getSoldProductsByEmail(String email) throws ClassNotFoundException {
    List<Product> products = new ArrayList<>();
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/on_product", "root", "");

        // SQL query to retrieve sold products by bidder or seller email
        String sql = "SELECT * FROM sold_products WHERE bidder = ? OR seller = ?";
        
        // Prepare statement
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, email);
        
        // Execute query
        rs = stmt.executeQuery();
        
        // Iterate through the result set and populate products list
        while (rs.next()) {
            Product product = new Product();
            product.setProductId(rs.getInt("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setDescription(rs.getString("description"));
            product.setBidder(rs.getString("bidder"));
            product.setSeller(rs.getString("seller"));
            product.setImageLocation(rs.getString("image_location"));
            product.setPrice(rs.getDouble("price"));
            products.add(product);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle exception
    } finally {
        // Close resources in finally block
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return products;
}

    
    
    
    
    
    
    
    
    
    
    public static double updateBid(int productId, double newBid, String bidder) throws ClassNotFoundException {
        double currentBid = 0.0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/on_product","root","");

            // Prepare SQL statement
            // Prepare SQL statement
            String sql = "UPDATE products SET price = ?, bidder = ? WHERE product_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setDouble(1, newBid);
            stmt.setString(2, bidder);
            stmt.setInt(3, productId);


            // Execute query
            rs = stmt.executeQuery();

            // Retrieve bid if exists
            if (rs.next()) {
                currentBid = rs.getDouble("current_bid");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log exception appropriately
        } finally {
            // Close resources in reverse order of their creation to avoid resource leaks
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Handle or log exception appropriately
            }
        }

        return currentBid;
    }
    
    // single product details 
    
    
    
   
}
