package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.products;
import com.db.crud;

/**
 * Servlet implementation class insert
 */
@WebServlet("/com.controller.insert")
public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String productname=request.getParameter("productname");
		String productdescription=request.getParameter("productdescription");
		String suppliername=request.getParameter("suppliername");
		int mobile=Integer.parseInt(request.getParameter("mobile"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		float price =Float.parseFloat(request.getParameter("price"));
		float subamount= quantity*price;
		
		products p1 = new products();
		
		p1.setProductName(productname);
		p1.setDescription(productdescription);
		p1.setSupplier(suppliername);
		p1.setMobile(mobile);
		p1.setQuantity(quantity);
		p1.setPrice(price);
		p1.setSubTotal(subamount);
		
		
		boolean status = crud.insert(p1);
		
		if(status)
		{
			String msg1 = "Added Product :"+ p1.getProductName();
	    	response.sendRedirect("functions/products/AddProducts.jsp?msg1="+msg1);
		}
		else
		{
			String msg2 = "Supplier not Added";
	    	response.sendRedirect("AddProducts.jsp?msg2="+msg2);
		}
		
		
		
	
	}
		
		
		
}

	


