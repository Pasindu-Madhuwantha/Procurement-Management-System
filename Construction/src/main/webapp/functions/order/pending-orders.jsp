<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Order</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/bootstrap-grid.css">

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_panel_custom.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/inventory_dashboard.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/order.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/delete.css">
</head>


<body>

	<!-- Header -->
	<div class="p-2 container-fluid theme-bg-color">
		<div class="container-flex">
			<div class="row">
				<div class="col-12 col-sm-3 header-title">
					<h3>C Construction</h3>
				</div>
	
				<div class="col-12 col-sm-3 d-flex align-items-center justify-content-center home-btn-parent">
					<button type="button" class="nav-home-btn theme-bg-color" onclick="location.href='http://localhost:8090/Uptrend/functions/common/admin_panel.jsp'">Home</button>
				</div>
	
				<div class="col-12 col-sm-5 d-flex align-items-center media-flex hide">
					<div class="row">
						<div class="col d-flex flex-row-reverse align-items-center">
							<div class="p-2 online-icon"></div>
						</div>
						<div class="col admin-title">Admin</div>
					</div>
					
				</div>

			</div>
		</div>
	</div>

	<!-- Body -->
	<div class="container-fluid">
		<div class="row inventory-dash">
			<div class="col-12 col-sm-12 col-md-2 admin-option-column">
				<div class="sticky-top">
					<div class="admin-logo d-flex align-items-center justify-content-center">
						<img src="../../resources/body_images/uptrend_admin_logo.png" class="img-fluid">
					</div>

					<div class="admin-option">
						<div onclick="location.href='inventory-dashboard'" id="clickAfterPageLoad" class="active">
							<i class="bi bi-speedometer"></i>
							Dashboard
						</div>
						
						<div onclick="location.href='report'">
							<i class="bi bi-file-earmark-spreadsheet-fill"></i>
							Products
						</div>
						
						<div onclick="location.href='bin'">
							<i class="bi bi-trash-fill"></i>
							Supplier
						</div>	
						
						<div onclick="location.href='bin'">
							<i class="bi bi-trash-fill"></i>
							Orders
						</div>	
						
						<div onclick="location.href='bin'">
							<i class="bi bi-trash-fill"></i>
							Transaction
						</div>	
					</div>
				</div>
				
			</div>

			<div class="col-12 col-sm-12 col-md-10 inventory-space">
			
				<div class="row dashboard-title-row">
					<div class="col-12 col-sm-8 dashboard-body-title">
						PENDING ORDERS
					</div>

					<div class="col-12 col-sm-4 d-flex justify-content-center justify-content-sm-start new-stock-btn">
						<a href="newly-added-stock" class="notification">
							<span>Place a Order</span>
							<!--span class="badge">3</span-->
						</a>
					</div>	
				</div>
				
				
				<div class="navigation-btns mt-4">
				
					<button type="button" class="btn btn-info" onclick="myFunction(1)">All Orders</button>
					<button type="button" class="btn btn-info" onclick="myFunction(2)">Approved Orders</button>
					<button type="button" class="btn btn-info" onclick="myFunction(3)">Declined Orders</button>
					
				</div>
				
				
				<!-- All -->
				<div class="table-responsive table-responsive-sm dashboard-body-content" id="all-orders">
					
					<%
						try {
							// fetch data from database
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");
							Statement stmt = con.createStatement();
							
							String sql = "select * from orders";
							ResultSet rs = stmt.executeQuery(sql);
							
							while (rs.next()) {
					%>
					
						<div class="d-flex flex-row pending-order">
							<div class="col-md-9 d-flex flex-column order-details">
								<div class="d-flex flex-row">
									<p class="col-md-6">Order no: 00<%=rs.getString(1) %></p>
									<p class="col-md-6">Total Cost: <%=rs.getString(4) %></p>
								</div>
								<div class="d-flex align-items-center flex-row">
									<p class="col-md-6">Site Name: <%=rs.getString(5) %></p>
									<p class="col-md-6">Delivery Date: <%=rs.getString(8) %></p>
								</div>
							</div>
							
							<div class="col-md-3 order-action-btn d-flex align-items-center justify-content-center">
								<button class="btn btn-success mr-2" type="submit"  data-toggle="modal" data-target="#approve-modal" onclick="location.href='approve-req?orderId=<%=rs.getString(1) %>'">Approve</button>
						    	<button class="btn btn-danger mr-2" type="submit">Decline</button>
						    	<button class="btn btn-secondary mr-4" type="submit">View Details</button>
							</div>
						</div>
					
					<%
							}
							
						} catch(Exception e) {
							
						}
					%>		

				</div>
				
				<!-- Approved orders -->
				<div class="table-responsive table-responsive-sm dashboard-body-content" id="approved-orders"  style="display: none;">
					
					<%
						try {
							// fetch data from database
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");
							Statement stmt = con.createStatement();
							
							String sql = "select * from orders where orderStatus='approved'";
							ResultSet rs = stmt.executeQuery(sql);
							
							while (rs.next()) {
					%>
					
						<div class="d-flex flex-row pending-order">
							<div class="col-md-9 d-flex flex-column order-details">
								<div class="d-flex flex-row">
									<p class="col-md-6">Order no: 00<%=rs.getString(1) %></p>
									<p class="col-md-6">Total Cost: <%=rs.getString(4) %></p>
								</div>
								<div class="d-flex align-items-center flex-row">
									<p class="col-md-6">Site Name: <%=rs.getString(5) %></p>
									<p class="col-md-6">Delivery Date: <%=rs.getString(8) %></p>
								</div>
							</div>
							
							<div class="col-md-3 order-action-btn d-flex align-items-center justify-content-center">
								<button class="btn btn-success mr-2" type="submit">Approve</button>
						    	<button class="btn btn-danger mr-2" type="submit">Decline</button>
						    	<button class="btn btn-secondary mr-4" type="submit">View Details</button>
							</div>
						</div>
					
					<%
							}
							
						} catch(Exception e) {
							
						}
					%>		

				</div>
				
				<!-- Declined Orders -->
				<div class="table-responsive table-responsive-sm dashboard-body-content"  id="declined-orders"  style="display: none;">
					
					<%
						try {
							// fetch data from database
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");
							Statement stmt = con.createStatement();
							
							String sql = "select * from orders where orderStatus='declined'";
							ResultSet rs = stmt.executeQuery(sql);
							
							while (rs.next()) {
					%>
					
						<div class="d-flex flex-row pending-order">
							<div class="col-md-9 d-flex flex-column order-details">
								<div class="d-flex flex-row">
									<p class="col-md-6">Order no: 00<%=rs.getString(1) %></p>
									<p class="col-md-6">Total Cost: <%=rs.getString(4) %></p>
								</div>
								<div class="d-flex align-items-center flex-row">
									<p class="col-md-6">Site Name: <%=rs.getString(5) %></p>
									<p class="col-md-6">Delivery Date: <%=rs.getString(8) %></p>
								</div>
							</div>
							
							<div class="col-md-3 order-action-btn d-flex align-items-center justify-content-center">
								<button class="btn btn-success mr-2" type="submit">Approve</button>
						    	<button class="btn btn-danger mr-2" type="submit">Decline</button>
						    	<button class="btn btn-secondary mr-4" type="submit">View Details</button>
							</div>
						</div>
					
					<%
							}
							
						} catch(Exception e) {
							
						}
					%>		

				</div>
				
			</div>	
		</div>
	</div>

	



	<!-- Footer -->
	<div class="p-4 container-fluid theme-bg-color d-flex justify-content-center align-items-center">
		<div class="footer-title text-center">
			Copyright 2022 Uptrend - All Rights Reserved
		</div>
	</div>



	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- Custom Scripts -->
	<script>
		function myFunction() {
		  const element = document.getElementById("change-icon");

		  if(element.classList == "bi bi-plus-lg") {
		  	element.classList.remove("bi-plus-lg");
		  	element.classList.add("bi-dash-lg");
		  } else {
		  	element.classList.remove("bi-dash-lg");
		  	element.classList.add("bi-plus-lg");
		  }
		  
		}
		
		
		
		function myFunction(num) {
			
			  var all = document.getElementById("all-orders");
			  var approve = document.getElementById("approved-orders");
			  var decline = document.getElementById("declined-orders");
			  
			  if (num == 1) {
				  
				  all.style.display = "block";
				  approve.style.display = "none";
				  decline.style.display = "none";
				  
			  } else if (num == 2) {
				  
				  all.style.display = "none";
				  approve.style.display = "block";
				  decline.style.display = "none";
				  
			  } else if (num == 3) {
				  
				  all.style.display = "none";
				  approve.style.display = "none";
				  decline.style.display = "block";
				  
			  }
			}
		  
	</script>
	
	
	
	<c:if test="${inventoryRecord != null}">
		<script>
			$(document).ready(function(){
				$("#updateModal").modal("show");
			})
		</script>
	</c:if>
	
	
	<c:if test="${itemId != null}">
		<script>
			$(document).ready(function(){
				$("#deleteModal").modal("show");
			})
		</script>
	</c:if>
	
	
	
	<!------------------------------------------------------------------- Modals --------------------------------------------------------------------->
	
	<div class="modal fade" id="approve-modal" tabindex="-1" role="dialog" aria-labelledby="approve-modal" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">APPROVE ORDER?</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body d-flex justify-content-center">
	        
			<!-- Modal Body -->
			<form action="new-order" method="post" class="row col-md-10 needs-validation" novalidate>
			
				<c:forEach var="reqOrderRecord" items="${reqOrderRecord}">
					
					
					<div class="form-row col-md-12 d-flex align-items-center">
					  	<div class="col-md-4">Order ID</div>
					  	<div class="col-md-8"><input type="text" class="form-control" id="orderId" name="orderId" value="<c:out value="${reqOrderRecord.orderId}" />" required></div>
				  	</div>
					
					<div class="form-row col-md-12 d-flex align-items-center">
					  	<div class="col-md-4">Material</div>
					  	<div class="col-md-8"><input type="text" class="form-control" id="material" name="material" required></div>
				  	</div>
				  	
				  	<div class="form-row col-md-12 d-flex align-items-center">
					  	<div class="col-md-4">Quantity</div>
					  	<div class="col-md-8"><input type="number" class="form-control" id="material-qty" name="material-qty"  min="1" placeholder="" onchange="myFunction()" required></div>
				  	</div>
				  	
				  	<div class="form-row col-md-12 d-flex align-items-center">
					  	<div class="col-md-4">Total Amount</div>
					  	<div class="col-md-8"><input type="number" class="form-control" id="totAmount" name="totAmount" required></div>
				  	</div>
				  	
				  	<div class="form-row col-md-12 d-flex align-items-center">
					  	<div class="col-md-4">Site Name</div>
					  	<div class="col-md-8"><input type="text" class="form-control" id="siteName" name="siteName" required></div>
				  	</div>
				  	
				  	<div class="form-row col-md-12 d-flex align-items-center">
					  	<div class="col-md-4">Site Address</div>
					  	<div class="col-md-8"><input type="text" class="form-control" id="siteAddress" name="siteAddress" required></div>
				  	</div>
				  	
				  	<div class="form-row col-md-12 d-flex align-items-center">
					  	<div class="col-md-4">Order Date</div>
					  	<div class="col-md-8"><input type="date" class="form-control" id="orderDate" name="orderDate" required></div>
				  	</div>
				  	
				  	<div class="form-row col-md-12 d-flex align-items-center">
					  	<div class="col-md-4">Delivery Date</div>
					  	<div class="col-md-8"><input type="date" class="form-control" id="deliveryDate" name="deliveryDate" required></div>
				  	</div>
				
				</c:forEach>		
					  
			</form>


	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-success">Approve</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	

</body>
</html>