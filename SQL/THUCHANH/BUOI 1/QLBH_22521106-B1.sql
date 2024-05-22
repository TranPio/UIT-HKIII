create database Pio

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
--KHACHHANG 
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
--NHANVIEN
insert into NHANVIEN (MANV, HOTEN, SODT, NGVL) values ('NV01','Nguyen Nhu Nhut','0927345678','13/04/2006')
insert into NHANVIEN (MANV, HOTEN, SODT, NGVL) values ('NV02','Le Thi Phi Yen','0987567390','21/04/2006')
insert into NHANVIEN (MANV, HOTEN, SODT, NGVL) values ('NV03','Nguyen Van B','0997047382','27/04/2006')
insert into NHANVIEN (MANV, HOTEN, SODT, NGVL) values ('NV04','Ngo Thanh Tuan','0913758498','24/06/2006')
insert into NHANVIEN (MANV, HOTEN, SODT, NGVL) values ('NV05','Nguyen Thi Truc Thanh','0918590387','20/07/2006')
--SANPHAM 
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
delete FROM SANPHAM
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
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1022','16/01/2007',null,'NV03',7000)
insert into HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) values ('1023','17/01/2007',null,'NV01',330000)
--select *from HOADON
set dateformat DMY

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

--THỰC HÀNH BUỔI 3:Bài tập 1
--Sinh viên hoàn thành Phần III bài tập QuanLyBanHang câu 12 và câu 13.
--12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số 
--lượng từ 10 đến 20.
	select SOHD
		from CTHD 
		where MASP in('BB01','BB02') and SL between 10 and 20
--13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với 
--số lượng từ 10 đến 20.
select SOHD
from CTHD 
where MASP = 'BB01' and SL between 10 and 20 and SOHD in
	(	select SOHD
		from CTHD 
		where MASP = 'BB02' and SL between 10 and 20
		)

--EXISTS
select SOHD
from CTHD 
where MASP = 'BB01' and SL between 10 and 20 and exists 
	(	select SOHD 
		from CTHD as CTHD1
		where MASP = 'BB02' and SL between 10 and 20
		and CTHD.SOHD=CTHD1.SOHD
		)

--Phép hội
select SOHD from CTHD where MASP = 'BB01' --and SL between 10 and 20 
--union
select SOHD from CTHD where MASP = 'BB02' --and SL between 10 and 20
--Phép giao
select SOHD from CTHD where MASP = 'BB01' --and SL between 10 and 20 
intersect 
select SOHD from CTHD where MASP = 'BB02' --and SL between 10 and 20
--Phép hội
select SOHD from CTHD where MASP = 'BB01' --and SL between 10 and 20 
union
select SOHD from CTHD where MASP = 'BB02' --and SL between 10 and 20
--Phép trừ
select SOHD from CTHD where MASP = 'BB02' --and SL between 10 and 20 
except
select SOHD from CTHD where MASP = 'BB01' --and SL between 10 and 20

--BÀI THỰC HÀNH 3: Bài tập 4
--Sinh viên hoàn thành Phần III bài tập QuanLyBanHang từ câu 14 đến 19.
--14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
--Dai so quan he (Hoi-union)
select MASP from SANPHAM where NUOCSX='Trung Quoc'
union
select MASP from CTHD join HOADON on HOADON.SOHD=CTHD.SOHD
where NGHD='1/1/2007'
--(IN-EXISTS)
--set dateformat DMY
--IN
select MASP, TENSP
from SANPHAM 
where NUOCSX='Trung Quoc' or MASP in
	(	select MASP
		from CTHD
		where SOHD in
			(	select SOHD
				from HOADON
				where NGHD='1/1/2007'
			)
	)
--EXISTS 
select MASP, TENSP
from SANPHAM 
where NUOCSX='Trung Quoc' or exists
	(	select MASP
		from CTHD
		where SANPHAM.MASP=CTHD.MASP and exists
			(	select SOHD
				from HOADON
				where HOADON.SOHD=CTHD.SOHD and NGHD='1/1/2007'
			)
	)
