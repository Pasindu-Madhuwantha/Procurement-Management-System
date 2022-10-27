package com.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;

import com.model.products;
import com.db.Provider;




public class crud {
	
	public static boolean insert(products p1){
		boolean status =false;
		
		Connection con = Provider.getMysqlConnection();
String sql="insert into products(productName,productDiscription,suplier,mobile,quantity,unitPrice,totalAmount,date) values(?,?,?,?,?,?,?,now())";
		
		try {

			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,p1.getProductName().trim());
			pst.setString(2,p1.getDescription());
			pst.setString(3,p1.getSupplier().trim());
			pst.setInt(4,p1.getMobile());
			pst.setDouble(5,p1.getQuantity());
			pst.setDouble(6,p1.getPrice());
			pst.setDouble(7,p1.getSubTotal());
			  
		    int val = pst.executeUpdate();
		    if(val > 0)
		    {
		    	status =true;
		    }
		    else
		    {
		    	status = false;
		    }
			
			}
			
			
		catch(Exception e) {
			e.printStackTrace();
		}
		
		finally {
		    if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		  }
		
		
		return status;
		
	}
	
	public static ArrayList<products> getAllRecords() throws SQLException
	{
		ArrayList<products> samp=new ArrayList<products>();
		samp.clear();
		Connection con =Provider.getMysqlConnection();
		String sql="select* from products order by idproducts DESC";
		try {
			
			PreparedStatement pst= con.prepareStatement(sql);
			
			ResultSet rs=pst.executeQuery(sql);
			while(rs.next()) {
				products p1= new products();
				
				p1.setId(rs.getInt("idproducts"));
				p1.setProductName(rs.getString("productName"));
				p1.setDescription(rs.getString("productDiscription"));
				p1.setSupplier(rs.getString("suplier"));
				p1.setMobile(rs.getInt("mobile"));;
				p1.setQuantity(rs.getInt("quantity"));
				p1.setPrice(rs.getInt("unitPrice"));
				p1.setSubTotal(rs.getDouble("totalAmount"));
				p1.setDate(rs.getDate("date"));
				samp.add(p1);
				
								
			}
			
			
			
			
		}
		
		catch(Exception e2) {
			
			e2.printStackTrace();
		}
		
		finally {
		    if (con != null)
		      con.close();
		  }
		
		return samp;
		
		
		
		
		
	}
	
	
	public static int UpdateRecords(int id,String productName,String productDiscription,String suplier,int mobile,int Quantity,Double unitPrice,Double subAmount) throws SQLException {
		int status =0;
		Connection con= Provider.getMysqlConnection();
		String sql ="update products set idproducts=?,productName=?,productDiscription=?,suplier=?,mobile=?,quantity=?,unitPrice=?,totalAmount=? where idproducts="+id;
		
		
		try {
			PreparedStatement pst=con.prepareStatement(sql);
		
			pst.setInt(1,id);
			pst.setString(2,productName);
			pst.setString(3,productDiscription);
			pst.setString(4,suplier);
			pst.setInt(5,mobile);
			pst.setInt(6,Quantity);
			pst.setDouble(7,unitPrice);
			pst.setDouble(8,subAmount);
			
			
			int val = pst.executeUpdate();
			if(val > 0)
			{
				status = 1;
			}
			else
			{
				status = -1;
			}
			
			}
		
		catch(Exception f) {
			status =2;
			f.printStackTrace();
		}
		
		finally {
		    if (con != null)
		      con.close();
		  }
		
		
		return status;
		
		
	}
	
	
public static int deleteRecord(int id) throws SQLException {
	
		int status = 0;
		Connection con=Provider.getMysqlConnection();
		String sql="delete from products where idproducts=?";
		
		try {
			
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1,id);
			
		
			int val = pst.executeUpdate();
		    if(val > 0)
		    {
		    	status =1;
		    }
		    else
		    {
		    	status = 0;
		    }
			
			
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		finally {
		    if (con != null)
		      con.close();
		  }
		
		return status;
		
		
	
}

