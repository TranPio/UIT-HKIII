﻿create database Pio

go

use Pio

--use master
--drop database Pio

--I. Ngôn ngữ định nghĩa dữ liệu (Data Definition Language):
--1. Tạo các quan hệ và khai báo các khóa chính, khóa ngoại của quan hệ.
create table KHACHHANG
( 
	MAKH char(4) constraint PK_MAKH primary key,
	HOTEN varchar(40),
	DCHI varchar(50),
	SODT varchar(20),
	NGSINH smalldatetime,
	DOANHSO money,
	NGDK smalldatetime
)

alter table KHACHHANG
alter column MAKH char(4) not null
--drop table KHACHHANG
create table HOADON
(
	SOHD int not null,
	NGHD smalldatetime,
	MAKH char(4),
	MANV char(4),
	TRIGIA money,
	constraint PK_SOHD primary key(SOHD)
)

create table CTHD
(
	SOHD int not null,
	MASP char(4),
	SL int,
	constraint PK_CTHD primary key (SOHD,MASP)
)
create table NHANVIEN
(
	MANV char(4) not null,
	HOTEN varchar(40),
	SODT varchar(40),
	NGVL smalldatetime,
	constraint PK_MANV primary key (MANV)
)

create table SANPHAM
(
	MASP char(4),
	TENSP varchar(40),
	DVT varchar(20),
	NUOCSX varchar(40),
	GIA money,
	constraint PK_MASP primary key(MASP)
)
alter table HOADON add constraint FK_HOADON_MAKH foreign key (MAKH) references KHACHHANG(MAKH)
alter table HOADON add constraint FK_HOADON_MANV foreign key (MANV) references NHANVIEN(MANV)

--2. Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.

alter table SANPHAM
add GHICHU varchar(20)

--3. Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.

alter table KHACHHANG
add LOAIKH tinyint

--4. Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).

alter table SANPHAM
alter column GHICHU varchar(100)

--5. Xóa thuộc tính GHICHU trong quan hệ SANPHAM.

alter table SANPHAM
drop column GHICHU

--6. Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang 
--lai”, “Thuong xuyen”, “Vip”, …

alter table KHACHHANG
alter column LOAIKH varchar(20) 

insert into KHACHHANG (MAKH, LOAIKH)
values ('KH01','VIP')

--select * from KHACHHANG
--delete from KHACHHANG

--7. Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)

alter table SANPHAM
add constraint CK_DVT check (DVT in('cay','hop','cai','quyen','chuc'))

--insert into SANPHAM(MASP,GIA)
--values ('DVT','kcay')
--insert into SANPHAM(MASP,GIA)
--values ('DVT','cay')
--8. Giá bán của sản phẩm từ 500 đồng trở lên.

alter table SANPHAM
add check (GIA>=500)
--insert into SANPHAM(MASP,GIA)
--values ('GIA','600')
--insert into SANPHAM(MASP,GIA)
--values ('GIA','400')
--9. Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
alter table CTHD
add check (SL>=1)

--insert into CTHD(SOHD,MASP,SL)
--values ('01','SL','0')
--insert into CTHD(SOHD,MASP,SL)
--values ('01','SL','1')
--10. Ngày kAhách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.
alter table KHACHHANG
add constraint CK_NGDK_NGSINH check (NGDK > NGSINH)

set dateformat DMY
--insert into KHACHHANG(MAKH,NGDK,NGSINH)
--values ('PIO' ,'03/10/2023','06/10/2004')
--select * from KHACHHANG 
--delete from KHACHHANG
--insert into KHACHHANG(MAKH,NGDK,NGSINH)
--values ('PIO' ,'03/10/2023','06/10/2023')
--11. Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó 
--đăng ký thành viên (NGDK).
select * from KHACHHANG 
delete from KHACHHANG

select *from NHANVIEN
delete from NHANVIEN

set dateformat DMY
insert into KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) values ('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006','13060000')
insert into KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) values ('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006','280000')
insert into KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) values ('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','05/08/2006','3860000')
insert into KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) values ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','02/10/2006','250000')
insert into KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) values ('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006','21000')
insert into KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) values ('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006','915000')
insert into KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) values ('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','01/12/2006','12500')
insert into KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) values ('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006','365000')
insert into KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) values ('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007','70000')
insert into KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) values ('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007','67500')

