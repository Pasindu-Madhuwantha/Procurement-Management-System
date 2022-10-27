<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList"%>
    
 <%@page import="com.db.*" %>
 <%@page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 

int i=0;
ArrayList<products> allSuppliers= crud.getAllRecords();

for(products p1:allSuppliers)
	
{
	int x =Integer.parseInt(request.getParameter("del"));
	
	if(x==p1.getId())
	
{
		
		int status = crud.deleteRecord(x);
		
		if(status > 0)
			response.sendRedirect("ProductDashbaord.jsp");
		else
			out.print("Error");
		
		

%>



	
	<%
	}
}
	%>




</body>
</html>