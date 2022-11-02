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
	<title>Analytics</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="../../resources/supplier styles/NewFile.css">
	<link rel="stylesheet" type="text/css" href="../../resources/supplier styles/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="../../resources/supplier styles/supplier_dashboard.css">
	<link rel="stylesheet" href="../../resources/supplier styles/styles.css">
	
</head>

<body onload="fun1();fun2();">
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
	<div class="container-fluid" ">
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
						<div onclick="location.href='AddProducts.jsp'">
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
					Analytics
						<br><br><br><br>

       		</div>
       		
       		<br><br><br><br>
  
			<div >

				<%
				//bar chart
				
				Gson gsonObj=new Gson();
				Map<Object,Object> map = null;
				List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

				
			
				 ArrayList<products> allsuppliers1 = crud.getItems();
				
				for(products s1 : allsuppliers1)
				{
					double y=s1.getSubTotal();
					String t = s1.getProductName();
					
					 map = new HashMap<Object,Object>(); 

					
					map.put("label",t); map.put("y",y); 
					list.add(map);



				}


				String dataPoints = gsonObj.toJson(list);


 


%>
		

    
		

	

		<br>



<%
			//Pie Chart


				Gson gsonObj1=new Gson();
				Map<Object,Object> map1 = null;
				List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();

				
			
				 ArrayList<products> allsuppliers2 = crud.getItems();
				
				for(products s2 : allsuppliers2)
				{
					float y1=s2.getTotalQuantity();
					String t1 = s2.getProductName();
					
					 map1 = new HashMap<Object,Object>(); 

					
					map1.put("label",t1); map1.put("y",y1); 
					list1.add(map1);



				}


				String dataPoints1 = gsonObj1.toJson(list1);


 


%>

		
	<div id="chartContainer" style="margin-left:-15%;height: 600px; width:800px;margin-top: 8%"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>	
<br>

<div id="chartContainer1" style="margin-left:-15%;height: 600px; width:800px;margin-top:14%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>





<script type="text/javascript">


	function fun1() {
		var chart1 = new CanvasJS.Chart("chartContainer1", {
			animationEnabled: true,
			exportEnabled: true,
			title: {
				text: "Total Quantity Per Item"
			},
			axisY:{
				includeZero: true
			},
			data: [{
				type: "pie", //change type to bar, line, area, pie, etc
				//indexLabel: "{y}", //Shows y value on all Data Points
				indexLabelFontColor: "#5A5757",
				indexLabelPlacement: "outside",
				dataPoints: <%out.print(dataPoints1);%>
			}]
		});
		chart1.render();
		
	}
	
	
	function fun2() {
		 
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			exportEnabled: true,
			title: {
				text: "Total Expenditure Per Items"
			},
			axisY:{
				includeZero: true
			},
			data: [{
				type: "bar", //change type to bar, line, area, pie, etc
				indexLabel: "{y}", //Shows y value on all Data Points
				indexLabelFontColor: "#5A5757",
				indexLabelPlacement: "outside",
				dataPoints: <%out.print(dataPoints);%>
			}]
		});
		chart.render();
		 
		
	}
	
	


</script>
		
</div>
		
		
       							
       	</div>
   </div>
	

	

				
				
	<br>

	<!-- Footer -->
	<div  style="width:100%;"class="p-4 container-fluid theme-bg-color d-flex justify-content-center align-items-center">
		<div class="footer-title text-center">
			<div class="footer-title text-center">Copyright@2022 C Construction -
			All Rights Reserved</div>
		</div>
	</div>
</body>
</html>