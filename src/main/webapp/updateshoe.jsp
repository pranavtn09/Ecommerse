<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SportyShoes Store</title>
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
  background-color: #9933cc;
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

/* form style */
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>

<div class="header">
  <h1>Sporty Shoe Store By Yashaswi Goswami</h1>
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
  </div>

  <div class="col-9">
    <h1>Sporty Shoe Store Update Form</h1>
    <p></p>
    <p></p>
    <div class="container">
  <form action="/update_shoe/${id}" method="post">
  <label>ID</label>
  <input type="text" value="${id}" name="id"  disabled>
  
  
  <label for="fname">Shoe Name</label>
    <input type="text" id="shoename" name="shoename" value="${shoetoupdate.shoename }">
  
  	<label for="brand">Brand</label>
   	 <select id="brand" name="brand" >
      <option value="Action">Action</option>
      <option value="Puma">Puma</option>
      <option value="Canvas">Canvas</option>
          <option value="Mufti">Mufti</option>
      <option value="Woodland">Woodland</option>
      <option value="Reebok">Reebok</option>
    </select>
    
	
    <label for="size">Size</label>
    <input type="number" id="size" name="size" value="${shoetoupdate.size }">

    

   
    <input type="submit" value="Update">
  </form>
     </div>
</div>

</body>
</html>
