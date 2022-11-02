<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.db.crud"%>
<%@page import="com.model.products"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" %>

<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	





	<meta charset="ISO-8859-1">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Report</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="../../resources/supplier styles/NewFile.css">
	<link rel="stylesheet" type="text/css" href="../../resources/supplier styles/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="../../resources/supplier styles/supplier_dashboard.css">
	<link rel="stylesheet" href="../../resources/supplier styles/styles.css">
	
</head>

<body>
	<!-- Header -->
	<div class="p-2 container-fluid theme-bg-color" style="margin-left:-8%;">
		<div class="container"">
			<div class="row" >
			<div class="col-12 col-sm-2" >
								<h4 style="color:white;">Construction C</h4>

			</div>

			<div class="col-12 col-sm-3 d-flex align-items-center justify-content-center home-btn-parent">
				<button type="button" class="nav-home-btn theme-bg-color">Home</button>
			</div>

			<div class="col-12 col-sm-7 d-flex align-items-center media-flex hide">
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
						<img src="../../resources/body_images/admin_logo.png" class="img-fluid">
					</div>

					<div class="admin-option">
					<div onclick="location.href='#Dashboard'">
							<i class="bi bi-speedometer"></i>
							Dashboard
						</div>
						<div onclick="location.href='Analytics.jsp'">
							<i class="bi bi-pie-chart-fill"></i>
					          Products
						</div>
						<div onclick="location.href='Report.jsp'">
							<i class="bi bi-file-earmark-spreadsheet-fill"></i>
							  Suppliers
						</div>
						<div onclick="location.href='Bin.jsp'">
							<i class="bi bi-trash-fill"></i>
							Orders
						</div>	
					</div>
				</div>

			</div>	
		<div class="dashboard-body-title">
					Report
						<br><br><br><br>

       		</div>
       		
       		<br><br><br><br>
  
<div class="row " style="margin-top: 5%; margin-left:32%; position: absolute; z-index: -1">
  <div class="col-sm-6">
    <div class="card text-white bg-info mb-" style="width:310px;height:110px">
      <div class="card-body">
     <h2 style="text-align: center; color:black;">Total Expenditure</h2>
        <h3 style="text-align: center; color: white">Rs.<%=crud.getTotal() %>0</h3>
        
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card text-white bg-info mb-" style="width:310px;height:110px;margin-left:43%">
      <div class="card-body">
       <h2 style="text-align: center; color: black">Date Count</h2>
        <h3 style="text-align: center; color: white"><%=crud.getTotDates() %> Days</h3>
   
      </div>
    </div>
  </div>
</div>





<div style="margin-top: 14%">
<table class="table table-bordered table-dark " style="margin-left:2%; width:150%">



		<thead style="color: bisque;">


			<tr>
	
				<th>Product Name</th>
				<th>Total Quantity</th>
				<th>Total Cost</th>
				<th>Item Count</th>
				
			</tr>
			
			
		</thead>
		<tr>
		
					
				<%
		int i=0;
		 ArrayList<products> allproducts = crud.getItems();
		
		for(products p1 : allproducts)
		{
		
		%>
	<tbody>
		<tr>
		<td><%=p1.getProductName()%></td>
		<td><%=p1.getTotalQuantity()%></td>
		<td><%=p1.getSubTotal() %>0</td>
		<td><%=p1.getCount() %></td>
		<tr>
		
		
			
				
		</tbody>
		
		
</div>



	<%
		}
		%>
		</table>
		
       							
       	</div>
   </div>
</div>
	
	
	
	

				
				
	


	<!-- Footer -->
	<div  style="width:100%;"class="p-4 container-fluid theme-bg-color d-flex justify-content-center align-items-center">
			<div class="footer-title text-center">Copyright@2022 C Construction -
			All Rights Reserved</div>
	</div>
</body>
</html>