--Phep ket 
select distinct SANPHAM.MASP, TENSP
from SANPHAM
left join CTHD on SANPHAM.MASP=CTHD.MASP
left join HOADON on CTHD.SOHD=HOADON.SOHD
where NGHD='1/1/2007' or NUOCSX='Trung Quoc'
--15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
--(NOT IN-NOT EXSELECT MASP, TENSP
select MASP, TENSP
from SANPHAM
where MASP not in (select MASP from CTHD)
--Phep ket 
select SANPHAM.MASP, SANPHAM.TENSP
from SANPHAM
left join CTHD ON SANPHAM.MASP = CTHD.MASP
where CTHD.MASP is null
--16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
--(NOT IN-NOT EXISTS)
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN
(
	SELECT MASP 
	FROM CTHD, HOADON
	WHERE
	(
		CTHD.SOHD = HOADON.SOHD
		AND YEAR(NGHD) = 2006
	)
)
--17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong 
--năm 2006.
--NOT IN
SELECT MASP, TENSP
FROM SANPHAM
WHERE
(
	NUOCSX = 'Trung Quoc'
	AND MASP NOT IN
	(
		SELECT MASP 
		FROM CTHD, HOADON
		WHERE 
			CTHD.SOHD = HOADON.SOHD
			AND YEAR(NGHD) = 2006
	)
)
--NOT EXISTS 
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
AND NOT EXISTS (SELECT * FROM CTHD
                JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
                WHERE SANPHAM.MASP = CTHD.MASP
                AND YEAR(NGHD) = 2006)
--Phep ket 
--18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
select SOHD
from HOADON
where not exists 
	(	select *
		from SANPHAM
		where NUOCSX='Singapore' and not exists 
			(	select *
				from CTHD
				where CTHD.SOHD=HOADON.SOHD
				 and CTHD.MASP=SANPHAM.MASP
			)
	)
select SOHD
from HOADON
where not exists 
	(	select *
		from SANPHAM
		where NUOCSX='Singapore' and MASP not in
			(	select MASP
				from CTHD
				where CTHD.SOHD=HOADON.SOHD
			)
	)
--Tim san pham do Sigapore san xuat khong nam trong hoa don '1002'
select MASP
from SANPHAM
where NUOCSX='Singapore' and MASP not in
	( select MASP
		from CTHD
		where SOHD=1002
		)
--19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
select SOHD
from HOADON
where YEAR(NGHD) = 2006 
and not exists
(
	select *
	from SANPHAM
	where NUOCSX = 'Singapore'
	and not exists
	(
		select *
		from CTHD
		where CTHD.SOHD = HOADON.SOHD
		and CTHD.MASP = SANPHAM.MASP
	)
)
--III-Bài thực hành số 4
--20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select count(SOHD) SL
from HOADON
where MAKH is null
--21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
select count( distinct MASP) SLKN
from CTHD
where SOHD in (
			select SOHD
			from HOADON
			where HOADON.SOHD=CTHD.SOHD and Year(NGHD)=2006 
			) 
--22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
Select max(TRIGIA) HD_caonhat, Min(TRIGIA) HD_thapnhat
from HOADON
--23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
select avg(TRIGIA) HD_trungbinh
from HOADON
where year(NGHD)=2006
--24. Tính doanh thu bán hàng trong năm 2006.
select sum(TRIGIA) HD_tong
from HOADON
where year(NGHD)=2006
--25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
select SOHD
from HOADON
where year(NGHD)=2006 and TRIGIA=(
		select max(TRIGIA)
		from HOADON
		where year(NGHD)=2006 )  
--26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
select HOTEN
from KHACHHANG
where MAKH in(
		select MAKH
		from HOADON
		where year(NGHD)=2006 and TRIGIA=(
			select max(TRIGIA)
			from HOADON
			where year(NGHD)=2006 ) )
--27. In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm dần.
select top (3) with ties MAKH, HOTEN --with ties lấy luôn các giá trị bị trùng
from KHACHHANG
order by DOANHSO desc
--28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select MASP, TENSP
from SANPHAM
where GIA in(
	select distinct top (3) GIA
	from SANPHAM
	order by GIA desc
)
--29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức 
--giá cao nhất (của tất cả các sản phẩm).
select MASP, TENSP
from SANPHAM
where NUOCSX='Thai Lan' and GIA in(
	select distinct top (3) GIA
	from SANPHAM
	order by GIA desc
)
--30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức 
--giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
select MASP, TENSP
from SANPHAM
where NUOCSX='Trung Quoc' and GIA in(
	select distinct top (3) GIA
	from SANPHAM
	where NUOCSX='Trung Quoc'
	order by GIA desc
)

--Tim khach hang mua nhieu hoa don nhat

--Dem so hoa don cua cac khach hang
select distinct MAKH, (select count(*)
						from HOADON HD2
						where MAKH=HD1.MAKH) SL_HOADON
							from HOADON HD1
							where MAKH IS NOT null

--Cach 2
select MAKH, COUNT (*) SL_HD
from HOADON
where MAKH IS NOT null
group by MAKH
--31. * In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số).
select 
--32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
select count(*) as	SL_SANPHAM
from SANPHAM
where NUOCSX='Trung Quoc'
--33. Tính tổng số sản phẩm của từng nước sản xuất.
select NUOCSX, count (*) as SL_SANPHAM
from SANPHAM
group by NUOCSX
--34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select NUOCSX, Max(GIA) CAONHAT, min(GIA) THAPNHAT, AVG(GIA) TRUNGBINH
from SANPHAM
group by NUOCSX
--35. Tính doanh thu bán hàng mỗi ngày.
select NGHD, sum(TRIGIA) as DOANHTHU
from HOADON
group by NGHD
order by NGHD asc
--36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
select MASP, sum(SL) SOLUONG
FROM CTHD
where SOHD IN(
		select SOHD
		from HOADON
		where SOHD=CTHD.SOHD and month(NGHD)=10 AND YEAR(NGHD)=2006 )
