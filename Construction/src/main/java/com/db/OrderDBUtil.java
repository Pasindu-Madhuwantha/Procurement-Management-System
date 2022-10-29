package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.model.Order;

public class OrderDBUtil {
	
	// SQL Queries --------------------------------------------------------------
	
	private static String PLACE_NEW_ORDER = "INSERT INTO orders(material, quantity, totalAmount, siteName, siteAddress,"
			+ "orderDate, deliveryDate) VALUES(?, ?, ?, ?, ?, ?, ?) ";
	
	private static String GET_ORDER_BY_ID = "SELECT * FROM orders WHERE idorders=?";
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// -------------------------------------------------------------------------------
	
	public boolean placNewOrder(Order order) {
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(PLACE_NEW_ORDER);) {
		
			Date date = new Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			
			preStmt.setString(1, order.getMaterial());
			preStmt.setInt(2, order.getQuantity());
			preStmt.setDouble(3, order.getTotAmount());
			preStmt.setString(4, order.getSiteName());
			preStmt.setString(5, order.getSiteAddress());
			preStmt.setDate(6, sqlDate);
			preStmt.setString(7, order.getDeliveryDate());
			
			preStmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return true;
		
	}
	
	
	
	public Order selectOrderById(int orderId) {
		
		Order tempOrder = null;
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(GET_ORDER_BY_ID);) {
			
			preStmt.setInt(1, orderId);
			ResultSet rs = preStmt.executeQuery();
			
			while (rs.next()) {
				
				int oId = rs.getInt(1);
				String material = rs.getString(2);
				int quantity = rs.getInt(3);
				double totAmount = rs.getDouble(4);
				String siteName = rs.getString(5);
				String siteAddress = rs.getString(6);
				Date orderDate = rs.getDate(7);
				String deliveryDate = rs.getString(8);
				
				tempOrder = new Order(oId, material, quantity, totAmount, siteName, siteAddress, orderDate, deliveryDate);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tempOrder;
		
	}
	
	
	
	
	

}
