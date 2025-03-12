<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }
        .container {
            width: 40%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        input[type="text"] {
            width: 90%;
            padding: 8px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        .back-link {
            display: block;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Add New Product</h2>
    <form action="products" method="POST">
        <input type="text" name="name" placeholder="Enter Product Name" required><br>
        <input type="text" name="price" placeholder="Enter Price" required><br>
        <input type="text" name="quantity" placeholder="Enter Quantity" required><br>
        <input type="text" name="color" placeholder="Enter Color"><br>
        <input type="text" name="description" placeholder="Enter Description"><br>
        <input type="text" name="category" placeholder="Enter Category"><br>
        <button type="submit">Add Product</button>
    </form>
    <a href="products" class="back-link">Back to Product List</a>
</div>
</body>
</html>