group by MASP
select * from CTHD
--37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
select month(NGHD) THANG, sum(TRIGIA) DOANHTHU
from HOADON
where year(NGHD)=2006
group by month(NGHD)
--38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
select SOHD 
from CTHD 
group by SOHD
having count(MASP) >= 4
--39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
select SOHD
from CTHD
WHERE MASP in (
		select MASP
		from SANPHAM
		where MASP=SANPHAM.MASP AND NUOCSX='Viet Nam'
		)
group by SOHD
having count(MASP)=3
--40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất. 
select KHACHHANG.MAKH, HOTEN
from KHACHHANG, HOADON
where KHACHHANG.MAKH = HOADON.MAKH
group by KHACHHANG.MAKH, HOTEN
having COUNT(*) >= ALL(select COUNT(*) from HOADON group by MAKH)

--41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
select MONTH(NGHD)
from HOADON
where YEAR(NGHD) = 2006
group by MONTH(NGHD)
having SUM(TRIGIA) >= ALL(select SUM(TRIGIA) from HOADON where YEAR(NGHD) = 2006 group by MONTH(NGHD))

--42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select TOP 1 with TIES SANPHAM.MASP, TENSP
from SANPHAM, CTHD, HOADON
where 
	SANPHAM.MASP = CTHD.MASP
	AND HOADON.SOHD = CTHD.SOHD
	AND YEAR(NGHD) = 2006
group by SANPHAM.MASP, TENSP
order by SUM(SL)
--43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
select NUOCSX, MASP, TENSP
from SANPHAM SP1
where exists
(
	select NUOCSX
	from SANPHAM SP2
	group by NUOCSX
	having SP1.NUOCSX = SP2.NUOCSX
	and SP1.GIA = MAX(GIA)
)
--44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
select NUOCSX
from SANPHAM
group by NUOCSX
having COUNT(distinct GIA) >= 3
--45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
select *
from KHACHHANG
where MAKH in
(
	select top 1 WITH TIES HOADON.MAKH
	from (select top 10 MAKH from KHACHHANG order by DOANHSO desc) as A
	join HOADON ON A.MAKH = HOADON.MAKH
	group by HOADON.MAKH
	order by COUNT(*) desc
)





--11. Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó đăng ký thành viên (NGDK).
-- BANG TAM ANH HUONG
--						Them	Xoa		Sua
--KHACHHANG				-		-		+(NGDK)
--HOADON				+		-		+(NGHD, MAKH)

--Trigger: Update KHACHHANG
go 
create trigger TRG_KHACHHANG_NGDK_UPD
on KHACHHANG
for update
as
begin
		declare @NGDK smalldatetime, @NGHD smalldatetime, @MAKH char(4)
	--Gan theo gia tri dau vao
	select	@MAKH = MAKH,
			@NGDK = NGDK from inserted
	--Lay ngay NGHD de kiem tra
	if (@NGDK >= any (select NGHD from HOADON where MAKH = @MAKH))
	begin 
		print 'Khong thuc hien duoc do co truong hop  NGDK > NGHD'
		rollback transaction
	end
	else
	begin
		print 'Cap nhat thong tin KHACHHANG thanh cong'
	end
end
--Trigger: Them, sua HOADON
GO
CREATE TRIGGER TRG_HOADON_NGHD_MAKH_INS_UPD
ON HOADON
FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @NGAYHD SMALLDATETIME, @NGAYDK SMALLDATETIME, @MAKH CHAR(4)
	SELECT @MAKH = MAKH , @NGAYHD = NGHD
	FROM INSERTED
	SELECT @NGAYDK = NGDK
	FROM KHACHHANG
	WHERE MAKH = @MAKH
	IF (@NGAYHD<@NGAYDK)
	BEGIN 
		PRINT N'BỊ LỖI'
		ROLLBACK TRANSACTION
	END
	ELSE 
	BEGIN 
	PRINT 'OKE'
	END
