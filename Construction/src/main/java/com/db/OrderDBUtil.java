package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.model.Order;

public class OrderDBUtil {
	
	// SQL Queries --------------------------------------------------------------
	
	private static String PLACE_NEW_ORDER = "INSERT INTO orders(material, quantity, totalAmount, siteName, siteAddress,"
			+ "orderDate, deliveryDate) VALUES(?, ?, ?, ?, ?, ?, ?) ";
	
	private static String GET_ORDER_BY_ID = "SELECT * FROM orders WHERE idorders=?";
	
	private static String APPROVE_ORDER = "INSERT INTO suplierorder(idorders, material, quantity, totalAmount, siteAddress, "
			+ "orderDate, deliveryDate) VALUES(?, ?, ?, ?, ?, ?, ?)";
	
	

	
	
	
	// -------------------------------------------------------------------------------
	
	public boolean placNewOrder(Order order) {
		
		int result = 0;
		int currentQuantity = 0;
		
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

			result = preStmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (result == 1) {

			String GET_CURRENT_QUANTITY = "SELECT quantity FROM products WHERE productName=?";
			
			try (Connection connection = DBConnection.getConnection();
					PreparedStatement preStmt = connection.prepareStatement(GET_CURRENT_QUANTITY);) {
				
				preStmt.setString(1, order.getMaterial());
				ResultSet rs = preStmt.executeQuery();
				
				while (rs.next()) {
					currentQuantity = rs.getInt(1);
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		if (currentQuantity > 0) {
			
			String UPDATE_PRODUCTS = "UPDATE products SET quantity=? WHERE productName=?";
			
			try (Connection connection = DBConnection.getConnection();
					PreparedStatement preStmt = connection.prepareStatement(UPDATE_PRODUCTS);) {
				
				preStmt.setInt(1, (currentQuantity - order.getQuantity()));
				preStmt.setString(2, order.getMaterial());

				preStmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
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
	
	
	
	
	public boolean orderApproval(Order order) {
		
		int approvalStatus = 0;
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(APPROVE_ORDER);) {
			
			preStmt.setInt(1, order.getOrderId());
			preStmt.setString(2, order.getMaterial());
			preStmt.setInt(3, order.getQuantity());
			preStmt.setDouble(4, order.getTotAmount());
			preStmt.setString(5, order.getSiteAddress());
			preStmt.setDate(6, (java.sql.Date) order.getOrderDate() );
			preStmt.setString(7, order.getDeliveryDate());
			
			approvalStatus = preStmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("approvalStatus : " + approvalStatus);
		
		if ( approvalStatus == 1 ) {
			
			String CHECKED_AS_APPROVED = "UPDATE orders SET orderStatus=? WHERE idorders=?";
			
			try (Connection connection = DBConnection.getConnection();
					PreparedStatement appStmt = connection.prepareStatement(CHECKED_AS_APPROVED);) {
				
				appStmt.setString(1, "approved");
				appStmt.setInt(2, order.getOrderId());

				appStmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return true;
		
	}
	
	
	public boolean declineOrder(int orderId) {
		
		String DECLINE_ORDER = "UPDATE orders SET orderStatus=? WHERE idorders=?";
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(DECLINE_ORDER);) {
			
			preStmt.setString(1, "declined");
			preStmt.setInt(2, orderId);

			preStmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
		
	}
	
	

}
