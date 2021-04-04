<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Shoestore- brands</title>
</head>
<body>

<c:forEach items="${shoe}" var="shoes">
<tr>

  <label for="${shoes}"> <a class="" href="/productlist/${shoes}">${shoes}</a></label><br>
  </tr>
</c:forEach>
</body>
</html>