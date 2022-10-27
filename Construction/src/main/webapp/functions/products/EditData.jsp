<%@page import="com.db.crud"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.products"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<style>
body {
	background-color: #E7F1F9;
	height: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
	
	
</style>



</head>
<body>


<% 

int i=0;
ArrayList<products> allSuppliers= crud.getAllRecords();

for(products p1:allSuppliers)
	
{
	int x =Integer.parseInt(request.getParameter("sup"));
	
	if(x==p1.getId())
	
{
		

%>




<form action="Editnow.jsp" style="margin-top:1%; margin-left: 20%;" >
	
	
	
	
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label"
				style="left: 3%;">Product ID</label>
			<div class="col-sm-10">
				<input readonly type="number" class="form-control" id="inputEmail3"
					value='<%=p1.getId() %>' style="width: 50%;" name="Id" >
			</div>
		</div>
	
	
	
	<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label"
				style="left: 3%;">Product Name</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputEmail3"
					value='<%=p1.getProductName()%>'  style="width: 50%;" name="ProductName">
			</div>
		</div>
		
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label"
				style="left: 3%;">Product Description</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputEmail3"
					value='<%=p1.getDescription()%>' style="width: 50%;" name="ProductDescription">
			</div>
		</div>
		
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label"
				style="left: 3%;">Supplier Name</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputEmail3"
					value='<%=p1.getSupplier()%>'style="width: 50%;" name="SupplierName">
			</div>
		</div>
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label"
				style="left: 3%;">Supplier Mobile</label>
			<div class="col-sm-10">
				<input type="tel" class="form-control" id="inputEmail3"
					value='0<%=p1.getMobile()%>' style="width: 50%;" pattern="^\d{10}$"
				name="SupplierMobile">
			</div>
		</div>
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label"
				style="left: 3%;">Quantity</label>
			<div class="col-sm-10">
				<input type="number" class="form-control" id="inputEmail3"
					value='<%=p1.getQuantity()%>' style="width: 50%;" name="Quantity">
			</div>
		</div>
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label"
				style="left: 3%;">Unit Price(Rs.)</label>
			<div class="col-sm-10">
				<input type="number" class="form-control" id="inputEmail3"
					value='<%=p1.getPrice()%>' style="width: 50%;" name="UnitPrice" min="0">
			</div>
		</div>
	
		
	<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label"
				style="left: 3%;">Date</label>
			<div class="col-sm-10">
				<input type="date" class="form-control" id="inputEmail3"
					value='<%=p1.getDate()%>' style="width: 50%;" name="date"disabled>
			</div>
		</div>
		<br>
		




		<div class="form-group row" style="margin-left: 30%;margin-top:-3%">
			<div class="col-sm-10">
				<button type="submit" id="close-btn1" class="btn btn-primary" onclick="window.parent.closeModal();">UPDATE</button>
			</div>
		</div>
	</form>
	

	
	<%
	}
}
	%>


	
	
</body>
</html>