<%@ page import="Model.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DacHaiPham
  Date: 3/11/2025
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Management Product</title>
</head>
<body>
<h2>Management Product</h2>
<form action="managementProduct" method="GET">
    <input type="text" name="name" placeholder="Enter Product Name">
    <input type="text" name="price" placeholder="Enter Price">
    <input type="text" name="category" placeholder="Enter Category">
    <input type="text" name="color" placeholder="Enter Color">
    <button type="submit">Search</button>
</form>

<!-- Nút chuyển hướng đến trang AddProduct.jsp -->
<a href="AddProduct.jsp">
    <button type="button">Add New Product</button>
</a>


<table border="1">
    <thead>
    <tr>
        <th>STT</th>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Color</th>
        <th>Category</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
        <%
                List<Product> productList = (List<Product>) request.getAttribute("products");
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
        <td>
            <a href="editProduct?id=<%= product.getId() %>">Edit</a>
            <a href="deleteProduct?id=<%= product.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
        <%
                }
            %>
</body>
</html>
