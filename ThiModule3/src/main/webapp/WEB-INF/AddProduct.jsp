<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm sản phẩm mới</title>
</head>
<body>
<h2>Add new product</h2>

<%-- Hiển thị lỗi --%>
<%
    List<String> errors = (List<String>) request.getAttribute("errors");
    if (errors != null) {
        for (String error : errors) {
%>
<p style="color: red;"><%= error %></p>
<%
        }
    }

    // Lấy dữ liệu từ request để giữ lại giá trị nếu có lỗi
    String name = request.getParameter("name") != null ? request.getParameter("name") : "";
    String price = request.getParameter("price") != null ? request.getParameter("price") : "";
    String quantity = request.getParameter("quantity") != null ? request.getParameter("quantity") : "";
    String color = request.getParameter("color") != null ? request.getParameter("color") : "Đỏ";
    String description = request.getParameter("description") != null ? request.getParameter("description") : "";
    String category = request.getParameter("category") != null ? request.getParameter("category") : "Phone";
%>

<form action="add-product" method="post">
    <label>Name</label>
    <input type="text" name="name" required value="<%= name %>">

    <label>Price</label>
    <input type="number" name="price" required min="10000001" value="<%= price %>">

    <label>Quantity</label>
    <input type="number" name="quantity" required min="1" value="<%= quantity %>">

    <label>Color</label>
    <select name="color">
        <option value="Đỏ" <%= color.equals("Đỏ") ? "selected" : "" %>>Đỏ</option>
        <option value="Xanh" <%= color.equals("Xanh") ? "selected" : "" %>>Xanh</option>
        <option value="Đen" <%= color.equals("Đen") ? "selected" : "" %>>Đen</option>
        <option value="Trắng" <%= color.equals("Trắng") ? "selected" : "" %>>Trắng</option>
        <option value="Vàng" <%= color.equals("Vàng") ? "selected" : "" %>>Vàng</option>
    </select>

    <label>Description</label>
    <textarea name="description"><%= description %></textarea>

    <label>Category</label>
    <select name="category">
        <option value="Computer" <%= category.equals("Computer") ? "selected" : "" %>>Computer</option>
        <option value="Phone" <%= category.equals("Phone") ? "selected" : "" %>>Phone</option>
        <option value="Accessories" <%= category.equals("Accessories") ? "selected" : "" %>>Accessories</option>
    </select>

    <button type="submit">Create</button>
    <a href="managementProduct.jsp">Back</a>
</form>
</body>
</html>
