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
</style>
</head>
<body>

<div class="header">
  <h1>Sporty Shoe Store By Tejaswee Shelar</h1>
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
    <h1>Sporty Shoe Store</h1>
    <p>Run, Gym, Hike... It does no€™t matter whether you a€™re an elite runner, weekend fell walker or gym enthusiast, that commitment and passion to be active is what drives us both.

    </p>
    <p>
With over 13,000 products, including running shoes, running clothing and outdoor gear, you a€™ll struggle to find a better selection. We are very proud to bring you the very latest products and technologies from the top sports and fitness brands, including adidas, Asics, Inov8 and many more.
    </p>
    <p>At Sportsshoes.com we are always trying to get better, pushing ourselves to keep you up to speed. Why? Because it i€™s no fun standing still.</p>
     </div>
</div>

</body>
</html>
