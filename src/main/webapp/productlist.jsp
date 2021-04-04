<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SportyShoes Productlist</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
* {
  box-sizing: border-box;
}

.row::after {
  content: "";
  clear: both;
  display: table;
}

[class*="col-"] {
  float: left;
  padding: 15px;
}

.col-1 {width: 8.33%;}
.col-2 {width: 16.66%;}
.col-3 {width: 25%;}
.col-4 {width: 33.33%;}
.col-5 {width: 41.66%;}
.col-6 {width: 50%;}
.col-7 {width: 58.33%;}
.col-8 {width: 66.66%;}
.col-9 {width: 75%;}
.col-10 {width: 83.33%;}
.col-11 {width: 91.66%;}
.col-12 {width: 100%;}

html {
  font-family: "Lucida Sans", sans-serif;
}

.header {
  background-color: #00aacc;
  color: #ffffff;
  padding: 15px;
}

.menu ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

.menu li {
  padding: 8px;
  margin-bottom: 7px;
  background-color: #33b5e5;
  color: #ffffff;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
}

.menu li:hover {
  background-color: #0099cc;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}
</style>
</head>
<body>

<div class="header">
  <h1>Sporty Shoe Store By Tejaswee Shelar</h1>
   <div style="margin-left: 800px;"><form action="/logout" method="post">
  <input type="submit" value="Logout" style="background-color:white ; ;height:50px; width:100px;">
  </form></div>
</div>

<div class="row">
  <div class="col-3 menu">
    <ul>
      <li><a href="/productlist">Show All Products</a></li>
      

      
      <li><b>View product by Brand</b></li>
      
      <c:import url="/brandslist"></c:import>
      <li>Registered Users list</li>
      <c:import url="/userlist"></c:import>
    </ul>
    
    <% 
    Cookie[] ck= request.getCookies();
    
    
    %>
    
    ${ck.username}
  </div>

  <div class="col-9">
    <h1>Sporty Shoe List<a href="exporttoPDF" style="margin-left: 150px;">Export to PDF</a></h1>
    <p>
    
    </p>
	<p>
	
	<table>
  <tr>
  <th>Shoe Name</th>
  <th>Brand</th>
  <th>Size</th>
  </tr>
<c:forEach items="${shoelist }" var="shoe">
  <tr>
<td>${shoe.shoename}</td>  

<td>${shoe.brand}</td>  
<td>${shoe.size}</td>  
<td>${shoe.shoename}</td>  
  <td><a class="button" href="updateshoe/${shoe.id}">Update </a></td>
            <td><a class="button" href="deleteitem/${shoe.id}">Remove </a></td>


  </tr>
	</c:forEach>
	</table>
	</p>   
     </div>
</div>

</body>
</html>
