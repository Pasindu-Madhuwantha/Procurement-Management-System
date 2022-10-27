<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.db.crud"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id =Integer.parseInt(request.getParameter("Id"));
String ProductName=request.getParameter("ProductName");
String ProductDescription=request.getParameter("ProductDescription");
String SupplierName=request.getParameter("SupplierName");
int SupplierMobile =Integer.parseInt(request.getParameter("SupplierMobile"));
int Quantity=Integer.parseInt(request.getParameter("Quantity"));
double UnitPrice  =Double.parseDouble(request.getParameter("UnitPrice"));
double SubAmount= Quantity*UnitPrice;

int status =crud.UpdateRecords(id,ProductName,ProductDescription,SupplierName,SupplierMobile,Quantity,UnitPrice,SubAmount);
if(status > 0)
{
	
	response.sendRedirect("Success.jsp");


}
else if(status == -1)
{
	out.print("error from databse");
	
}
else
{
	out.print("excepion occured");
}



%>

</body>
</html>