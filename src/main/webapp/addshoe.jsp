<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SportyShoe- Add New Shoe</title>
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

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}






 	 .button {
    display: block;
    width: 80px;
    height: 25px;
    background: #4E9CAF;
    padding: 10px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
    line-height: 25px;
}

input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.form{s
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
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
    
   
  </div>


  <div class="col-9">
  <div>
      <div class="form" >
      <form action="/saveitem">
      
      <label for="brand">Choose a Brand:</label>

			<select name="brand" id="brand">
			  <option value="Action">Action</option>
			  <option value="Mufti">Mufti</option>
			  <option value="Woodland">Woodland</option>
			  <option value="Puma">Puma</option>
			</select>
   
      <br>
            <br>
            <label>Name of Shoe:</label><input type="text" name="shoename" width="200px;"><br>
            
             <label for="size">Choose Shoe Size:</label>

			<select name="size" id="size">
			  <option value="6">6</option>
			  <option value="7">7</option>
			  <option value="8">8</option>
			  <option value="9">9</option>
			  <option value="10">10</option>
			  <option value="11">11</option>
			  <option value="12">12</option>
			</select><br>
			
      <input type="submit" value="Save Product">
      </form></div>
      </div>
      </div>
</div>
</body>
</html>
