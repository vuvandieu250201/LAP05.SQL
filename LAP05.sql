CREATE DATABASE LAP05
GO
CREATE TABLE PhongBan(
MaPB varchar(7) primary key,
TenPB nvarchar (50),
)
go
CREATE TABLE NhanVien(
MaNV varchar(7) primary key NOT NULL,
TenNV nvarchar (50) NULL,
NgaySinh Datetime,
check( NgaySinh < getdate()),
SoCMND char(9) check(SoCMND Like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
GioiTinh char (1),
constraint Ck_GioiTinh check (GioiTinh ='M' or GioiTinh = 'F'),
DiaChi nvarchar (100),
NgayVaoLam datetime,
constraint Ck_NgayVaoLam check (datediff(yy,NgaySinh,NgayVaoLam)>20),
MaPB varchar(7),
constraint fk_MaPB foreign key (MaPB) references PhongBan(MaPB)
)
SELECT * FROM NhanVien
go
CREATE TABLE LuongDA(
MaDA varchar(8) NOT NULL,
MaNV varchar(7) NOT NULL,
SoTien Money CHECK (SoTien > 0),
NgayNhan DATETIME DEFAULT GETDATE(),
CONSTRAINT fk_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
CONSTRAINT PK PRIMARY KEY (MaDA,MaNV)
)
DROP TABLE LuongDA
GO
INSERT INTO PhongBan(MaPB,TenPB) VALUES('HN1','PHONG A');
INSERT INTO PhongBan(MaPB,TenPB) VALUES('HN2','PHONG B');
INSERT INTO PhongBan(MaPB,TenPB) VALUES('HN3','PHONG C');
INSERT INTO PhongBan(MaPB,TenPB) VALUES('HN4','PHONG D');
INSERT INTO PhongBan(MaPB,TenPB) VALUES('HN5','PHONG E');
SELECT *FROM PhongBan
Go
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB) VALUES('CK1','Trang','10/20/1980','123456789','F','HaNoi','12/12/2012','HN1');
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB) VALUES('CK2','Long','10/20/1981','123456789','M','HaiPhong','12/12/2012','HN2');
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB) VALUES('CK3','Thuy','10/20/1982','123456789','M','HaiDuong','12/12/2012','HN3');
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB) VALUES('CK4','Dieu','10/20/1983','123456789','F','HaNoi','12/12/2012','HN4');
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB) VALUES('CK5','Hue','10/20/1984','123456789','M','HaiPhong','12/12/2012','HN5');
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB) VALUES('CK6','Thoai','10/20/1985','123456789','M','HaiPhong','12/12/2012','HN1');
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB) VALUES('CK7','Khanh','10/20/1986','123456789','F','HaiDuong','12/12/2012','HN1');
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB) VALUES('CK8','Thang','10/20/1987','123456789','M','HaiPhong','12/12/2012','HN2');
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB) VALUES('CK9','Phong','10/20/1988','123456789','F','HaNoi','12/12/2012','HN1');
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB) VALUES('CK10','Minh','10/20/1989','123456789','M','HaNoi','12/12/2012','HN3');
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPB) VALUES('CK11','Hung','10/20/1979','123456789','F','HaNoi','12/12/2012','HN4');
SELECT *FROM NhanVien
GO
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA1','CK1','3000000');
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA1','CK2','4000000');
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA1','CK3','3000000');
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA1','CK4','5000000');
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA1','CK5','6000000');
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA1','CK6','3000000');
GO
--query hiển thị tất cả các bảng
SELECT *FROM PhongBan
SELECT *FROM NhanVieN

--QUERY HIỂN THỊ NHƯNG NHÂN VIÊN GIỚI TÍNH F
SELECT *FROM NhanVien
WHERE GioiTinh LIKE 'F'
GO
SELECT SUM (SoTien) [TongLuong]
FROM LuongDA
GROUP BY SoTien;
GO
SELECT (TenNv)[HanhChinh]
FROM NhanVien
GROUP BY TenNV;



