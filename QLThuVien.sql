CREATE DATABASE QuanLyThuVien
GO
USE QuanLyThuVien
GO

--Tạo Bảng 

--Bảng BangCap
CREATE TABLE BangCap
(
	MaBangCap INT IDENTITY(1,1) PRIMARY KEY,
	TenBangCap NVARCHAR(100) NOT NULL
)
GO
--Bảng DocGia 
CREATE TABLE DocGia
(
	MaDocGia INT IDENTITY(1,1) PRIMARY KEY,
	HoTenDocGia NVARCHAR(100) NOT NULL,
	NgaySinh DATETIME,
	DiaChi NVARCHAR(200),
	Email NVARCHAR(100),
	NgayLapThe DATETIME NOT NULL,
	NgayHetHan DATETIME NOT NULL,
	TienNo FLOAT
)
GO
--Bảng Sach 
CREATE TABLE Sach
(
	MaSach INT IDENTITY(1,1) PRIMARY KEY,
	TenSach NVARCHAR(100) NOT NULL,
	TacGia NVARCHAR(100) NOT NULL,
	NamXuatBan INT,
	NhaXuatBan NVARCHAR(100),
	TriGia FLOAT,
	NgayNhap DATETIME
)
GO
--Bảng NhanVien
CREATE TABLE NhanVien
(
	MaNhanVien INT IDENTITY(1,1) PRIMARY KEY,
	HoTenNhanVien NVARCHAR(100) NOT NULL,
	NgaySinh DATETIME,
	DiaChi NVARCHAR(200),
	DienThoai INT,
	MaBangCap INT,
	FOREIGN KEY (MaBangCap) REFERENCES BangCap(MaBangCap)
)
GO
--Bảng PhieuThuTien 
CREATE TABLE PhieuThuTien
(
	MaPhieuThuTien INT IDENTITY(1,1) PRIMARY KEY,
	SoTienNo FLOAT NOT NULL,
	SoTienThu FLOAT NOT NULL,
	MaDocGia INT,
	MaNhanVien INT,
	FOREIGN KEY (MaDocGia) REFERENCES DocGia(MaDocGia),
	FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
)
GO

--Bảng PhieuMuonSach 
CREATE TABLE PhieuMuonSach
(
	MaPhieuMuon INT IDENTITY(1,1) PRIMARY KEY,
	NgayMuon DATETIME NOT NULL,
	NgayTra DATETIME,
	MaDocGia INT,
	FOREIGN KEY (MaDocGia) REFERENCES DocGia(MaDocGia)
)
GO
--Bảng ChiTietPhieuMuon 
CREATE TABLE ChiTietPhieuMuon
(
	MaSach INT,
	MaPhieuMuon INT,
	PRIMARY KEY (MaSach, MaPhieuMuon),
	FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
	FOREIGN KEY (MaPhieuMuon) REFERENCES PhieuMuonSach(MaPhieuMuon)
)
GO

--Thêm dữ liệu vào các Bảng 

INSERT INTO BangCap 
VALUES 
(N'Tiến sĩ'),
(N'Thạc sĩ'),
(N'Đại học')
GO

INSERT INTO NhanVien 
VALUES 
(N'Steven King','06/17/1987',N'AD_PRES',24000,1),
(N'Neena Kochhar','09/21/1989',N'AD_VP',17000,2),
(N'Lex De Haan','01/13/1993',N'AD_VP',17000,2),
(N'Alexander Hunold','01/03/1990',N'IT_PROG',9000,3),
(N'Bruce Ernst','05/21/1991',N'IT_PROG',6000,3)
GO

INSERT INTO DocGia 
VALUES 
(N'Ellen Abel','05/11/1996',N'SA_REP',N'abel@gmail.com','05/11/2016','05/11/2017',24000),
(N'Jonathon Taylor','03/24/1998',N'SA_REP',N'taylor@gmail.com','03/24/2018','06/24/2018',6000),
(N'Kimberly Grant','05/24/1998',N'SA_REP',N'grant@gmail.com','05/24/2018','09/24/2018',9000),
(N'Jennifer Whalen','09/17/1987',N'AD_ASST',N'whalen@gmail.com','09/17/2017','12/17/2017',17000),
(N'Michael Hartstein','02/17/1996',N'MK_MAN',N'hartstein@gmail.com','02/17/2016','05/17/2016',17000),
(N'Pat Fay','08/17/1997',N'MK_REP',N'faypat@gmail.com','08/17/2017','11/17/2017',22000),
(N'Shelley Higgins','06/17/1994',N'AD_MGR',N'higgins@gmail.com','06/17/2014','06/17/2015',19000),
(N'William Gietz','06/17/1994',N'AD_ACCOUNT',N'gietz@gmail.com','06/17/2017','03/17/2018',18000)
GO

INSERT INTO PhieuThuTien 
VALUES 
(5000,2000,1,3),
(7000,3000,2,1),
(6000,2500,3,2),
(8000,4000,4,5),
(4000,1000,5,4),
(3000,500,6,2)
GO

INSERT INTO PhieuMuonSach 
VALUES 
('05/10/2016','06/10/2016',1),
('04/24/2018','05/10/2018',2),
('06/24/2018','07/15/2018',3),
('10/17/2017','12/22/2017',4),
('03/17/2016',NULL,5),
('09/17/2017','05/10/2018',6)
GO

INSERT INTO Sach 
VALUES 
(N'Đất rừng phương nam',N'Đoàn Giỏi',1957,N'NXB9',5000,NULL),
(N'Cha con nghĩa nặng',N'Đoàn Khá',1958,N'NXB8',6000,NULL),
(N'Cai đắng mùi đời',N'Đoàn Trung',1959,N'NXB7',6600,NULL),
(N'Ai làm được',N'Tàu Giỏi',1955,N'NXB6',5500,NULL),
(N'Chúa tàu Kim quy',N'Tàu Khá',1953,N'NXB5',4000,NULL),
(N'Hạnh phúc lối nào',N'Thuyền Khá',1960,N'NXB4',8000,NULL)
GO

INSERT INTO ChiTietPhieuMuon 
VALUES 
(1,6),
(2,5),
(3,4),
(4,3),
(5,2),
(6,1)
GO
