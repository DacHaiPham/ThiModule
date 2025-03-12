<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.text.DecimalFormat, Model.Product" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Management Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 15px;
        }
        button:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .edit-btn, .delete-btn {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .edit-btn {
            background-color: #ffc107;
            color: white;
        }
        .edit-btn:hover {
            background-color: #e0a800;
        }
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Management Product</h2>
    <% String successMessage = (String) request.getAttribute("successMessage"); %>
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>

    <% if (successMessage != null) { %>
    <div style="color: green; font-weight: bold;"><%= successMessage %></div>
    <% } %>

    <% if (errorMessage != null) { %>
    <div style="color: red; font-weight: bold;"><%= errorMessage %></div>
    <% } %>

    <form action="products" method="GET">
        <button type="submit" name="action" value="add">Add New Product</button>
    </form>

    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Color</th>
            <th>Category</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% List<Product> productList = (List<Product>) request.getAttribute("products");
            DecimalFormat df = new DecimalFormat("#,### VND");
            if (productList != null) {
                int index = 1;
                for (Product product : productList) { %>
        <tr>
            <td><%= index++ %></td>
            <td><%= product.getName() %></td>
            <td><%= df.format(product.getPrice()) %></td>
            <td><%= product.getQuantity() %></td>
            <td><%= product.getColor() %></td>
            <td><%= product.getCategory() %></td>
            <td><%= product.getDescription() %></td>
            <td>
                <a href="products?action=edit&id=<%= product.getId() %>">
                    <button class="edit-btn">Edit</button>
                </a>
                <a href="products?action=delete&id=<%= product.getId() %>"
                   onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">
                    <button style="background-color: red; color: white; border: none; padding: 5px;">Delete</button>
                </a>
            </td>
        </tr>
        <%    }
        } %>
        </tbody>
    </table>
</div>
</body>
</html>
