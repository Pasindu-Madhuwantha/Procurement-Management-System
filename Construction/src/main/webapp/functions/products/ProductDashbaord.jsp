<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.db.crud"%>
<%@page import="com.model.products"%>
<%@page import="java.util.ArrayList"%>

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
<title>Products Dashboard</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="../../resources/supplier styles/NewFile.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/supplier styles/admin_media_query.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/supplier styles/supplier_dashboard.css">
<link rel="stylesheet" href="../../resources/supplier styles/styles.css">

</head>

<body>
	<!-- Header -->
	<div class="p-2 container-fluid theme-bg-color"
		style="margin-left: -8%;">
		<div class="container"">
			<div class="row">
				<div class="col-12 col-sm-2">
									<h4 style="color:white;">Construction C</h4>
					
				</div>

				<div
					class="col-12 col-sm-3 d-flex align-items-center justify-content-center home-btn-parent">
					<button type="button" class="nav-home-btn theme-bg-color"
						onclick="location.href='../user management/admin_panel.jsp'">Home</button>
				</div>

				<div
					class="col-12 col-sm-7 d-flex align-items-center media-flex hide">
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
					<div
						class="admin-logo d-flex align-items-center justify-content-center">
						<img src="../../resources/body_images/admin_logo.png"
							class="img-fluid">
					</div>

					<div class="admin-option">
						<div onclick="location.href='#Dashboard'">
							<i class="bi bi-speedometer"></i> Dashboard
						</div>
						<div onclick="location.href='ProductDashbaord.jsp'">
							<i class="bi bi-pie-chart-fill"></i> Products
						</div>
						<div onclick="location.href='Report.jsp'">
							<i class="bi bi-file-earmark-spreadsheet-fill"></i> Suppliers
						</div>
						<div onclick="location.href='Bin.jsp'">
							<i class="bi bi-trash-fill"></i> Orders
						</div>
					</div>
				</div>

			</div>
			
			
					<div class="col-12 col-sm-12 col-md-10">
				<div class="dashboard-body-title">
					Products Dashboard
					<h5 style="margin-left:40% ;margin-top: -4%;"><button type="submit" onclick="location.href='AddProducts.jsp';" class="btn btn-success">Add Products</button>
					
					<a href="Report.jsp" class="btn btn-warning" style="width: 120px; margin-left:40%;">
		Report &nbsp <i class="fa fa-server"></i>
	</a>
	
	
	<a href="Analytics.jsp" class="btn btn-info" style="width: 120px; margin-left: 30%;margin-top:-11% ">
		Analytics &nbsp <i class="fas fa-chart-bar" aria-hidden="true"></i>

	</a>
					

				</div>

	
				<div class="dashboard-body-content">

					<div class="table">
						<table>
							<thead>
								<tr>
									<th>Action</th>
									<th>Product Id</th>
									<th>Product Name</th>
									<th>Product Description</th>
									<th>Supplier Name</th>
									<th>Supplier Mobile</th>
									<th>Quantity</th>
									<th>Unit Price(Rs.)</th>
									<th>Sub Amount(Rs.)</th>
									<th>Date</th>



								</tr>
							</thead>
							<tr>

								<%
								ArrayList<products> allsuppliers = crud.getAllRecords();

								for (products p1 : allsuppliers) {
								%>
							
							<tbody>
								<tr>
									<td><a href="#" data-toggle="modal"
										data-target="#exampleModal1"
										data-href="EditData.jsp?sup=<%=p1.getId()%>"
										class="showModal" id="popup-btn" data-backdrop="static"
										data-keyboard="false"> <i class='far fa-edit fa-2x'></i></a>
										&nbsp <a href="#" data-toggle="modal"
										data-target="#deletemodal"
										data-href="DeleteData.jsp?del=<%=p1.getId()%>"
										class="showModal1"><i style="color: crimson;"
											class='fas fa-trash-alt fa-2x'></i></a> &nbsp</td>
									<td><%=p1.getId()%></td>
									<td><%=p1.getProductName()%></td>
									<td><%=p1.getDescription()%></td>
									<td><%=p1.getSupplier()%></td>
									<td>0<%=p1.getMobile()%></td>
									<td><%=p1.getQuantity()%></td>
									<td><%=p1.getPrice()%>0</td>
									<td><%=p1.getSubTotal()%>0</td>
									<td><%=p1.getDate()%></td>
									

								</tr>

							</tbody>

							<div id="deletemodal" class="modal fade" tabindex="-1"
								role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document"
									style="width: 105% !important;">
									<div class="modal-content border-0"
										style="width: 105% !important;">
										<div class="modal-body p-0" style="width: 105% !important;">
											<div class="card border-0 p-sm-3 p-2 justify-content-center">
												<div class="card-header pb-0 bg-white border-0 ">
													<div class="row">
														<div class="col ml-auto">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
													</div>
													<p class="font-weight-bold mb-2" style="font-size: 20px">
														Are you sure you wanna delete this ?</p>
													<p class="text-muted " style="font-size: 20px">Record
														Record Will Be Permanently Deleted!!!</p>
												</div>
												<div class="card-body px-sm-4 mb-2 pt-1 pb-0">
													<div class="row justify-content-end no-gutters">

														<div style="margin-right: 5% !important">
															<button type="button" class="btn btn-light text-muted"
																data-dismiss="modal" style="font-size: 15px">Cancel</button>
														</div>
														&nbsp&nbsp
														<div>
															<a href="DeleteData.jsp?del=<%=p1.getId()%>"
																class="btn btn-danger" style="font-size: 15px">Delete</a>
														</div>
														&nbsp


													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>


							<script>
	
	$(document).ready(function() {
		  $(".showModal1").click(function(e) {       //delete modal data bind
		    e.preventDefault();
		    var url = $(this).attr("data-href");
		    $("#deletemodal a").attr("href", url);
		    $("deletemodal").modal("show");
		  });
		});

</script>






							<style>
iframe {
	height: 100%;
}
</style>





							<div class="modal fade" id="exampleModal1" tabindex="-1"
								role="dialog" aria-labelledby="example" aria-hidden="true">
								<div class="modal-dialog" role="document"
									style="width: 200%; height: 97.5% !important;">
									<div class="modal-content"
										style="width: 200%; height: 97.5% !important; left: -50%;">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Edit
												Details</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close" style="color: black;" id="close-btn">
												<i class="fa fa-window-close" aria-hidden="true"></i>
											</button>
										</div>


										<iframe src="EditData.jsp?sup=<%=p1.getId()%>"
											frameborder="0"></iframe>
									</div>
								</div>

							</div>

							<script>
	// Attach event listener to open popup
    document.getElementById(
'popup-btn').addEventListener('click', (e)=>{
        document.getElementById(
'exampleModal1').style.visibility = "visible";								//Edit Data Window Refresh
    })

//Attach event listener to first close popup and then refresh page
    document.getElementById(
'close-btn').addEventListener('click', (e) => {
        document.getElementById(
'exampleModal1').style.visibility = "hidden";
        window.location.reload();
        
      
        
        
    });
	

</script>


							<script>
	
	$(document).ready(function() {
		  $(".showModal").click(function(e) {
		    e.preventDefault();
		    var url = $(this).attr("data-href");						//Edit Window Data Bind
		    $("#exampleModal1 iframe").attr("src", url);
		    $("exampleModal1").modal("show");
		  });
		});

</script>








							<%
							}
							%>

						</table>

						<style>
iframe {
	height: 100%;
}
</style>



						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document"
								style="width: 200%; height: 95% !important;">
								<div class="modal-content"
									style="width: 200%; height: 95% !important; left: -50%;">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Add
											Details</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close" id="close-btn1">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>


									<iframe src="AddData.jsp" frameborder="0"></iframe>
								</div>
							</div>

						</div>


						<script>
// Attach event listener to open popup
document.getElementById(
'popup-btn1').addEventListener('click', (e)=>{
	document.getElementById(
'exampleModal').style.visibility = "visible";					//Add Data Window Refresh
})

//Attach event listener to first close popup and then refresh page
document.getElementById(
'close-btn1').addEventListener('click', (e) => {
	document.getElementById(
'exampleModal').style.visibility = "hidden";
	window.location.reload();
	
  
	
	
});


</script>


					</div>
				</div>
			</div>
		</div>
	</div>





	<!-- Footer -->
	<div
		class="p-4 container-fluid theme-bg-color d-flex justify-content-center align-items-center">
		<div class="footer-title text-center">Copyright@2022 C Construction -
			All Rights Reserved</div>
	</div>
</body>
</html>