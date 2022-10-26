<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order</title>

<!-- Bootstrap Links -->
<link rel="stylesheet" type="text/css" href="../../bootstrap/bootstrap-grid.css"/>
<link rel="stylesheet" type="text/css" href="../../bootstrap/bootstrap.css"/>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="../../bootstrap/custom-css.css"/>


</head>
<body class="d-flex">

<div class="dashboard-ctrl col-2">
    <div class="company-logo">C Construction</div>
    <div class="dashboard-nav-bar">
        <div class="d-flex justify-content-center"><a href="/">Dashboard</a></div>
        <div class="d-flex justify-content-center"><a href="/">Products</a></div>
        <div class="d-flex justify-content-center"><a href="/">Supplier</a></div>
        <div class="d-flex justify-content-center"><a href="/">Orders</a></div>
        <div class="d-flex justify-content-center"><a href="/">Transaction</a></div>
        <div class="d-flex justify-content-center"><a href="/">User</a></div>
    </div>
</div>

<div class="dashboard-body col-10">
    <div class="pending-order-body col-12">
        <div class="title col-12">Pending Orders</div>
        <div class="nav-panel col-12">Navigation Panel</div>
        <div class="table-view col-12">Table View
          <table class="table">
            <thead class="thead-dark">
              <tr>
                <th scope="col">#</th>
                <th scope="col">First</th>
                <th scope="col">Last</th>
                <th scope="col">Handle</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
              </tr>
            </tbody>
          </table>
          
          <table class="table">
            <thead class="thead-light">
              <tr>
                <th scope="col">#</th>
                <th scope="col">First</th>
                <th scope="col">Last</th>
                <th scope="col">Handle</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
              </tr>
            </tbody>
          </table>
        </div>
    </div>
</div>

</body>
</html>