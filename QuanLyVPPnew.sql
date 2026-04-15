CREATE DATABASE QL_VanPhongPham;
GO
USE QL_VanPhongPham;
GO

-- 1. Bảng Nhà cung cấp (Suppliers)
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255),
    Phone NVARCHAR(20)
);

-- 2. Bảng Khách hàng (Customers)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255),
    Phone NVARCHAR(20)
);

-- 3. Bảng Sản phẩm (Products)
-- Bổ sung NoiSanXuat và SoLuongTon để quản lý tồn kho [cite: 15, 31]
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(255) NOT NULL,
    Unit NVARCHAR(50),
    Price DECIMAL(18, 2),
    NoiSanXuat NVARCHAR(100),
    SoLuongTon INT DEFAULT 0
);

-- 4. Bảng Hóa đơn nhập (ImportOrders)
-- Quản lý nghiệp vụ nhập hàng từ NCC 
CREATE TABLE ImportOrders (
    ImportID INT PRIMARY KEY,
    SupplierID INT,
    ImportDate DATE DEFAULT GETDATE(),
    TotalAmount DECIMAL(18, 2) DEFAULT 0,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- 5. Bảng Chi tiết hóa đơn nhập (ImportOrderDetails)
CREATE TABLE ImportOrderDetails (
    ImportDetailID INT PRIMARY KEY,
    ImportID INT,
    ProductID INT,
    Quantity INT,
    ImportPrice DECIMAL(18, 2),
    FOREIGN KEY (ImportID) REFERENCES ImportOrders(ImportID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 6. Bảng Hóa đơn bán (Orders)
-- Quản lý nghiệp vụ bán hàng cho khách [cite: 18, 19]
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE DEFAULT GETDATE(),
    TotalAmount DECIMAL(18, 2) DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 7. Bảng Chi tiết hóa đơn bán (OrderDetails)
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PriceAtPurchase DECIMAL(18, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);





--Thêm Data
USE QL_VanPhongPham;
GO

    
-- 1. INSERT NHÀ CUNG CẤP (20 dòng)

INSERT INTO Suppliers (SupplierID, SupplierName, Address, Phone) VALUES
(1, N'Tập đoàn Thiên Long', N'KCN Tân Tạo, TP.HCM', '0281234567'),
(2, N'Công ty CP Hồng Hà', N'25 Lý Thường Kiệt, Hà Nội', '0249876543'),
(3, N'Bút bi Bến Nghé', N'Quận 9, TP.HCM', '0283333444'),
(4, N'Deli Việt Nam', N'KCN Yên Phong, Bắc Ninh', '0222555666'),
(5, N'Văn phòng phẩm Kokuyo', N'KCN Thăng Long, Hà Nội', '0241112222'),
(6, N'Giấy Bãi Bằng', N'Phú Thọ', '0210777888'),
(7, N'Công ty FlexOffice', N'Quận 1, TP.HCM', '0901112233'),
(8, N'Double A Thái Lan', N'Bangkok, Thái Lan', '0912223344'),
(9, N'Giấy Paper One', N'Indonesia', '0983334455'),
(10, N'Plus Việt Nam', N'KCN Biên Hòa, Đồng Nai', '0934445566'),
(11, N'Pentel Nhật Bản', N'Tokyo, Nhật Bản', '0945556677'),
(12, N'VPP Trà My', N'Cầu Giấy, Hà Nội', '0976667788'),
(13, N'Casio Việt Nam', N'Quận 3, TP.HCM', '0967778899'),
(14, N'Sổ tay Hải Tiến', N'Long Biên, Hà Nội', '0958889900'),
(15, N'Tombow Nhật Bản', N'Nhật Bản', '0929990011'),
(16, N'Mực in Canon', N'TP.HCM', '0900001122'),
(17, N'Tập Vĩnh Tiến', N'Quận 5, TP.HCM', '0911112233'),
(18, N'Bảng viết Tân Hà', N'Đan Phượng, Hà Nội', '0982223344'),
(19, N'Keo dán Queen', N'Tân Phú, TP.HCM', '0973334455'),
(20, N'Dụng cụ Deli', N'Thanh Xuân, Hà Nội', '0964445566');

-- 2. INSERT KHÁCH HÀNG (20 dòng)

INSERT INTO Customers (CustomerID, CustomerName, Address, Phone) VALUES
(1, N'Trường THPT Lê Quý Đôn', N'Quận 3, TP.HCM', '0901000001'),
(2, N'Công ty FPT Software', N'Khu CNC Hòa Lạc, Hà Nội', '0901000002'),
(3, N'Ngân hàng Vietcombank', N'Hoàn Kiếm, Hà Nội', '0901000003'),
(4, N'Trường ĐH Bách Khoa', N'Quận 10, TP.HCM', '0901000004'),
(5, N'Tập đoàn Vingroup', N'Long Biên, Hà Nội', '0901000005'),
(6, N'Công ty Thế Giới Di Động', N'TP. Thủ Đức', '0901000006'),
(7, N'Bệnh viện Chợ Rẫy', N'Quận 5, TP.HCM', '0901000007'),
(8, N'Công ty Vinamilk', N'Quận 7, TP.HCM', '0901000008'),
(9, N'Trường THCS Chu Văn An', N'Tây Hồ, Hà Nội', '0901000009'),
(10, N'Tập đoàn Viettel', N'Nam Từ Liêm, Hà Nội', '0901000010'),
(11, N'Công ty Shopee', N'Quận 1, TP.HCM', '0901000011'),
(12, N'ĐH Quốc Gia Hà Nội', N'Cầu Giấy, Hà Nội', '0901000012'),
(13, N'Khách sạn Rex', N'Quận 1, TP.HCM', '0901000013'),
(14, N'Ngân hàng BIDV', N'Hà Nội', '0901000014'),
(15, N'Công ty Grab', N'Quận 7, TP.HCM', '0901000015'),
(16, N'Trường THPT Amsterdam', N'Cầu Giấy, Hà Nội', '0901000016'),
(17, N'Công ty Masan', N'Quận 1, TP.HCM', '0901000017'),
(18, N'Đài truyền hình VTV', N'Ba Đình, Hà Nội', '0901000018'),
(19, N'Giao Hàng Tiết Kiệm', N'Cầu Giấy, Hà Nội', '0901000019'),
(20, N'ĐH Kinh Tế Quốc Dân', N'Hai Bà Trưng, Hà Nội', '0901000020');


-- 3. INSERT SẢN PHẨM (20 dòng)

INSERT INTO Products (ProductID, ProductName, Unit, Price, NoiSanXuat, SoLuongTon) VALUES
(1, N'Bút bi Thiên Long TL-027', N'Hộp', 60000, N'Việt Nam', 100),
(2, N'Giấy in Double A A4', N'Ream', 75000, N'Thái Lan', 50),
(3, N'Bìa còng Thiên Long 7cm', N'Cái', 45000, N'Việt Nam', 30),
(4, N'Bút dạ quang Deli', N'Hộp', 80000, N'Trung Quốc', 40),
(5, N'Sổ tay Hải Tiến 200tr', N'Quyển', 25000, N'Việt Nam', 60),
(6, N'Máy tính Casio FX-580', N'Cái', 650000, N'Nhật Bản', 10),
(7, N'Bút chì gỗ Hồng Hà', N'Hộp', 40000, N'Việt Nam', 100),
(8, N'Kẹp bướm 25mm Plus', N'Hộp', 15000, N'Việt Nam', 200),
(9, N'Giấy in Paper One A4', N'Ream', 65000, N'Indonesia', 80),
(10, N'Bút xóa kéo Tombow', N'Cái', 35000, N'Nhật Bản', 50),
(11, N'Keo dán khô Deli', N'Chai', 10000, N'Trung Quốc', 150),
(12, N'Băng keo trong 5F', N'Cuộn', 12000, N'Việt Nam', 300),
(13, N'Kéo cắt giấy Deli', N'Cái', 20000, N'Trung Quốc', 70),
(14, N'Ghim dập KW-Trio', N'Cái', 55000, N'Đài Loan', 25),
(15, N'Đạn ghim số 10 Plus', N'Hộp', 5000, N'Việt Nam', 500),
(16, N'Bút lông bảng Bến Nghé', N'Hộp', 70000, N'Việt Nam', 45),
(17, N'Cặp lá nhựa Trà My', N'Cái', 8000, N'Việt Nam', 120),
(18, N'Khay nhựa 3 tầng', N'Cái', 120000, N'Việt Nam', 15),
(19, N'Tập 100tr Vĩnh Tiến', N'Lốc', 90000, N'Việt Nam', 50),
(20, N'Mực in Canon 2900', N'Hộp', 350000, N'Trung Quốc', 12);


-- 4. INSERT HÓA ĐƠN NHẬP (20 dòng)

INSERT INTO ImportOrders (ImportID, SupplierID, ImportDate, TotalAmount) VALUES
(1, 1, '2024-03-01', 0), (2, 2, '2024-03-02', 0), (3, 3, '2024-03-03', 0),
(4, 4, '2024-03-04', 0), (5, 5, '2024-03-05', 0), (6, 6, '2024-03-06', 0),
(7, 7, '2024-03-07', 0), (8, 8, '2024-03-08', 0), (9, 9, '2024-03-09', 0),
(10, 10, '2024-03-10', 0), (11, 11, '2024-03-11', 0), (12, 12, '2024-03-12', 0),
(13, 13, '2024-03-13', 0), (14, 14, '2024-03-14', 0), (15, 15, '2024-03-15', 0),
(16, 16, '2024-03-16', 0), (17, 17, '2024-03-17', 0), (18, 18, '2024-03-18', 0),
(19, 19, '2024-03-19', 0), (20, 20, '2024-03-20', 0);


-- 5. INSERT CHI TIẾT NHẬP (20 dòng)

INSERT INTO ImportOrderDetails (ImportDetailID, ImportID, ProductID, Quantity, ImportPrice) VALUES
(1, 1, 1, 100, 45000), (2, 2, 7, 100, 30000), (3, 3, 16, 50, 55000),
(4, 4, 4, 40, 60000), (5, 5, 10, 50, 25000), (6, 6, 2, 100, 55000),
(7, 7, 12, 300, 8000), (8, 8, 2, 50, 60000), (9, 9, 9, 80, 45000),
(10, 10, 8, 200, 10000), (11, 11, 6, 10, 500000), (12, 12, 17, 120, 5000),
(13, 13, 6, 5, 520000), (14, 14, 5, 60, 15000), (15, 15, 10, 30, 20000),
(16, 16, 20, 15, 250000), (17, 17, 19, 50, 70000), (18, 18, 18, 15, 90000),
(19, 19, 11, 150, 7000), (20, 20, 13, 70, 12000);


-- 6. INSERT HÓA ĐƠN BÁN (20 dòng)

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-04-01', 0), (2, 2, '2024-04-02', 0), (3, 3, '2024-04-03', 0),
(4, 4, '2024-04-04', 0), (5, 5, '2024-04-05', 0), (6, 6, '2024-04-06', 0),
(7, 7, '2024-04-07', 0), (8, 8, '2024-04-08', 0), (9, 9, '2024-04-09', 0),
(10, 10, '2024-04-10', 0), (11, 1, '2024-04-11', 0), (12, 2, '2024-04-12', 0),
(13, 3, '2024-04-13', 0), (14, 4, '2024-04-14', 0), (15, 5, '2024-04-15', 0),
(16, 6, '2024-04-16', 0), (17, 7, '2024-04-17', 0), (18, 8, '2024-04-18', 0),
(19, 9, '2024-04-19', 0), (20, 10, '2024-04-20', 0);


-- 7. INSERT CHI TIẾT BÁN (20 dòng)

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, PriceAtPurchase) VALUES
(1, 1, 1, 10, 60000), (2, 2, 6, 1, 650000), (3, 3, 2, 5, 75000),
(4, 4, 18, 2, 120000), (5, 5, 5, 10, 25000), (6, 6, 20, 2, 350000),
(7, 7, 9, 10, 65000), (8, 8, 12, 50, 12000), (9, 9, 15, 100, 5000),
(10, 10, 1, 5, 60000), (11, 11, 3, 5, 45000), (12, 12, 4, 10, 80000),
(13, 13, 7, 20, 40000), (14, 14, 8, 30, 15000), (15, 15, 10, 5, 35000),
(16, 16, 11, 20, 10000), (17, 17, 13, 5, 20000), (18, 18, 14, 2, 55000),
(19, 19, 16, 5, 70000), (20, 20, 17, 10, 8000);
GO


--Truy vấn
-- 1. Tìm kiếm văn phòng phẩm theo nơi sản xuất (Ví dụ: Nhật Bản)
SELECT ProductName, Unit, Price, NoiSanXuat
FROM Products
WHERE NoiSanXuat = N'Nhật Bản';

-- 2. Tìm nhà cung cấp theo ngày nhập hàng cụ thể
SELECT DISTINCT S.SupplierName, S.Phone, I.ImportDate
FROM Suppliers S
JOIN ImportOrders I ON S.SupplierID = I.SupplierID
WHERE I.ImportDate = '2024-03-05';

-- 3. Liệt kê các mặt hàng được cung cấp bởi một Nhà cung cấp (Ví dụ: Thiên Long)
-- Câu này dùng JOIN giữa 3 bảng: Suppliers -> ImportOrders -> ImportOrderDetails -> Products
SELECT DISTINCT P.ProductName, S.SupplierName
FROM Products P
JOIN ImportOrderDetails ID ON P.ProductID = ID.ProductID
JOIN ImportOrders I ON ID.ImportID = I.ImportID
JOIN Suppliers S ON I.SupplierID = S.SupplierID
WHERE S.SupplierName = N'Tập đoàn Thiên Long';

-- 4. Xem danh sách khách hàng và các món đồ họ đã mua (JOIN cơ bản)
SELECT C.CustomerName, O.OrderDate, P.ProductName, OD.Quantity
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID;