END
--12. Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó vào làm.
--BANG TAM ANH HUONG
--						Them	Xoa		Sua
--NHANVIEN				-		-		+(NGVL)
--HOADON				+		-		+(NGHD, MANV)
--Trigger: Update NHANVIEN 
GO 
CREATE TRIGGER TRG_NHANVIEN_NGHD_MANV_INS_UPD
ON NHANVIEN
FOR  UPDATE
AS
BEGIN
	DECLARE @NGAYHD SMALLDATETIME, @NGAYVL SMALLDATETIME, @MANV CHAR(4)
	SELECT  @NGAYVL = NGVL, @MANV = MANV
	FROM INSERTED
	SELECT @NGAYHD  = NGHD
	FROM HOADON
	WHERE @MANV = MANV
	IF (@NGAYHD<@NGAYVL)
	BEGIN 
		PRINT N'BỊ LỖI'
		ROLLBACK TRANSACTION
	END
	ELSE 
	BEGIN
		PRINT 'OKE'
	END
END
--Trigger: Thêm, sửa HOADON 
GO 
CREATE TRIGGER TRG_HOADON_NGHD_MANV_INS_UPD
ON HOADON
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @NGAYHD SMALLDATETIME, @NGAYVL SMALLDATETIME, @MANV CHAR(4)
	SELECT @MANV = MANV, @NGAYHD = NGHD
	FROM INSERTED
	SELECT @NGAYVL  = NGVL
	FROM NHANVIEN
	WHERE @MANV = MANV
	IF (@NGAYHD<@NGAYVL)
	BEGIN 
		PRINT N'BỊ LỖI'
		ROLLBACK TRANSACTION
	END
	ELSE 
	BEGIN
		PRINT'OKE'
	END
END

--13. Mỗi một hóa đơn phải có ít nhất một chi tiết hóa đơn.
--BANG TAM ANH HUONG
--						Them	Xoa		Sua
--CTHD					-		+		-(*)
GO
CREATE TRIGGER TRG_CTHD_SOHD_DEL_UPD
ON CTHD
FOR DELETE
AS
BEGIN 
	DECLARE @SOHOADON CHAR(4), @SOHD CHAR(4)
	SELECT @SOHOADON = SOHD
	FROM inserted
	SELECT @SOHD  = SOHD
	FROM HOADON
	IF(@SOHD != @SOHOADON)
	BEGIN 
		PRINT N'BỊ LỖI'
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT'OKE'
	END
END
--14. Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa đơn đó.
--BANG TAM ANH HUONG
--						Them	Xoa		Sua
--CTHD					+		+		+(SL)
--HOADON				-		-		+(GIA)
--SANPHAM				-		-		+(GIA) -> k cần viết trong trigger
GO
CREATE TRIGGER TRG_CTHD
ON CTHD
FOR INSERT, DELETE, UPDATE
AS 
BEGIN
	DECLARE @SOHD INT, @MASP CHAR(4), @SOL INT,@TRIGIA MONEY
	SELECT @SOHD = SOHD, @MASP = MASP, @SOL = SL
	FROM INSERTED
	SET @TRIGIA  = @SOL * (SELECT GIA FROM SANPHAM WHERE MASP = @MASP)
	DECLARE OUR_CTHD CURSOR
	FOR 
		SELECT MASP,SL
		FROM CTHD
		WHERE SOHD = @SOHD
	OPEN OUR_CTHD
	FETCH NEXT FROM CUR_CTHD
	INTO @MASP, @SOL

	WHILE (@@FETCH_STATUS = 0)
	BEGIN 
		SET @TRIGIA = @TRIGIA + @SOL* (SELECT GIA FROM SANPHAM WHERE MASP = @MASP )
		FETCH NEXT FROM CUR_CTHD
		INTO @MASP, @SOL
	END
END
--15. Doanh số của một khách hàng là tổng trị giá các hóa đơn mà khách hàng thành viên đó đã mua.
--BANG TAM ANH HUONG
--						Them	Xoa		Sua
--HOADON				+		-		+(MAKH, TRIGIA)
--KHACHHANG				-		-		+(HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK, LOAIKH) -> k cần viết trong trigger
GO
CREATE TRIGGER TRG_HOADON_DS
ON HOADON 
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @DOANHSO money, @TONGTG money
	 
	SELECT @TONGTG = sum(TRIGIA) from inserted
	SELECT @DOANHSO = DOANHSO
	FROM inserted inner join KHACHHANG
	ON inserted.MAKH = KHACHHANG.MAKH
	
	IF (@DOANHSO <> @TONGTG)
	BEGIN
		PRINT 'Doanh so cua mot khach hang phai la tong tri gia cac hoa don khach hang thanh vien do da mua'
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT 'Cap nhat HOADON thanh cong'
	END
END