insert into NHANVIEN (MANV, HOTEN, SODT, NGVL) values ('NV01','Nguyen Nhu Nhut','0927345678','13/04/2006')
insert into NHANVIEN (MANV, HOTEN, SODT, NGVL) values ('NV02','Le Thi Phi Yen','0987567390','21/04/2006')
insert into NHANVIEN (MANV, HOTEN, SODT, NGVL) values ('NV03','Nguyen Van B','0997047382','27/04/2006')
insert into NHANVIEN (MANV, HOTEN, SODT, NGVL) values ('NV04','Ngo Thanh Tuan','0913758498','24/06/2006')
insert into NHANVIEN (MANV, HOTEN, SODT, NGVL) values ('NV05','Nguyen Thi Truc Thanh','0918590387','20/07/2006')

insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('BC01','But chi','cay','Singapore',3000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('BC02','But chi','cay','Singapore',5000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('BC03','But chi','cay','Viet Nam',3500)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('BC04','But chi','hop','Viet Nam',30000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('BB01','But bi','cay','Viet Nam',5000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('BB02','But bi','cay','Trung Quoc',7000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('BB03','But bi','hop','Thai Lan',100000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('ST04','So tay','quyen','Thai Lan',55000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('ST05','So tay mong','quyen','Thai Lan',20000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('ST08','Bong bang','cai','Viet Nam',1000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('ST09','But long','cay','Viet Nam',5000)
insert into SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA) values ('ST10','But long','cay','Trung Quoc',7000)
--HOADON
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1001','23/07/2006','KH01','NV01',320000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1002','12/08/2006','KH01','NV02',840000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1003','23/08/2006','KH02','NV01',100000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1004','01/09/2006','KH02','NV01',180000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1005','20/10/2006','KH01','NV02',3800000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1006','16/10/2006','KH01','NV03',2430000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1007','28/10/2006','KH03','NV03',510000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1008','28/10/2006','KH01','NV03',440000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1009','28/10/2006','KH03','NV04',200000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1010','01/11/2006','KH01','NV01',5200000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1011','04/11/2006','KH04','NV03',250000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1012','30/11/2006','KH05','NV03',21000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1013','12/12/2006','KH06','NV01',5000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1014','31/12/2006','KH03','NV02',3150000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1015','01/01/2007','KH06','NV01',910000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1016','01/01/2007','KH07','NV02',12500)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1017','02/01/2007','KH08','NV03',35000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1018','13/01/2007','KH08','NV03',330000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1019','13/01/2007','KH01','NV03',30000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1020','14/01/2007','KH09','NV04',70000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1021','16/01/2007','KH10','NV03',67500)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1022','16/01/2007','','NV03',7000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1023','17/01/2007','','NV01',330000)
--select *from HOADON

--CTHD
insert into CTHD (SOHD, MASP, SL) values ('1001','TV02',10)
insert into CTHD (SOHD, MASP, SL) values ('1001','ST01',5)
insert into CTHD (SOHD, MASP, SL) values ('1001','BC01',5)
insert into CTHD (SOHD, MASP, SL) values ('1001','BC02',10)
insert into CTHD (SOHD, MASP, SL) values ('1001','ST08',10)
insert into CTHD (SOHD, MASP, SL) values ('1002','BC04',20)
insert into CTHD (SOHD, MASP, SL) values ('1002','BB01',20)
insert into CTHD (SOHD, MASP, SL) values ('1002','BB02',20)
insert into CTHD (SOHD, MASP, SL) values ('1003','BB03',10)
insert into CTHD (SOHD, MASP, SL) values ('1004','TV01',20)
insert into CTHD (SOHD, MASP, SL) values ('1004','TV02',10)
insert into CTHD (SOHD, MASP, SL) values ('1004','TV03',10)
insert into CTHD (SOHD, MASP, SL) values ('1004','TV04',10)
insert into CTHD (SOHD, MASP, SL) values ('1005','TV05',50)
insert into CTHD (SOHD, MASP, SL) values ('1005','TV06',50)
insert into CTHD (SOHD, MASP, SL) values ('1006','TV07',20)
insert into CTHD (SOHD, MASP, SL) values ('1006','ST01',30)
insert into CTHD (SOHD, MASP, SL) values ('1006','ST02',10)
insert into CTHD (SOHD, MASP, SL) values ('1007','ST03',10)
insert into CTHD (SOHD, MASP, SL) values ('1008','ST04',8)
insert into CTHD (SOHD, MASP, SL) values ('1009','ST05',10)
insert into CTHD (SOHD, MASP, SL) values ('1010','TV07',50)
insert into CTHD (SOHD, MASP, SL) values ('1010','ST07',50)
insert into CTHD (SOHD, MASP, SL) values ('1010','ST08',100)
insert into CTHD (SOHD, MASP, SL) values ('1010','ST04',50)
insert into CTHD (SOHD, MASP, SL) values ('1010','TV03',100)
insert into CTHD (SOHD, MASP, SL) values ('1011','ST06',50)
insert into CTHD (SOHD, MASP, SL) values ('1012','ST07',3)
insert into CTHD (SOHD, MASP, SL) values ('1013','ST08',5)
insert into CTHD (SOHD, MASP, SL) values ('1014','BC02',80)
insert into CTHD (SOHD, MASP, SL) values ('1014','BB02',100)
insert into CTHD (SOHD, MASP, SL) values ('1014','BC04',60)
insert into CTHD (SOHD, MASP, SL) values ('1014','BB01',50)
insert into CTHD (SOHD, MASP, SL) values ('1015','BB02',30)
insert into CTHD (SOHD, MASP, SL) values ('1015','BB03',7)
insert into CTHD (SOHD, MASP, SL) values ('1016','TV01',5)
insert into CTHD (SOHD, MASP, SL) values ('1017','TV02',1)
insert into CTHD (SOHD, MASP, SL) values ('1017','TV03',1)
insert into CTHD (SOHD, MASP, SL) values ('1017','TV04',5)
insert into CTHD (SOHD, MASP, SL) values ('1018','ST04',6)
insert into CTHD (SOHD, MASP, SL) values ('1019','ST05',1)
insert into CTHD (SOHD, MASP, SL) values ('1019','ST06',2)
insert into CTHD (SOHD, MASP, SL) values ('1020','ST07',10)
insert into CTHD (SOHD, MASP, SL) values ('1021','ST08',5)
insert into CTHD (SOHD, MASP, SL) values ('1021','TV01',7)
insert into CTHD (SOHD, MASP, SL) values ('1021','TV02',10)
insert into CTHD (SOHD, MASP, SL) values ('1022','ST07',1)
insert into CTHD (SOHD, MASP, SL) values ('1023','ST04',6)

--THUC HANH BUOI 2:Bài tập 3
--Sinh viên hoàn thành Phần II bài tập QuanLyBanHang từ câu 2 đến câu 5.
--II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
--2.Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM
--Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG
select *into SANPHAM1 from SANPHAM
select *into KHACHHANG1	from KHACHHANG

--3.Cập nhật gía tăng 5% đối với những sản phẩm do "Thai Lan" sản xuất (cho quan hệ SANPHAM)
update SANPHAM
set GIA=GIA*1.05
where NUOCSX = 'Thai Lan ';

select *from SANPHAM where NUOCSX='Thai Lan'
--4. Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống
--(cho quan hệ SANPHAM1).
UPDATE SANPHAM1
SET GIA=GIA*0.95
WHERE NUOCSX='Trung Quoc' AND GIA<=10000
--5. Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày
--1/1/2007 có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về
--sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).
UPDATE KHACHHANG1
SET LoaiKH = 'Vip'
WHERE (NGDK < '2007-01-01' AND DOANHSO >= 10000000)
OR (NGDK >= '2007-01-01' AND DOANHSO >= 2000000)

--THUC HANH BUOI 2: Bài tập 5
--Sinh viên hoàn thành Phần III bài tập QuanLyBanHang từ câu 1 đến câu 11.--III. Ngôn ngữ truy vấn dữ liệu:
--1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
--2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE DVT IN ('cay', 'quyen')
--3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE 'B%01'
--4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến
--40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE 
	NUOCSX = 'Trung Quoc'
	AND GIA BETWEEN 30000 AND 40000
--5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ
--30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE 
	NUOCSX IN ('Trung Quoc', 'Thai Lan')
	AND GIA BETWEEN 30000 AND 40000
--6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD IN ('1/1/2007', '2/1/2007')
--7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của
--hóa đơn (giảm dần).
SELECT SOHD, TRIGIA
FROM HOADON
WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC
--8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT DISTINCT KHACHHANG.MAKH, HOTEN
FROM KHACHHANG, HOADON
WHERE 
	KHACHHANG.MAKH = HOADON.MAKH
	AND NGHD = '1/1/2007'
--9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày
--28/10/2006.

SELECT SOHD, TRIGIA
FROM HOADON, NHANVIEN
WHERE
	HOADON.MANV = NHANVIEN.MANV
	AND HOTEN = 'Nguyen Van B'
	AND NGHD = '28/10/2006'
--10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong
--tháng 10/2006.
SELECT DISTINCT SANPHAM.MASP, TENSP
FROM SANPHAM, CTHD, KHACHHANG, HOADON
WHERE
	CTHD.MASP = SANPHAM.MASP
	AND CTHD.SOHD = HOADON.SOHD
	AND HOADON.MAKH = KHACHHANG.MAKH
	AND HOTEN = 'Nguyen Van A'
	AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006
--11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02')