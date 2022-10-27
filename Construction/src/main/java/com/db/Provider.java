package com.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Provider {
	
	
	public static Connection getMysqlConnection() {
		Connection con = null;
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","%chess%");
			
		}
		
		catch (Exception e) {
			
			// TODO: handle exception
			e.printStackTrace();
		}
		
	
		
		return con;
	}
}
	