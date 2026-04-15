CREATE DATABASE QL_VanPhongPham;
GO
USE QL_VanPhongPham;
GO
-- 1. Tạo bảng Nhà cung cấp (Suppliers)
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(255) NOT NULL,
    ContactName NVARCHAR(100),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    Phone NVARCHAR(20)
);

-- 2. Tạo bảng Khách hàng (Customers)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(255) NOT NULL,
    ContactName NVARCHAR(100),
    Email NVARCHAR(100),
    Address NVARCHAR(255),
    City NVARCHAR(100)
);

-- 3. Tạo bảng Sản phẩm (Products)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(255) NOT NULL,
    Unit NVARCHAR(50),
    Price DECIMAL(18, 2)
);

-- 4. Tạo bảng Trung gian NCC_Sản phẩm (Supplier_Product)
-- Thể hiện mối quan hệ: Một nhà cung cấp có thể cung cấp nhiều sản phẩm và ngược lại
CREATE TABLE Supplier_Product (
    SupplierID INT,
    ProductID INT,
    PRIMARY KEY (SupplierID, ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 5. Tạo bảng Đơn hàng (Orders)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(18, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 6. Tạo bảng Chi tiết đơn hàng (OrderDetails)
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PriceAtPurchase DECIMAL(18, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Bổ sung cột Nơi sản xuất và Số lượng tồn cho bảng Products
ALTER TABLE Products 
ADD NoiSanXuat NVARCHAR(100), 
    SoLuongTon INT DEFAULT 0;
GO



-- INSERT DATA: SUPPLIERS (20 dòng)

INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Address, City, Phone) VALUES
(1, N'Tập đoàn Thiên Long', N'Nguyễn Trí', N'Lô 6, KCN Tân Tạo', N'TP.HCM', '0281234567'),
(2, N'Công ty Cổ phần Hồng Hà', N'Trần Tuấn', N'25 Lý Thường Kiệt', N'Hà Nội', '0249876543'),
(3, N'Bút bi Bến Nghé', N'Lê Minh', N'123 Tên Lửa', N'TP.HCM', '0283333444'),
(4, N'Deli Việt Nam', N'Phạm Trang', N'KCN Yên Phong', N'Bắc Ninh', '0222555666'),
(5, N'Văn phòng phẩm Kokuyo', N'Hoàng Yến', N'KCN Thăng Long', N'Hà Nội', '0241112222'),
(6, N'Giấy Bãi Bằng', N'Vũ Hùng', N'Thị trấn Phong Châu', N'Phú Thọ', '0210777888'),
(7, N'Công ty FlexOffice', N'Đỗ Đạt', N'45 Nam Kỳ Khởi Nghĩa', N'TP.HCM', '0901112233'),
(8, N'Double A Thái Lan', N'Mai Anh', N'Tòa nhà Bitexco', N'TP.HCM', '0912223344'),
(9, N'Giấy Paper One', N'Đinh Tùng', N'Tòa nhà Lotte', N'Hà Nội', '0983334455'),
(10, N'Plus Việt Nam', N'Ngô Quý', N'KCN Biên Hòa 2', N'Đồng Nai', '0934445566'),
(11, N'Pentel Nhật Bản', N'Bùi Vy', N'Quận 1', N'TP.HCM', '0945556677'),
(12, N'Văn phòng phẩm Trà My', N'Lý Lan', N'Quận Cầu Giấy', N'Hà Nội', '0976667788'),
(13, N'Casio Máy Tính', N'Hồ Quyên', N'Quận 3', N'TP.HCM', '0967778899'),
(14, N'Sổ tay Hải Tiến', N'Trịnh Phúc', N'Quận Long Biên', N'Hà Nội', '0958889900'),
(15, N'Tombow Việt Nam', N'Phan Lộc', N'KCN VSIP', N'Bình Dương', '0929990011'),
(16, N'Mực in Canon', N'Cao Thắng', N'Quận 10', N'TP.HCM', '0900001122'),
(17, N'Tập Vĩnh Tiến', N'Châu Tâm', N'Quận 5', N'TP.HCM', '0911112233'),
(18, N'Bảng viết Tân Hà', N'Kim Oanh', N'Huyện Đan Phượng', N'Hà Nội', '0982223344'),
(19, N'Keo dán Queen', N'Lâm Hùng', N'Quận Tân Phú', N'TP.HCM', '0973334455'),
(20, N'Dụng cụ Deli', N'Vương Sơn', N'Quận Thanh Xuân', N'Hà Nội', '0964445566');

-- ==========================================
-- INSERT DATA: CUSTOMERS (20 dòng)
-- ==========================================
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Email, Address, City) VALUES
(1, N'Trường THPT Lê Quý Đôn', N'Thầy Hùng', 'lequydon@edu.vn', N'110 Nguyễn Thị Minh Khai', N'TP.HCM'),
(2, N'Công ty FPT Software', N'Chị Mai', 'mait@fpt.com', N'Khu CNC Hòa Lạc', N'Hà Nội'),
(3, N'Ngân hàng Vietcombank', N'Anh Tú', 'tu.nguyen@vcb.com.vn', N'198 Trần Quang Khải', N'Hà Nội'),
(4, N'Trường ĐH Bách Khoa', N'Cô Hương', 'huong.bk@hcmut.edu.vn', N'268 Lý Thường Kiệt', N'TP.HCM'),
(5, N'Tập đoàn Vingroup', N'Anh Minh', 'minh.vingroup@vin.com', N'KĐT Vinhomes Riverside', N'Hà Nội'),
(6, N'Công ty Thế Giới Di Động', N'Chị Lan', 'lan.tgdd@mwg.com', N'KCN cao', N'TP.HCM'),
(7, N'Bệnh viện Chợ Rẫy', N'Bác sĩ An', 'an.bvcr@gmail.com', N'201B Nguyễn Chí Thanh', N'TP.HCM'),
(8, N'Công ty Vinamilk', N'Chị Phương', 'phuong.vnm@vinamilk.com', N'10 Tân Trào', N'TP.HCM'),
(9, N'Trường THCS Chu Văn An', N'Thầy Cường', 'cva.hn@edu.vn', N'Thụy Khuê', N'Hà Nội'),
(10, N'Tập đoàn Viettel', N'Anh Sơn', 'son.vt@viettel.com.vn', N'1 Trần Hữu Dực', N'Hà Nội'),
(11, N'Công ty Shopee', N'Chị Quyên', 'quyen.shopee@sea.com', N'Tòa nhà Saigon Centre', N'TP.HCM'),
(12, N'Đại học Quốc Gia Hà Nội', N'Thầy Bình', 'binh.vnu@vnu.edu.vn', N'144 Xuân Thủy', N'Hà Nội'),
(13, N'Khách sạn Rex', N'Chị Thu', 'thu.rex@hotel.com', N'141 Nguyễn Huệ', N'TP.HCM'),
(14, N'Ngân hàng BIDV', N'Anh Đạt', 'dat.bidv@bidv.com.vn', N'Tháp BIDV', N'Hà Nội'),
(15, N'Công ty Grab', N'Chị Hân', 'han.grab@grab.com', N'Mapletree Business Centre', N'TP.HCM'),
(16, N'Trường THPT Hà Nội - Amsterdam', N'Cô Hoa', 'hoa.ams@edu.vn', N'Hoàng Minh Giám', N'Hà Nội'),
(17, N'Công ty Masan', N'Anh Thịnh', 'thinh.masan@masan.com', N'Tòa nhà Mplaza', N'TP.HCM'),
(18, N'Đài truyền hình VTV', N'Chị Trâm', 'tram.vtv@vtv.vn', N'43 Nguyễn Chí Thanh', N'Hà Nội'),
(19, N'Công ty Giao Hàng Tiết Kiệm', N'Anh Tuấn', 'tuan.ghtk@ghtk.vn', N'Phạm Hùng', N'Hà Nội'),
(20, N'Đại học Kinh Tế Quốc Dân', N'Cô Linh', 'linh.neu@neu.edu.vn', N'207 Giải Phóng', N'Hà Nội');

-- ==========================================
-- INSERT DATA: PRODUCTS (20 dòng)
-- ==========================================
INSERT INTO Products (ProductID, ProductName, Unit, Price, NoiSanXuat, SoLuongTon) VALUES
(1, N'Bút bi Thiên Long TL-027', N'Hộp', 60000, N'Việt Nam', 500),
(2, N'Giấy in Double A A4 80gsm', N'Ream', 75000, N'Thái Lan', 1000),
(3, N'Bìa còng Thiên Long 7cm', N'Cái', 45000, N'Việt Nam', 200),
(4, N'Bút dạ quang Deli', N'Hộp', 80000, N'Trung Quốc', 150),
(5, N'Sổ tay ghi chép Hải Tiến', N'Quyển', 25000, N'Việt Nam', 300),
(6, N'Máy tính Casio FX-580VN', N'Cái', 650000, N'Nhật Bản', 50),
(7, N'Bút chì gỗ Hồng Hà', N'Hộp', 40000, N'Việt Nam', 400),
(8, N'Kẹp bướm 25mm Plus', N'Hộp', 15000, N'Nhật Bản', 600),
(9, N'Giấy in Paper One A4 70gsm', N'Ream', 65000, N'Indonesia', 800),
(10, N'Bút xóa kéo Tombow', N'Cái', 35000, N'Nhật Bản', 250),
(11, N'Keo dán khô Deli', N'Chai', 10000, N'Trung Quốc', 500),
(12, N'Băng keo trong 5F', N'Cuộn', 12000, N'Việt Nam', 1000),
(13, N'Kéo cắt giấy văn phòng', N'Cái', 20000, N'Trung Quốc', 150),
(14, N'Ghim dập KW-Trio', N'Cái', 55000, N'Đài Loan', 100),
(15, N'Đạn ghim số 10 Plus', N'Hộp', 5000, N'Nhật Bản', 2000),
(16, N'Bút lông bảng Bến Nghé', N'Hộp', 70000, N'Việt Nam', 300),
(17, N'Cặp lá nhựa Trà My', N'Cái', 8000, N'Việt Nam', 800),
(18, N'Khay nhựa 3 tầng', N'Cái', 120000, N'Việt Nam', 80),
(19, N'Tập 100 trang Vĩnh Tiến', N'Lốc', 90000, N'Việt Nam', 400),
(20, N'Mực in Canon 2900', N'Hộp', 350000, N'Trung Quốc', 100);

-- ==========================================
-- INSERT DATA: SUPPLIER_PRODUCT (20 dòng)
-- ==========================================
INSERT INTO Supplier_Product (SupplierID, ProductID) VALUES
(1, 1), (1, 3), (8, 2), (4, 4), (14, 5), 
(13, 6), (2, 7), (10, 8), (9, 9), (15, 10), 
(4, 11), (7, 12), (4, 13), (20, 14), (10, 15), 
(3, 16), (12, 17), (7, 18), (17, 19), (16, 20);

-- ==========================================
-- INSERT DATA: ORDERS (20 dòng)
-- Chú ý: TotalAmount để 0, lát Trigger 2 sẽ tự tính khi thêm OrderDetails
-- ==========================================
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-03-01', 0), (2, 2, '2024-03-02', 0), (3, 3, '2024-03-05', 0),
(4, 4, '2024-03-05', 0), (5, 5, '2024-03-10', 0), (6, 6, '2024-03-12', 0),
(7, 7, '2024-03-15', 0), (8, 8, '2024-03-16', 0), (9, 9, '2024-03-18', 0),
(10, 10, '2024-03-20', 0), (11, 11, '2024-03-22', 0), (12, 12, '2024-03-25', 0),
(13, 13, '2024-03-26', 0), (14, 14, '2024-04-01', 0), (15, 15, '2024-04-02', 0),
(16, 16, '2024-04-05', 0), (17, 17, '2024-04-08', 0), (18, 18, '2024-04-10', 0),
(19, 19, '2024-04-12', 0), (20, 20, '2024-04-15', 0);

-- ==========================================
-- INSERT DATA: ORDERDETAILS (20 dòng)
-- ==========================================
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, PriceAtPurchase) VALUES
(1, 1, 1, 10, 60000), (2, 1, 2, 5, 75000), 
(3, 2, 3, 20, 45000), (4, 3, 4, 10, 80000), 
(5, 4, 5, 50, 25000), (6, 5, 6, 2, 650000), 
(7, 6, 7, 15, 40000), (8, 7, 8, 30, 15000), 
(9, 8, 9, 20, 65000), (10, 9, 10, 10, 35000), 
(11, 10, 11, 25, 10000), (12, 11, 12, 50, 12000), 
(13, 12, 13, 5, 20000), (14, 13, 14, 3, 55000), 
(15, 14, 15, 100, 5000), (16, 15, 16, 8, 70000), 
(17, 16, 17, 40, 8000), (18, 17, 18, 10, 120000), 
(19, 18, 19, 20, 90000), (20, 19, 20, 4, 350000);
GO


--Query 

-- 1. Tìm kiếm thông tin văn phòng phẩm theo Nơi sản xuất (Ví dụ: Nhật Bản)
SELECT ProductID, ProductName, Unit, Price, NoiSanXuat, SoLuongTon
FROM Products
WHERE NoiSanXuat = N'Nhật Bản';
GO

-- 2. Tìm kiếm thông tin văn phòng phẩm do một Nhà cung cấp cụ thể cung cấp (Ví dụ: Deli Việt Nam)
SELECT P.ProductID, P.ProductName, P.NoiSanXuat, S.SupplierName
FROM Products P
JOIN Supplier_Product SP ON P.ProductID = SP.ProductID
JOIN Suppliers S ON SP.SupplierID = S.SupplierID
WHERE S.SupplierName = N'Deli Việt Nam';
GO

-- 3. Danh sách các khách hàng đã mua mặt hàng 'Giấy in Double A A4 80gsm'
SELECT DISTINCT C.CustomerID, C.CustomerName, C.Email, C.City
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName = N'Giấy in Double A A4 80gsm';
GO

-- 4. Tìm khách hàng mang lại doanh thu lớn nhất (Mua nhiều tiền nhất)
SELECT TOP 1 C.CustomerID, C.CustomerName, SUM(OD.Quantity * OD.PriceAtPurchase) AS TongDoanhThu
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID, C.CustomerName
ORDER BY TongDoanhThu DESC;
GO