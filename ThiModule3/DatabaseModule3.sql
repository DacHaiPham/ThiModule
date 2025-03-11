CREATE DATABASE productdb;
USE productdb;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL CHECK (price > 10000000),
    quantity INT NOT NULL CHECK (quantity > 0),
    color ENUM('Đỏ', 'Xanh', 'Đen', 'Trắng', 'Vàng') NOT NULL,
    description TEXT,
    category VARCHAR(255) NOT NULL
);

-- Chèn dữ liệu với giá trị price lớn hơn 10 triệu và màu sắc hợp lệ
INSERT INTO products (name, price, quantity, color, category) VALUES
('iPhone 11', 15000000.0, 12, 'Đen', 'Phone'),
('iPhone 11 Pro', 25000000.0, 12, 'Vàng', 'Phone'),
('iPhone X', 18000000.0, 12, 'Trắng', 'Phone'),
('Smart Tivi 55 inch', 22000000.0, 12, 'Đen', 'Tivi'),
('Tủ lạnh 2 cánh Toshiba', 16000000.0, 12, 'Trắng', 'Tủ lạnh'),
('Máy giặt cửa ngang Samsung', 14000000.0, 12, 'Xanh', 'Máy giặt');

drop database productdb;