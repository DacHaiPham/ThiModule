<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Product</title>
</head>
<body>
<h2>Add New Product</h2>
<form action="products" method="POST">
    <input type="text" name="name" placeholder="Enter Product Name" required><br>
    <input type="number" step="0.01" name="price" placeholder="Enter Price" required><br>
    <input type="number" name="quantity" placeholder="Enter Quantity" required><br>
    <input type="text" name="color" placeholder="Enter Color"><br>
    <input type="text" name="description" placeholder="Enter Description"><br>
    <input type="text" name="category" placeholder="Enter Category"><br>
    <button type="submit">Add Product</button>
</form>
<br>
<a href="products">Back to Product List</a>
</body>
</html>