//	
//public static ArrayList<Supplier> getAllDeletedRecords() throws SQLException
//{
//	ArrayList<Supplier> samp=new ArrayList<Supplier>();
//	samp.clear();
//	Connection con =Provider.getMysqlConnection();
//	String sql="select* from supplier_deleted order by deleted_time DESC";
//	try {
//		
//		PreparedStatement pst= con.prepareStatement(sql);
//		
//		ResultSet rs=pst.executeQuery(sql);
//		while(rs.next()) {
//			Supplier s1= new Supplier();
//			s1.setSupplierID(rs.getInt("supplier_id"));
//			s1.setSupplierName(rs.getString("supplier_name"));
//			s1.setEmail(rs.getString("supplier_email"));
//			s1.setAddress(rs.getString("supplier_address"));
//			s1.setContact(rs.getInt("supplier_contact"));
//			s1.setItem(rs.getString("supplier_item"));
//			s1.setQuantity(rs.getInt("quantity"));
//			s1.setPrice(rs.getFloat("price"));
//			s1.setSubamount(rs.getFloat("sub_amount"));
//			s1.setDate(rs.getDate("date"));
//			s1.setTime(rs.getTimestamp("deleted_time"));
//			samp.add(s1);
//	
//			
//		}
//		
//		
//		
//		
//	}
//	
//	catch(Exception e2) {
//		
//		e2.printStackTrace();
//	}
//	
//	finally {
//	    if (con != null)
//	      con.close();
//	  }
//	
//	return samp;
//	
//	
//	
//}
//	
//to get total expenditure for the report

	public static float getTotal() throws SQLException {
		
		Connection con =Provider.getMysqlConnection();
		String sql ="select SUM(sub_amount) from supplier";
		PreparedStatement pst = con.prepareStatement(sql);
		
		
		ResultSet rs = pst.executeQuery();
		float sum=0;
		
		while(rs.next()) {
			
			sum=rs.getFloat(1);
		
		
			
		}
		
		return sum;
}
	
	//to get total days for the report
	
	public static int getTotDates() throws SQLException {
		
		Connection con =Provider.getMysqlConnection();
		String sql ="SELECT DATEDIFF(NOW(),date)\r\n"
				+ "from supplier\r\n"
				+ "limit 1\r\n"
				+ "";
		PreparedStatement pst = con.prepareStatement(sql);
		
		ResultSet rs = pst.executeQuery();
		
		int count=0;
		
		while(rs.next()) {
			
			count =rs.getInt(1);
			
		}
		
		
		
		return count;
		
}
	
	//for item table in report
	
//	public static ArrayList<Supplier> getItems() throws SQLException
//	{
//		ArrayList<Supplier> samp=new ArrayList<Supplier>();
//		samp.clear();
//		Connection con =Provider.getMysqlConnection();
//		String sql="select distinct supplier_item,sum(quantity),sum(sub_amount),count(supplier_item) \r\n"
//				+ "from supplier \r\n"
//				+ "group by supplier_item";
//		try {
//			
//			PreparedStatement pst= con.prepareStatement(sql);
//			
//			ResultSet rs=pst.executeQuery(sql);
//			while(rs.next()) {
//				Supplier s1= new Supplier();
//				s1.setItem(rs.getString("supplier_item"));
//				s1.setTotalQuantity(rs.getInt("sum(quantity)"));
//				s1.setSubTotal(rs.getFloat("sum(sub_amount)"));
//				s1.setCount(rs.getInt("count(supplier_item)"));
//				
//				samp.add(s1);
//		
//				
//			}
//			
//			
//			
//			
//		}
//		
//		catch(Exception e2) {
//			
//			e2.printStackTrace();
//		}
//		
//		finally {
//		    if (con != null)
//		      con.close();
//		  }
//		
//		return samp;
//		
//		
//		
//	}
	

	public static int deleteRecord1(int id) throws SQLException {
		
		int status = 0;
		Connection con=Provider.getMysqlConnection();
		String sql="delete from supplier_deleted where supplier_id=?";
		
		try {
			
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1,id);
			
		
			int val = pst.executeUpdate();
		    if(val > 0)
		    {
		    	status =1;
		    }
		    else
		    {
		    	status = 0;
		    }
			
			
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		finally {
		    if (con != null)
		      con.close();
		  }
		
		return status;
		
		
	
}

	
	
	
}
