

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
	<title>Add Products</title>
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
				<img src="../../resources/header_images/uptrend_logo.png" class="img-fluid">
			</div>

			<div class="col-12 col-sm-3 d-flex align-items-center justify-content-center home-btn-parent">
				<button type="button" class="nav-home-btn theme-bg-color" onclick="location.href='../user management/admin_panel.jsp'">Home</button>
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
							Analytics
						</div>
						<div onclick="location.href='Report.jsp'">
							<i class="bi bi-file-earmark-spreadsheet-fill"></i>
							Report
						</div>
						<div onclick="location.href='Bin.jsp'">
							<i class="bi bi-trash-fill"></i>
							Bin
						</div>	
					</div>
				</div>
				<br>
			</div>
			<h5 style="margin-left:7% ;margin-top: 2%;">Add Product </h5>  
			<h5 style="margin-left:30% ;margin-top: 1%;"><button type="submit" onclick="location.href='ProductDashbaord.jsp';" class="btn btn-warning" style="margin-top: 1%;">View Products</button>
			</h5>
			<br><br><br><br><br><br><br><br><br><br><br><br>
			
			
			<form style="margin-left:-47%;margin-top: 7%;width:60%;" action="../../com.controller.insert">
				<div class="form-row">
				  <div class="form-group col-md-6">
					<label for="inputEmail4">Product Name</label>
					<input type="text" name="productname" class="form-control" id="inputEmail4" placeholder="Product Name" required>
				  </div>
				  <div class="form-group col-md-6">
					<label for="exampleFormControlTextarea1">Product Description</label>
					<textarea name="productdescription" class="form-control" id="exampleFormControlTextarea1" rows="1" required></textarea>
				  </div>
				</div>
				
				<div class="form-row">
					<div class="form-group col-md-6">
					  <label for="inputEmail4">Supplier Name</label>
					  <input type="text" name="suppliername" class="form-control" id="inputEmail4" placeholder="Product Name" required>
					</div>
					<div class="form-group col-md-6">
						<label for="inputEmail4">Supplier Mobile</label>
						<input type="tel"  name="mobile" class="form-control" id="inputEmail4" placeholder="Product Name" pattern="^\d{10}$" required>
					  </div>
					</div>
					


				<div class="form-row">
				  <div class="form-group col-xs-6">
					<label for="inputCity">Quantity</label>
					<input type="number" name="quantity" class="form-control" id="inputCity" required>
				  </div>
				  <div class="form-group col-xs-5">
					<label for="inputCity">Unit Price</label>
					<input type="number" name="price" class="form-control" id="inputCity" step='0.01' value='0.00' placeholder='0.00' required>
				  </div>
				
				</div>
		
		</font>
				<button type="submit" class="btn btn-success">Add Product</button>
						<font color="blue" style="font-size:20px;font-weight: bold;margin-left:30%;"> <%
			if(request.getParameter("msg1") != null)
				out.print(request.getParameter("msg1"));
		%>
			  </form>




		


	
</body>

	
</html>