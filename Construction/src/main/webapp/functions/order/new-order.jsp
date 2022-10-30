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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/bootstrap-grid.css">

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_panel_custom.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/inventory_dashboard.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/order.css">
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
						NEW ORDER
					</div>

					<div class="col-12 col-sm-4 d-flex justify-content-center justify-content-sm-start new-stock-btn">
						<a href="./pending-orders.jsp" class="notification">
							<span>View All Orders</span>
							<!--span class="badge">3</span-->
						</a>
					</div>	
				</div>
				

				<div class="table-responsive table-responsive-sm d-flex justify-content-center dashboard-body-content" >
				
				
				

					<!-- Dashboard body -->
					<form action="new-order" method="post" class="row col-md-8 g-3 needs-validation" novalidate>
					
					<div class="form-row col-md-12">
						<div class="col-md-12 d-flex">
						  	<div class="col-md-2">Material</div>
						  	<div class="col-md-10 pink">
								<select id="material" name="material" class="form-control" onchange="myFunction()">
								  <option >Select a Material</option>
								  
									<%
										try {
											// fetch data from database
											Class.forName("com.mysql.jdbc.Driver");
											Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");
											Statement stmt = con.createStatement();
											
											String sql = "select idProducts, productName, quantity, unitPrice from products";
											ResultSet rs = stmt.executeQuery(sql);
											
											while (rs.next()) {
									%>
									
										<option value="<%=rs.getString(2) %>" data-matqty="<%=rs.getString(3) %>" data-unit-price="<%=rs.getString(4) %>"><%=rs.getString(2) %></option>
											
									<%
											}
											
										} catch(Exception e) {
											
										}
									%>								  
								  
								  
								</select>
							</div>
					  	</div>
					</div>
					
					<div class="form-row col-md-12">
						<div class="col-md-12 d-flex">
						  	<div class="col-md-2">Quantity</div>
						  	<div class="col-md-10"><input type="number" class="form-control" id="material-qty" name="material-qty"  min="1" placeholder="" onchange="myFunction()" required></div>
					  	</div>
					</div>
					
					<div class="form-row col-md-12">
						<div class="col-md-12 d-flex">
						  	<div class="col-md-2">Total Amount</div>
						  	<div class="col-md-10"><input type="text" class="form-control" id="totAmount"  name="totAmount" required></div>
					  	</div>
					</div>
					
					<div class="form-row col-md-12">
						<div class="col-md-12 d-flex">
						  	<div class="col-md-2">Site Name</div>
						  	<div class="col-md-10"><input type="text" class="form-control" id="siteName" name="siteName" required></div>
					  	</div>
					</div>
					
					<div class="form-row col-md-12">
						<div class="col-md-12 d-flex">
						  	<div class="col-md-2">Site Address</div>
						  	<div class="col-md-10"><input type="text" class="form-control" id="siteAddress" name="siteAddress" required></div>
					  	</div>
					</div>
					
					<div class="form-row col-md-12">
						<div class="col-md-12 d-flex">
						  	<div class="col-md-2">Delivery Date</div>
						  	<div class="col-md-10"><input type="date" class="form-control" id="deliveryDate" name="deliveryDate" required></div>
					  	</div>
					</div>
					  
				  	<div class="col-md-12 alert alert-danger" id="danger-alert" role="alert">
				  		
					</div>
					  
					  
					  <div class="col-12">
					    <button class="btn btn-success" type="submit">Place a Order</button>
					    <button class="btn btn-danger" type="reset">Reset</button>
					  </div>
					  
					  
					</form>
					

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
		
		
		<!-- Change Material quantity -->
		function myFunction() {
			  var x = document.getElementById("material").selectedIndex;
			  var k = document.getElementsByTagName("option")[x].getAttribute("data-matqty");
			  var unitPrice = document.getElementsByTagName("option")[x].getAttribute("data-unit-price");
			  
			  document.getElementById("material-qty").placeholder = "Available Quantity : " + k;
			  document.getElementById("material-qty").max = k;
			  
			  
			  if ( (document.getElementById("material-qty").value) != null ) {
				  var totPrice = unitPrice * document.getElementById("material-qty").value;
				  document.getElementById("totAmount").value = totPrice + ".00";
			  }
			  
			  if ( (document.getElementById("material-qty").value) <= k ) {
				  document.getElementById("danger-alert").innerHTML = "You Can buy";
			  } else {
				  console.log("CAnt");
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
	
	
	

</body>
</html>