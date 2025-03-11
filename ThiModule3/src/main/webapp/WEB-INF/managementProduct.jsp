<%--
  Created by IntelliJ IDEA.
  User: DacHaiPham
  Date: 3/11/2025
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, Model.Product" %>
<html>
<head>
    <title>Management Product</title>
</head>
<body>
<h2>Management Product</h2>
<form action="products" method="GET">
    <button type="submit" name="action" value="add">Add New Product</button>
</form>

<table border="1">
    <thead>
    <tr>
        <th>STT</th>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Color</th>
        <th>Category</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Product> productList = (List<Product>) request.getAttribute("products");
        if (productList != null) {
            int index = 1;
            for (Product product : productList) {
    %>
    <tr>
        <td><%= index++ %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getPrice() %></td>
        <td><%= product.getQuantity() %></td>
        <td><%= product.getColor() %></td>
        <td><%= product.getCategory() %></td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
</body>
</html>