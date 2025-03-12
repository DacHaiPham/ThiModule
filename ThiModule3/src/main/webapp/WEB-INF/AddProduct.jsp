<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm mới</title>
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
            text-align: left;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #218838;
        }
        .back-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        .error {
            color: red;
            font-size: 14px;
            display: none;
        }
    </style>
    <script>
        function validateForm() {
            let isValid = true;

            // Lấy giá trị từ form
            let name = document.getElementById("name").value.trim();
            let price = document.getElementById("price").value.trim();
            let quantity = document.getElementById("quantity").value.trim();
            let color = document.getElementById("color").value;
            let category = document.getElementById("category").value;

            // Reset thông báo lỗi
            document.querySelectorAll(".error").forEach(e => e.style.display = "none");

            // Kiểm tra tên sản phẩm
            if (name === "") {
                document.getElementById("nameError").style.display = "block";
                isValid = false;
            }

            // Kiểm tra giá sản phẩm
            if (price === "" || isNaN(price) || parseFloat(price) <= 10000000) {
                document.getElementById("priceError").style.display = "block";
                isValid = false;
            }

            // Kiểm tra số lượng
            if (quantity === "" || isNaN(quantity) || parseInt(quantity) <= 0 || !Number.isInteger(Number(quantity))) {
                document.getElementById("quantityError").style.display = "block";
                isValid = false;
            }

            // Kiểm tra màu sắc
            if (color === "") {
                document.getElementById("colorError").style.display = "block";
                isValid = false;
            }

            // Kiểm tra danh mục
            if (category === "") {
                document.getElementById("categoryError").style.display = "block";
                isValid = false;
            }

            return isValid;
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Thêm sản phẩm mới</h2>
    <form action="products" method="POST" onsubmit="return validateForm()">
        <label for="name">Tên sản phẩm:</label>
        <input type="text" id="name" name="name">
        <span class="error" id="nameError">Tên sản phẩm không được để trống!</span>

        <label for="price">Giá (VNĐ):</label>
        <input type="text" id="price" name="price">
        <span class="error" id="priceError">Giá phải lớn hơn 10,000,000 VNĐ!</span>

        <label for="quantity">Số lượng:</label>
        <input type="text" id="quantity" name="quantity">
        <span class="error" id="quantityError">Số lượng phải là số nguyên dương!</span>

        <label for="color">Màu sắc:</label>
        <select id="color" name="color">
            <option value="">-- Chọn màu --</option>
            <option value="Đỏ">Đỏ</option>
            <option value="Xanh">Xanh</option>
            <option value="Đen">Đen</option>
            <option value="Trắng">Trắng</option>
            <option value="Vàng">Vàng</option>
        </select>
        <span class="error" id="colorError">Vui lòng chọn màu sắc!</span>

        <label for="category">Danh mục:</label>
        <select id="category" name="category">
            <option value="">-- Chọn danh mục --</option>
            <option value="Điện thoại">Điện thoại</option>
            <option value="Laptop">Laptop</option>
            <option value="Tablet">Tablet</option>
            <option value="Phụ kiện">Phụ kiện</option>
        </select>
        <span class="error" id="categoryError">Vui lòng chọn danh mục!</span>

        <label for="description">Mô tả sản phẩm:</label>
        <input type="text" id="description" name="description">

        <button type="submit">Thêm sản phẩm</button>
    </form>
    <form action="products" method="get" style="text-align: center; margin-top: 15px;">
        <button type="submit" style="
        background-color: #dc3545;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    ">Quay lại danh sách sản phẩm</button>
    </form>
</div>
</body>
</html>
