package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.OrderDBUtil;
import com.model.Order;

@WebServlet("/OrderCtrl")
public class OrderCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private OrderDBUtil orderDBUtil;
	
    public OrderCtrl() {
    	orderDBUtil = new OrderDBUtil();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getServletPath();
		
		switch (action) {
		
		case "/functions/order/approve-req":
			try {
				fillApprovalModal(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
			break;
			
		case "/functions/order/decline-req":
			try {
				fillDeclineModal(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}	
			break;
		
		case "/functions/order/view-req":
			try {
				fillViewModal(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}	
			break;
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getServletPath();
		
		switch (action) {
		
		case "/functions/order/new-order":
			try {
				placeNewOrder(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
			break;
			
		case "/functions/order/approve":
			try {
				approveOrder(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			break;
			
		case "/functions/order/decline":
			try {
				declineOrder(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			} 
			break;
			
		}
		
		
		
	}
	
	
	/* ------------------------------------------------------- */
//	int orderId;
//	String material;
//	int quantity;
//	double totAmount;
//	String siteName;
//	String siteAddress;
//	String orderDate;
//	String deliveryDate;
	
	
	private void placeNewOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		String material = request.getParameter("material");
		int quantity = Integer.parseInt(request.getParameter("material-qty")) ;
		double totAmount = Double.parseDouble(request.getParameter("totAmount"));
		String siteName = request.getParameter("siteName");
		String siteAddress = request.getParameter("siteAddress");
		String deliveryDate = request.getParameter("deliveryDate") ;
		
		Order order = new Order(material, quantity, totAmount, siteName, siteAddress, deliveryDate);
		boolean insertionStatus = orderDBUtil.placNewOrder(order);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("new-order.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	
	private void fillApprovalModal(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		Order reqOrderRecord = orderDBUtil.selectOrderById(orderId);
		request.setAttribute("reqOrderRecord", reqOrderRecord);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("pending-orders.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	private void fillDeclineModal(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		Order reqDeclineOrderRecord = orderDBUtil.selectOrderById(orderId);
		request.setAttribute("reqDeclineOrderRecord", reqDeclineOrderRecord);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("pending-orders.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	private void fillViewModal(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		Order viewRecord = orderDBUtil.selectOrderById(orderId);
		request.setAttribute("viewRecord", viewRecord);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("pending-orders.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	private void approveOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException, ParseException {

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		
		Date date = formatter.parse(request.getParameter("orderDate"));
		java.sql.Date sqlOrderDate = new java.sql.Date(date.getTime());
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		String material = request.getParameter("material");
		int quantity = Integer.parseInt(request.getParameter("material-qty")) ;
		double totAmount = Double.parseDouble(request.getParameter("totAmount"));
		String siteName = request.getParameter("siteName");
		String siteAddress = request.getParameter("siteAddress");
		String deliveryDate = request.getParameter("deliveryDate") ;
		Date orderDate = sqlOrderDate;
		
		Order order = new Order(orderId, material, quantity, totAmount, siteName, siteAddress, orderDate, deliveryDate);
		boolean insertionStatus = orderDBUtil.orderApproval(order);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("pending-orders.jsp");
		dispatcher.forward(request, response);
	}
	
	
	private void declineOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));
		
		boolean isDeclined = orderDBUtil.declineOrder(orderId);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("pending-orders.jsp");
		dispatcher.forward(request, response);
	}
	
	
	

}
