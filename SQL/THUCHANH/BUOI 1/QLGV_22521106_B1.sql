 create database QuanLyGiaoVu

go

use QuanLyGiaoVu

--use master
--drop database QuanLyGiaoVu

create table HOCVIEN
(
	MAHV	 char(5) not null,
	HO		 varchar(40),
	TEN		 varchar(10),
	NGSINH	 smalldatetime,
	GIOITINH varchar(3),
	NOISINH	 varchar(40),
	MALOP	 char(3),
	constraint PK_MAHV primary key (MAHV)
)

--drop table HOCVIEN

create table LOP
(
	MALOP	char(3) not null,
	TENLOP	varchar(40),
	TRGLOP	char(5),
	SISO	tinyint,
	MAGVCN	char(4),
	constraint PK_MALOP primary key (MALOP)
)
--drop table LOP

create table KHOA
(
	MAKHOA	varchar(4) not null,
	TENKHOA	varchar(40),
	NGTLAP	smalldatetime,
	TRGKHHOA char(4),
	constraint PK_MAKHOA primary key (MAKHOA)
)
--drop table KHOA

create table MONHOC
(
	MAMH	varchar(10) not null,
	TENMH	varchar(40),
	TCLT	tinyint,
	TCTH	tinyint,
	MAKHOA	varchar(4),
	constraint PK_MAMH primary key (MAMH)
)

create table DIEUKIEN
(
	MAMH		varchar(10) not null,
	MAMH_TRUOC	varchar(10) not null,
	constraint PK_DIEUKIEN primary key (MAMH,MAMH_TRUOC)
)
--drop table DIEUKIEN

create table GIAOVIEN
(
	MAGV	char(4) not null,
	HOTEN	varchar(40),
	HOCVI	varchar(10),
	HOCHAM	varchar(10),
	GIOITINH varchar(3),
	NGSINH	smalldatetime,
	NGVL	smalldatetime,
	HESO	numeric(4,2),
	MUCLUONG money,
	MAKHOA	varchar(4)
	constraint PK_MAGV primary key (MAGV)
)

create table GIANGDAY
(
	MALOP	char(3) not null,
	MAMH	varchar(10) not null,
	MAGV	char(4),
	HOCKY	tinyint,
	NAM		smallint,
	TUNGAY	smalldatetime,
	DENNGAY	smalldatetime,
	constraint PK_GIANGDAY primary key (MALOP,MAMH)
)
--drop table GIANGDAY

create table KETQUATHI	
(
	MAHV	char(5) not null,
	MAMH	varchar(10) not null,
	LANTHI	tinyint not null,
	NGTHI	smalldatetime,
	DIEM	numeric(4,2),
	KQUA	varchar(10),
	constraint PK_KETQUATHI	primary key (MAHV,MAMH,LANTHI)
)
--drop table KETQUATHI
SET DATEFORMAT DMY
--KHOA
INSERT INTO KHOA VALUES ('KHMT','Khoa hoc may tinh','7/6/2005','GV01')
INSERT INTO KHOA VALUES ('HTTT','He thong thong tin','7/6/2005','GV02')
INSERT INTO KHOA VALUES ('CNPM','Cong nghe phan mem','7/6/2005','GV04')
INSERT INTO KHOA VALUES ('MTT','Mang va truyen thong','20/10/2005','GV03')
INSERT INTO KHOA VALUES ('KTMT','Ky thuat may tinh','20/12/2005','Null')
--LOP
INSERT INTO LOP VALUES ('K11','Lop 1 khoa 1','K1108',11,'GV07')
INSERT INTO LOP VALUES ('K12','Lop 2 khoa 1','K1205',12,'GV09')
INSERT INTO LOP VALUES ('K13','Lop 3 khoa 1','K1305',12,'GV14')
--MONHOC
INSERT INTO MONHOC VALUES ('THDC','Tin hoc dai cuong',4,1,'KHMT')
INSERT INTO MONHOC VALUES ('CTRR','Cau truc roi rac',5,0,'KHMT')
INSERT INTO MONHOC VALUES ('CSDL','Co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES ('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
INSERT INTO MONHOC VALUES ('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
INSERT INTO MONHOC VALUES ('DHMT','Do hoa may tinh',3,1,'KHMT')
INSERT INTO MONHOC VALUES ('KTMT','Kien truc may tinh',3,0,'KTMT')
INSERT INTO MONHOC VALUES ('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES ('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
INSERT INTO MONHOC VALUES ('HDH','He dieu hanh',4,0,'KTMT')
INSERT INTO MONHOC VALUES ('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
INSERT INTO MONHOC VALUES ('LTCFW','Lap trinh C for win',3,1,'CNPM')
INSERT INTO MONHOC VALUES ('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')
--DELETE FROM MONHOC
--SELECT *FROM MONHOC

--GIANGDAY
INSERT INTO GIANGDAY VALUES ('K11','THDC','GV07',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES ('K12','THDC','GV06',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES ('K13','THDC','GV15',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES ('K11','CTRR','GV02',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES ('K12','CTRR','GV02',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES ('K13','CTRR','GV08',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES ('K11','CSDL','GV05',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES ('K12','CSDL','GV09',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES ('K13','CTDLGT','GV15',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES ('K13','CSDL','GV05',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K13','DHMT','GV07',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K11','CTDLGT','GV15',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K12','CTDLGT','GV15',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES ('K11','HDH','GV04',1,2007,'2/1/2007','18/2/2007')
INSERT INTO GIANGDAY VALUES ('K12','HDH','GV04',1,2007,'2/1/2007','20/3/2007')
INSERT INTO GIANGDAY VALUES ('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')
--GIAOVIEN
INSERT INTO GIAOVIEN VALUES ('GV01','Ho Thanh Son','PTS','GS','Nam','2/5/1950','11/1/2004',5.00,2250000,'KHMT')
INSERT INTO GIAOVIEN VALUES ('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004',4.50,2025000,'HTTT')
INSERT INTO GIAOVIEN VALUES ('GV03','Do Nghiem Phung','TS','GS','Nu','1/8/1950','23/9/2004',4.00,1800000,'CNPM')
INSERT INTO GIAOVIEN VALUES ('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','12/1/2005',4.50,2025000,'KTMT')
INSERT INTO GIAOVIEN VALUES ('GV05','Mai Thanh Danh','ThS','GV','Nam','12/3/1958','12/1/2005',3.00,1350000,'HTTT')
INSERT INTO GIAOVIEN VALUES ('GV06','Tran Doan Hung','TS','GV','Nam','11/3/1953','12/1/2005',4.50,2025000,'KHMT')
INSERT INTO GIAOVIEN VALUES ('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','1/3/2005',4.00,1800000,'KHMT')
INSERT INTO GIAOVIEN VALUES ('GV08','Le Thi Tran','KS','Null','Nu','26/3/1974','1/3/2005',1.69,760500,'KHMT')
INSERT INTO GIAOVIEN VALUES ('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','1/3/2005',4.00,1800000,'HTTT')
INSERT INTO GIAOVIEN VALUES ('GV10','Le Tran Anh Loan','KS','Null','Nu','17/7/1972','1/3/2005',1.86,837000,'CNPM')
INSERT INTO GIAOVIEN VALUES ('GV11','Ho Thanh Tung','CN','GV','Nam','12/1/1980','15/5/2005',2.67,1201500,'MTT')
INSERT INTO GIAOVIEN VALUES ('GV12','Tran Van Anh','CN','Null','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM')
INSERT INTO GIAOVIEN VALUES ('GV13','Nguyen Linh Dan','CN','Null','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT')
INSERT INTO GIAOVIEN VALUES ('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3.00,1350000,'MTT')
INSERT INTO GIAOVIEN VALUES ('GV15','Le Ha Thanh','ThS','GV','Nam','4/5/1978','15/5/2005',3.00,1350000,'KHMT')
--DIEUKIEN
INSERT INTO DIEUKIEN VALUES ('CSDL','CTRR')
INSERT INTO DIEUKIEN VALUES ('CSDL','CTDLGT')
INSERT INTO DIEUKIEN VALUES ('CTDLGT','THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKTT','THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKTT','CTDLGT')
INSERT INTO DIEUKIEN VALUES ('DHMT','THDC')
INSERT INTO DIEUKIEN VALUES ('LTHDT','THDC')
INSERT INTO DIEUKIEN VALUES ('PTTKHTTT','CSDL')
--KETQUATHI
INSERT INTO KETQUATHI VALUES ('K1101','CSDL',1,'20/7/2006',10.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1101','CTDLGT',1,'28/12/2006',9.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1101','THDC',1,'20/5/2006',9.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1101','CTRR',1,'13/5/2006',9.50,'Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CSDL',1,'20/7/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CSDL',2,'27/7/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CSDL',3,'10/8/2006',4.50,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CTDLGT',1,'28/12/2006',4.50,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CTDLGT',2,'5/1/2007',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CTDLGT',3,'15/1/2007',6.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1102','THDC',1,'20/5/2006',5.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1102','CTRR',1,'13/5/2006',7.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1103','CSDL',1,'20/7/2006',3.50,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1103','CSDL',2,'27/7/2006',8.25,'Dat')
INSERT INTO KETQUATHI VALUES ('K1103','CTDLGT',1,'28/12/2006',7.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1103','THDC',1,'20/5/2006',8.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1103','CTRR',1,'13/5/2006',6.50,'Dat')
INSERT INTO KETQUATHI VALUES ('K1104','CSDL',1,'20/7/2006',3.75,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104','CTDLGT',1,'28/12/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104','THDC',1,'20/5/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104','CTRR',1,'13/5/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104','CTRR',2,'20/5/2006',3.50,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1104','CTRR',3,'30/6/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1201','CSDL',1,'20/7/2006',6.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1201','CTDLGT',1,'28/12/2006',5.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1201','THDC',1,'20/5/2006',8.50,'Dat')
INSERT INTO KETQUATHI VALUES ('K1201','CTRR',1,'13/5/2006',9.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CSDL',1,'20/7/2006',8.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CTDLGT',1,'28/12/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CTDLGT',2,'5/1/2007',5.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1202','THDC',1,'20/5/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202','THDC',2,'27/5/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CTRR',1,'13/5/2006',3.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CTRR',2,'20/5/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1202','CTRR',3,'30/6/2006',6.25,'Dat')
INSERT INTO KETQUATHI VALUES ('K1203','CSDL',1,'20/7/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES ('K1203','CTDLGT',1,'28/12/2006',9.50,'Dat')
INSERT INTO KETQUATHI VALUES ('K1203','THDC',1,'20/5/2006',10.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1203','CTRR',1,'13/5/2006',10.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1204','CSDL',1,'20/7/2006',8.50,'Dat')
INSERT INTO KETQUATHI VALUES ('K1204','CTDLGT',1,'28/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES ('K1204','THDC',1,'20/5/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1204','CTRR',1,'13/5/2006',6.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1301','CTDLGT',1,'25/7/2006',8.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1301','THDC',1,'20/5/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES ('K1301','CTRR',1,'13/5/2006',8.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1302','CSDL',1,'20/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES ('K1302','CTDLGT',1,'25/7/2006',5.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1302','THDC',1,'20/5/2006',8.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1302','CTRR',1,'13/5/2006',8.50,'Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CSDL',1,'20/12/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CTDLGT',1,'25/7/2006',4.50,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CTDLGT',2,'7/8/2006',4.00,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CTDLGT',3,'15/8/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','THDC',1,'20/5/2006',4.50,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CTRR',1,'13/5/2006',3.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES ('K1303','CTRR',2,'20/5/2006',5.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1304','CSDL',1,'20/12/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES ('K1304','CTDLGT',1,'25/7/2006',9.75,'Dat')
INSERT INTO KETQUATHI VALUES ('K1304','THDC',1,'20/5/2006',5.50,'Dat')
INSERT INTO KETQUATHI VALUES ('K1304','CTRR',1,'13/5/2006',5.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1305','CSDL',1,'20/12/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES ('K1305','CTDLGT',1,'25/7/2006',10.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1305','THDC',1,'20/5/2006',8.00,'Dat')
INSERT INTO KETQUATHI VALUES ('K1305','CTRR',1,'13/5/2006',10.00,'Dat')
set dateformat DMY
--HOCVIEN
INSERT INTO HOCVIEN VALUES ('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES ('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES ('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11')
INSERT INTO HOCVIEN VALUES ('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11')
INSERT INTO HOCVIEN VALUES ('K1105','Tran Minh','Long','27/2/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES ('K1106','Le Nhat','Minh','24/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES ('K1107','Nguyen Nhu','Nhut','27/1/1986','Nam','Ha Noi','K11')
INSERT INTO HOCVIEN VALUES ('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES ('K1109','Phan Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES ('K1110','Le Hoai','Thuong','5/2/1986','Nu','Can Tho','K11')
INSERT INTO HOCVIEN VALUES ('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES ('K1201','Nguyen Van','B','11/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES ('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES ('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES ('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12')
INSERT INTO HOCVIEN VALUES ('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES ('K1206','Nguyen Thi Truc','Thanh','4/3/1986','Nu','Kien Giang','K12')
INSERT INTO HOCVIEN VALUES ('K1207','Tran Thi Bich','Thuy','8/2/1986','Nu','Nghe An','K12')
INSERT INTO HOCVIEN VALUES ('K1208','Huynh Thi Kim','Trieu','8/4/1986','Nu','Tay Ninh','K12')
INSERT INTO HOCVIEN VALUES ('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES ('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES ('K1211','Do Thi','Xuan','9/3/1986','Nu','Ha Noi','K12')
INSERT INTO HOCVIEN VALUES ('K1212','Le Thi Phi','Yen','12/3/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES ('K1301','Nguyen Thi Kim','Cuc','9/6/1986','Nu','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES ('K1302','Truong Thi My','Hien','18/3/1986','Nu','Nghe An','K13')
INSERT INTO HOCVIEN VALUES ('K1303','Le Duc','Hien','21/3/1986','Nam','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES ('K1304','Le Quang','Hien','18/4/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES ('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13')
INSERT INTO HOCVIEN VALUES ('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13')
INSERT INTO HOCVIEN VALUES ('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES ('K1308','Nguyen Hieu','Nghia','8/4/1986','Nam','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES ('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13')
INSERT INTO HOCVIEN VALUES ('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES ('K1311','Tran Minh','Thuc','4/4/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES ('K1312','Nguyen Thi Kim','Yen','7/9/1986','Nu','TpHCM','K13')
--I
--1. Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN.
alter table HOCVIEN add constraint FK_HOCVIEN_MALOP foreign key (MALOP) references LOP(MALOP)
--ALTER TABLE HOCVIEN DROP CONSTRAINT FK_HOCVIEN_MALOP

alter table MONHOC add constraint FK_MONHOC_MAKHOA foreign key (MAKHOA) references KHOA(MAKHOA)
--ALTER TABLE MONHOC DROP CONSTRAINT FK_MONHOC_MAKHOA

alter table GIAOVIEN add constraint FK_GIAOVIEN_MAKHOA foreign key (MAKHOA) references KHOA(MAKHOA)
--ALTER TABLE GIAOVIEN DROP constraint FK_GIAOVIEN_MAKHOA

alter table GIANGDAY add constraint FK_GIANGDAY_MAGV foreign key (MAGV) references GIAOVIEN(MAGV)
--ALTER TABLE GIANGDAY DROP constraint FK_GIANGDAY_MAGV

alter table HOCVIEN
add GHICHUHV varchar(20)

--alter table HOCVIEN 
--drop column GHICHUHV

alter table HOCVIEN
add DIEMTB numeric(4,2)

--alter table HOCVIEN
--drop column DIEMTB

alter table HOCVIEN
add XEPLOAI varchar(10)

--alter table HOCVIEN
--drop column XEPLOAI

--2. Mã học viên là một chuỗi 5 ký tự, 3 ký tự đầu là mã lớp, 2 ký tự cuối cùng là số thứ tự học viên trong lớp. VD: “K1101”
alter table HOCVIEN
add constraint CK_MAHV check ((left (cast (MAHV as char),3) = MALOP and right (cast (MAHV as char),2) <=20))

--insert into LOP(MALOP)
--values ('K12')

--insert into LOP(MALOP)
--values ('K10')

--insert into HOCVIEN(MAHV, MALOP)
--values ('K2023', 'K11')

--insert into HOCVIEN(MAHV, MALOP)
--values ('K1202', 'K12')

--insert into HOCVIEN(MAHV, MALOP)
--values ('K1501','K15')

--select * from HOCVIEN
--delete from HOCVIEN

--3. Thuộc tính GIOITINH chỉ có giá trị là “Nam” hoặc “Nu”
alter table HOCVIEN
add constraint CK_GIOITINH_HOCVIEN check (GIOITINH in ('Nam','Nu'))

alter table GIAOVIEN
add constraint CK_GIOITINH_GIAOVIEN check (GIOITINH in ('Nam','Nu'))

--insert into HOCVIEN (MAHV,GIOITINH)
--values ('THP01','Nam')

--insert into GIAOVIEN (MAGV,GIOITINH)
--values ('GV01','Nu')

--select * from GIAOVIEN
--delete from GIAOVIEN 

--4. Điểm số của một lần thi có giá trị từ 0 đến 10 và cần lưu đến 2 số lẽ (VD: 6.22).
alter table KETQUATHI
alter column DIEM numeric(4,2)


--alter table KETQUATHI
--add constraint CK_KETQUATHI_DIEM check (DIEM >= 0 and DIEM <= 10)

--insert into KETQUATHI(MAHV,MAMH,LANTHI,DIEM)
--values ('K1105','IT002',2,1.75)

--5. Kết quả thi là “Dat” nếu điểm từ 5 đến 10 và “Khong dat” nếu điểm nhỏ hơn 5.
alter table KETQUATHI
add constraint CK_KETQUATHI check (((DIEM >= 5 and DIEM <= 10) and KQUA='Dat') or (DIEM < 5 and KQUA='Khong dat'))

--insert into HOCVIEN (MAHV)
--values ('K2205')

--insert into MONHOC (MAMH)
--values ('IT005')

--insert into KETQUATHI (MAHV,MAMH,LANTHI,DIEM)
--values ('K1105','IT004',2,6)

--select * from KETQUATHI
--delete from KETQUATHI

--6. Học viên thi một môn tối đa 3 lần.
alter table KETQUATHI
add constraint CK_KETQUATHI_LANTHI check (LANTHI <= 3)

--insert into KETQUATHI (MAHV,MAMH,LANTHI)
--values ('K1105','IT001',1)

--insert into KETQUATHI (MAHV,MAMH,LANTHI)
--values ('K1105','IT002',4)

--select * from KETQUATHI
--delete from KETQUATHI

--7. Học kỳ chỉ có giá trị từ 1 đến 3.
alter table GIANGDAY
add constraint CK_GIANGDAY_HOCKY check (HOCKY >= 1 and HOCKY <= 3)

--insert into LOP(MALOP)
--values ('K11')

--insert into GIANGDAY(MALOP,MAMH,HOCKY)
--values ('K12','IT001',1)

--insert into GIANGDAY(MALOP,MAMH,HOCKY)
--values ('K11','IT001',4)

--select * from GIANGDAY
--delete from LOP

--8. Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”
alter table GIAOVIEN
add constraint CK_GIAOVIEN_HOCVI check (HOCVI in ('CN','KS','Ths','TS','PTS'))

--insert into GIAOVIEN(MAGV,HOCVI)
--values ('GV01','CN')

--insert into GIAOVIEN(MAGV,HOCVI)
--values ('GV02','KC')

--select * from GIAOVIEN
--delete from GIAOVIEN

--BAI THUC HANH 2: Bài tập 4
--Sinh viên hoàn thành Phần I bài tập QuanLyGiaoVu từ câu 11 đến câu 14.
--11. Học viên ít nhất là 18 tuổi.
ALTER TABLE HOCVIEN ADD CONSTRAINT CHECK_TUOI CHECK (YEAR(GETDATE()) - YEAR(NGSINH) >= 18)
--12. Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY).
ALTER TABLE GIANGDAY ADD CONSTRAINT CHECK_GIANGDAY CHECK (TUNGAY < DENNGAY)
--13. Giáo viên khi vào làm ít nhất là 22 tuổi.
ALTER TABLE GIAOVIEN ADD CONSTRAINT CHECK_TUOILAM CHECK (YEAR(NGVL) - YEAR(NGSINH) >= 22)
--14. Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3.
--select *from MONHOC
ALTER TABLE MONHOC ADD CONSTRAINT CHECK_TINCHI1 CHECK (ABS(TCLT - TCTH) <= 3)
--select *from MONHOC


--THUC HANH BUOI 2:Sinh viên hoàn thành Phần III bài tập QuanLyGiaoVu từ câu 1 đến câu 5.
--III. Ngôn ngữ truy vấn dữ liệu:
--1. In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
SELECT A.MALOP, B.MAHV, B.HO, B.TEN, B.NGSINH
FROM LOP A, HOCVIEN B
WHERE A.TRGLOP = B.MAHV AND A.MALOP = B.MALOP;
--2. In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp
--theo tên, họ học viên.
SELECT A.MAHV, HO, TEN, LANTHI, DIEM
FROM KETQUATHI A, HOCVIEN B
WHERE A.MAHV=B.MAHV AND MAMH='CTRR' AND MALOP='K12'
ORDER BY HO, TEN,	A.MAHV 
--3. In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ
--nhất đã đạt.
SELECT B.MAHV, B.HO, B.TEN, A.MAMH
FROM KETQUATHI A JOIN HOCVIEN B
ON A.MAHV = B.MAHV
WHERE A.LANTHI = 1 AND A.KQUA = 'DAT'
--4. In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
SELECT A.MAHV, HO, TEN
FROM KETQUATHI A, HOCVIEN B
WHERE A.MAHV=B.MAHV AND MAMH='CTRR' AND MALOP='K11' AND LANTHI=1 AND KQUA='KHONG DAT'
--5. * Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần
--thi).
SELECT A.MAHV, HOTEN FROM (
	SELECT KQ.MAHV, HO + ' ' + TEN AS HOTEN, LANTHI
	FROM KETQUATHI KQ INNER JOIN HOCVIEN HV 
	ON KQ.MAHV = HV.MAHV
	WHERE LEFT(KQ.MAHV, 3) = 'K11' AND MAMH = 'CTRR' AND KQUA = 'Khong Dat'
) A 
INNER JOIN (
	SELECT MAHV, MAX(LANTHI) LANTHIMAX FROM KETQUATHI 
	WHERE LEFT(MAHV, 3) = 'K11' AND MAMH = 'CTRR'
	GROUP BY MAHV, MAMH 
) B 
ON A.MAHV = B.MAHV
WHERE LANTHI = LANTHIMAX

--THỰC HÀNH 3:Bài tập 2
--Sinh viên hoàn thành Phần II bài tập QuanLyGiaoVu từ câu 1 đến câu 4
--II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
--1. Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa.
update GIAOVIEN
set HESO=HESO+0.2
where MAGV in
	(	select TRGKHHOA
		from KHOA
	)
--2. Cập nhật giá trị điểm trung bình tất cả các môn học (DIEMTB) của mỗi học viên (tất cả các môn 
--học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau cùng).
update HOCVIEN
set DIEMTB =
(
	select AVG(DIEM)
	from KETQUATHI
	where LANTHI = (select MAX(LANTHI) from KETQUATHI KQ where MAHV = KETQUATHI.MAHV group by MAHV)
	group by MAHV
	having MAHV = HOCVIEN.MAHV
)
--3. Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi 
--lần thứ 3 dưới 5 điểm.
UPDATE HOCVIEN
SET GHICHU = 'Cam thi'
WHERE MAHV IN 
(
	SELECT MAHV
	FROM KETQUATHI
	WHERE LANTHI = 3 AND DIEM < 5
)
--4. Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:
--o Nếu DIEMTB <= 9 thì XEPLOAI =”XS”
--o Nếu 8 <= DIEMTB < 9 thì XEPLOAI = “G”
--o Nếu 6.5 <= DIEMTB < 8 thì XEPLOAI = “K”
--o Nếu 5 <= DIEMTB < 6.5 thì XEPLOAI = “TB”
--o Nếu DIEMTB < 5 thì XEPLOAI = ”Y”
UPDATE HOCVIEN
SET XEPLOAI =
(
	CASE 
		WHEN DIEMTB >= 9 THEN 'XS'
		WHEN DIEMTB >= 8 AND DIEMTB < 9 THEN 'G'
		WHEN DIEMTB >= 6.5 AND DIEMTB < 8 THEN 'K'
		WHEN DIEMTB >= 5 AND DIEMTB < 6.5 THEN 'TB'
		WHEN DIEMTB < 5 THEN 'Y'
	END
)
--TH3:Bài tập 3
--Sinh viên hoàn thành Phần III bài tập QuanLyGiaoVu từ câu 6 đến câu 10.
--6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT TENMH
FROM MONHOC, GIAOVIEN, GIANGDAY
WHERE
	MONHOC.MAMH = GIANGDAY.MAMH
	AND GIAOVIEN.MAGV = GIANGDAY.MaGV
	AND HOTEN = 'Tran Tam Thanh'
	AND HOCKY = 1 AND NAM = 2006
--7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học 
--kỳ 1 năm 2006.
SELECT DISTINCT MONHOC.MAMH, TENMH
FROM MONHOC, LOP, GIANGDAY
WHERE
	GIANGDAY.MAMH = MONHOC.MAMH
	AND GIANGDAY.MAGV = LOP.MaGVCN
	AND LOP.MALOP = 'K11'
	AND HOCKY = 1 AND NAM = 2006
--8. Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.
SELECT DISTINCT (HO+' '+TEN) HOTEN
FROM HOCVIEN, LOP, GIAOVIEN, GIANGDAY, MONHOC
WHERE
	LOP.TRGLOP = HOCVIEN.MAHV
	AND GIANGDAY.MALOP = LOP.MALOP
	AND GIANGDAY.MAGV = GIAOVIEN.MAGV
	AND GIANGDAY.MAMH = MONHOC.MAMH
	AND HOTEN = 'Nguyen To Lan'
	AND TENMH = 'Co So Du Lieu'
--9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du 
--Lieu”.
SELECT MAMH, TENMH 
FROM MONHOC
WHERE MAMH IN (
	SELECT MAMH_TRUOC
	FROM DIEUKIEN 
	WHERE MAMH IN (
		SELECT MAMH 
		FROM MONHOC 
		WHERE TENMH = 'Co So Du Lieu'
	)
)
--10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên 
--môn học) nào.
SELECT MAMH, TENMH 
FROM MONHOC
WHERE MAMH IN (
	SELECT MAMH 
	FROM DIEUKIEN 
	WHERE MAMH_TRUOC IN (
		SELECT MAMH 
		FROM MONHOC 
		WHERE TENMH = 'Cau Truc Roi Rac'
	)
)
--TH3:Bài tập 5
--Sinh viên hoàn thành Phần III bài tập QuanLyGiaoVu từ câu 11 đến câu 18.
--11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
SELECT HOTEN
FROM GIAOVIEN, GIANGDAY
WHERE
	GIAOVIEN.MAGV = GIANGDAY.MAGV
	AND MALOP = 'K11'
	AND HOCKY = 1 AND NAM = 2006
INTERSECT 
	(
	SELECT HOTEN
	FROM GIAOVIEN, GIANGDAY
	WHERE
		GIAOVIEN.MAGV = GIANGDAY.MAGV
		AND MALOP = 'K12' AND HOCKY = 1 AND NAM = 2006
	)
--12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi 
--lại môn này.
SELECT HOCVIEN.MAHV, (HO+' '+TEN) HOTEN
FROM HOCVIEN, KETQUATHI
WHERE
	HOCVIEN.MAHV = KETQUATHI.MAHV
	AND MAMH = 'CSDL' AND LANTHI = 1 AND KQUA = 'Khong Dat'
	AND NOT EXISTS (SELECT * FROM KETQUATHI WHERE LANTHI > 1 AND KETQUATHI.MAHV = HOCVIEN.MAHV)
--13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
SELECT MAGV, HOTEN
FROM GIAOVIEN
WHERE MAGV NOT IN (SELECT MAGV FROM GIANGDAY)
--14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc 
--khoa giáo viên đó phụ trách.
--C1
SELECT MAGV, HOTEN 
FROM GIAOVIEN
WHERE NOT EXISTS
(
    SELECT *
    FROM MONHOC
    WHERE MONHOC.MAKHOA = GIAOVIEN.MAKHOA
    AND NOT EXISTS
    (
        SELECT *
        FROM GIANGDAY
        WHERE GIANGDAY.MAMH = MONHOC.MAMH
        AND GIANGDAY.MAGV = GIAOVIEN.MAGV
    )
)

SELECT MAGV, HOTEN
FROM GIAOVIEN
WHERE MAGV NOT IN
(
    SELECT DISTINCT GIANGDAY.MAGV
    FROM GIANGDAY
    JOIN MONHOC ON GIANGDAY.MAMH = MONHOC.MAMH
    WHERE MONHOC.MAKHOA = GIAOVIEN.MAKHOA
)

--C2
SELECT MAGV, HOTEN 
FROM GIAOVIEN 
WHERE MAGV NOT IN (
	SELECT GIANGDAY.MAGV
	FROM GIANGDAY INNER JOIN GIAOVIEN 
	ON GIANGDAY.MAGV = GIAOVIEN.MAGV INNER JOIN MONHOC 
	ON GIANGDAY.MAMH = MONHOC.MAMH
	WHERE GIAOVIEN.MAKHOA = MONHOC.MAKHOA
)
--15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần 
--thứ 2 môn CTRR được 5 điểm.
SELECT DISTINCT (HO+' '+TEN) HOTEN
FROM HOCVIEN, KETQUATHI
WHERE
	HOCVIEN.MAHV = KETQUATHI.MAHV
	AND MALOP = 'K11'
	AND	
	(
		(LANTHI = 2 AND DIEM = 5)
		OR HOCVIEN.MAHV IN
		(
			SELECT DISTINCT MAHV
			FROM KETQUATHI
			WHERE KQUA = 'Khong Dat'
			GROUP BY MAHV, MAMH
			HAVING COUNT(*) > 3	
		)
	)
--16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
SELECT HOTEN
FROM GIAOVIEN, GIANGDAY
WHERE
	GIAOVIEN.MAGV = GIANGDAY.MAGV
	AND MAMH = 'CTRR'
GROUP BY  GIAOVIEN.MAGV, HOTEN, HOCKY
HAVING COUNT(*) >= 2

--17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
SELECT HOCVIEN.*, DIEM AS 'Điểm thi CSDL sau cùng'
FROM HOCVIEN, KETQUATHI
WHERE
	HOCVIEN.MAHV = KETQUATHI.MAHV
	AND MAMH = 'CSDL'
	AND LANTHI = 
	(
		SELECT MAX(LANTHI) 
		FROM KETQUATHI 
		WHERE MAMH = 'CSDL' AND KETQUATHI.MAHV = HOCVIEN.MAHV
		GROUP BY MAHV
	)
--18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
SELECT HOCVIEN.*, DIEM AS 'Điểm thi CSDL cao nhất'
FROM HOCVIEN, KETQUATHI, MONHOC
WHERE
	HOCVIEN.MAHV = KETQUATHI.MAHV
	AND KETQUATHI.MAMH = MONHOC.MAMH
	AND TENMH = 'Co So Du Lieu'
	AND DIEM = 
	(
		SELECT MAX(DIEM) 
		FROM KETQUATHI, MONHOC
		WHERE
			KETQUATHI.MAMH = MONHOC.MAMH
			AND MAHV = HOCVIEN.MAHV
			AND TENMH = 'Co So Du Lieu'
		GROUP BY MAHV
	)
--TH4: Phần III QLGV từ câu 19 đến câu 25
--19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
SELECT MAKHOA, TENKHOA
FROM KHOA
WHERE NGTLAP = (SELECT MIN(NGTLAP) FROM KHOA)
--20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT COUNT(*) 'Số giáo viên có học hàm GS hoặc PGS'
FROM GIAOVIEN
WHERE HOCHAM IN ('GS', 'PGS')
--21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT MAKHOA, HOCVI, COUNT(*) 'Số giáo viên'
FROM GIAOVIEN
GROUP BY MAKHOA, HOCVI
ORDER BY MAKHOA
--22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT MAMH, KQUA, COUNT(*) 'Số học viên'
FROM KETQUATHI
GROUP BY MAMH, KQUA
ORDER BY MAMH
--23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít 
--nhất một môn học.
SELECT DISTINCT GIAOVIEN.MAGV, HOTEN
FROM GIAOVIEN, LOP, GIANGDAY
WHERE
	GIANGDAY.MALOP = LOP.MALOP
	AND GIANGDAY.MAGV = GIAOVIEN.MAGV
	AND GIAOVIEN.MAGV = LOP.MAGVCN
--24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
SELECT HO+' '+TEN AS 'Họ tên lớp trưởng của lớp có sỉ số cao nhất'
FROM HOCVIEN, LOP
WHERE
	HOCVIEN.MAHV = LOP.TRGLOP
	AND LOP.SISO = (SELECT MAX(SISO) FROM LOP)
--25. * Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần 
--thi).
SELECT HO + ' ' + TEN 'Họ tên trưởng lớp thi không đạt quá 3 môn'
FROM HOCVIEN, LOP, KETQUATHI
WHERE
	HOCVIEN.MAHV = LOP.TRGLOP
	AND HOCVIEN.MAHV = KETQUATHI.MAHV
	AND KQUA = 'Khong Dat'
GROUP BY TRGLOP, HO, TEN
HAVING COUNT(*) > 3
--26. Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT TOP 1 WITH TIES HOCVIEN.MAHV, (HO+' '+TEN) AS HoTen
FROM HOCVIEN, KETQUATHI
WHERE
	HOCVIEN.MAHV = KETQUATHI.MAHV
	AND DIEM >= 9
GROUP BY HOCVIEN.MAHV, HO, TEN
ORDER BY COUNT(*) DESC
--27. Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT MALOP, MAHV, HOTEN
FROM
(
	SELECT MALOP, HOCVIEN.MAHV, (HO+' '+TEN) HOTEN, COUNT(*) SoLuongDiem, RANK() OVER (PARTITION BY MALOP ORDER BY COUNT(*) DESC) AS XepHang
	FROM HOCVIEN, KETQUATHI
	WHERE
		HOCVIEN.MAHV = KETQUATHI.MAHV
		AND DIEM >= 9
	GROUP BY MALOP, HOCVIEN.MAHV, HO, TEN
) AS A
WHERE A.XepHang = 1
--28. Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
SELECT MAGV, COUNT(DISTINCT MAMH) 'Số môn học', COUNT(DISTINCT MALOP) 'Số lớp'
FROM GIANGDAY
GROUP BY MAGV
--29. Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
SELECT GD.HOCKY, GD.NAM, G.MaGV, G.HOTEN
FROM GIAOVIEN G
JOIN (
    SELECT HOCKY, NAM, MAGV, RANK() OVER (PARTITION BY HOCKY, NAM ORDER BY COUNT(*) DESC) AS XepHang
    FROM GIANGDAY
    GROUP BY HOCKY, NAM, MAGV
) AS GD ON GD.MAGV = G.MAGV
WHERE GD.XepHang = 1
ORDER BY GD.NAM, GD.HOCKY;
--30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
SELECT TOP 1 WITH TIES MONHOC.MAMH, TENMH
FROM MONHOC, KETQUATHI
WHERE
	MONHOC.MAMH = KETQUATHI.MAMH
	AND LANTHI = 1
	AND KQUA = 'Khong Dat'
GROUP BY MONHOC.MAMH, TENMH
ORDER BY COUNT(*) DESC
--31. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
SELECT DISTINCT HOCVIEN.MAHV, (HO+' '+TEN) HOTEN
FROM HOCVIEN, KETQUATHI
WHERE
	HOCVIEN.MAHV = KETQUATHI.MAHV
	AND NOT EXISTS
	(
		SELECT *
		FROM KETQUATHI
		WHERE LANTHI = 1
		AND KQUA = 'Khong Dat'
		AND MAHV = HOCVIEN.MAHV
	)
--32. * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
SELECT DISTINCT HOCVIEN.MAHV, (HO+' '+TEN) HOTEN
FROM HOCVIEN, KETQUATHI
WHERE
	HOCVIEN.MAHV = KETQUATHI.MAHV
	AND NOT EXISTS
	(
		SELECT *
		FROM KETQUATHI
		WHERE LANTHI = (SELECT MAX(LANTHI) FROM KETQUATHI WHERE MAHV = HOCVIEN.MAHV GROUP BY MAHV)
		AND KQUA = 'Khong Dat'
		AND MAHV = HOCVIEN.MAHV
	)
--33. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).
SELECT HV.MAHV, (HO + ' ' + TEN)
FROM HOCVIEN HV
WHERE NOT EXISTS (
		SELECT *
		FROM MONHOC 
		WHERE NOT EXISTS (
				SELECT *
				FROM KETQUATHI KQ, MONHOC MH, HOCVIEN HV
				WHERE KQ.MAMH = MH.MAMH AND KQ.MAHV = HV.MAHV
				AND LANTHI = 1 AND KQUA = 'Dat')
)
--34. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng).
SELECT A.MAHV, HO + ' ' + TEN HOTEN 
FROM (
	SELECT MAHV, COUNT(KQUA) SODAT
	FROM KETQUATHI KQ1
	WHERE NOT EXISTS (
		SELECT 1 
		FROM KETQUATHI KQ2
		WHERE KQ1.MAHV = KQ2.MAHV AND KQ1.MAMH = KQ2.MAMH 
		AND KQ1.LANTHI < KQ2.LANTHI) AND KQUA = 'Dat'
	GROUP BY MAHV
	INTERSECT
	SELECT MAHV, COUNT(MAMH) SOMH 
	FROM KETQUATHI 
	WHERE LANTHI = 1
	GROUP BY MAHV) A INNER JOIN HOCVIEN HV ON A.MAHV = HV.MAHV
--35. ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau 
--cùng)
SELECT A.MAHV, HO + ' ' + TEN HOTEN 
FROM (
	SELECT KQ1.MAMH, MAHV, DIEM, DIEMMAX
	FROM KETQUATHI KQ1 INNER JOIN (
		SELECT MAMH, MAX(DIEM) DIEMMAX 
		FROM KETQUATHI
		GROUP BY MAMH
	) B
	ON KQ1.MAMH = B.MAMH
	WHERE NOT EXISTS (
		SELECT 1 
		FROM KETQUATHI KQ2
		WHERE KQ1.MAHV = KQ2.MAHV AND KQ1.MAMH = KQ2.MAMH 
		AND KQ1.LANTHI < KQ2.LANTHI) AND DIEM = DIEMMAX
) A INNER JOIN HOCVIEN HV ON A.MAHV = HV.MAHV

--9. Lớp trưởng của một lớp phải là học viên của lớp đó.
--						THEM				XOA					SUA
--LOP					+					-					+(TRGLOP)
--HOCVIEN				+					+					+(MALOP)
GO
CREATE TRIGGER CHECK_LopTRG
ON LOP
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @IsValidTRGLOP BIT;

    SELECT @IsValidTRGLOP = CASE
        WHEN TRGLOP IS NULL THEN 1
        WHEN TRGLOP NOT IN (SELECT MAHV FROM HOCVIEN WHERE MALOP = INSERTED.MALOP) THEN 0
        ELSE 1
    END
    FROM INSERTED;

    IF @IsValidTRGLOP = 0
    BEGIN
        RAISERROR(N'Lớp trưởng phải là học viên của lớp đó.', 16, 1);
        ROLLBACK;
    END
END;
--10. Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”.
--				THEM			XOA			SUA
--KHOA			+				-			+(TRGKHOA)
--GIAOVIEN		-				+			+(MAKHOA)
GO
CREATE TRIGGER TRGKHOA_HOCVI
ON KHOA
FOR INSERT, UPDATE
AS 
BEGIN 
	DECLARE @MAKHOA VARCHAR(4), @TRGKHOA CHAR(4), @MAGV CHAR(4), @HOCVI VARCHAR(10)
	SELECT @TRGKHOA = TRGKHHOA, @MAKHOA = MAKHOA
	FROM inserted
	SELECT @HOCVI  = HOCVI
	FROM GIAOVIEN
	WHERE @TRGKHOA = MAGV
	IF((@HOCVI <> 'TS') OR (@HOCVI <> 'PTS'))
	BEGIN 
	PRINT 'LOI'
	ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN 
	PRINT 'OKE'
	END 
END
--15. Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này.
--				THEM			XOA				SUA
--GIANGDAY		-				+				+(MAMH,DENNGAY)
--KETQUATHI		+				-				+(MAMH)

GO
CREATE TRIGGER GIANGDAY_KETQUATHI 
ON KETQUATHI
FOR INSERT , UPDATE 
AS 
BEGIN 
	DECLARE @MAMH VARCHAR(10), @NGTHI SMALLDATETIME, @DENNGAY SMALLDATETIME
	SELECT @NGTHI = NGTHI , @MAMH = MAMH
	FROM inserted
	SELECT @DENNGAY = DENNGAY
	FROM GIANGDAY
	WHERE @MAMH = MAMH
	IF (@NGTHI<@DENNGAY)
	BEGIN
	PRINT 'LOI'
	ROLLBACK TRANSACTION
	END
	ELSE 
	BEGIN 
	PRINT 'OKE'
	END
END
--16. Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.
--					THEM			XOA				SUA
--GIANGDAY			+				-				+(MAMH,NAM,HOCKY)
GO
CREATE TRIGGER NAM_HOCKY
ON GIANGDAY
FOR INSERT,UPDATE
AS 
BEGIN 
	DECLARE @NAM SMALLDATETIME, @MAMH VARCHAR(10), @HOCKY TINYINT, @SL INT
	SELECT @SL  = COUNT(MAMH), @NAM = NAM, @HOCKY = HOCKY
	FROM inserted
	GROUP BY NAM,HOCKY
	IF (@SL>3)
	BEGIN 
	PRINT 'LOI VI BI DU MON'
	ROLLBACK TRANSACTION
	END
	ELSE 
	BEGIN
	PRINT 'OKE'
	END
END
--17. Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
--				THEM				XOA				SUA
--HOCVIEN		+					+				+(MALOP)
--LOP			+					-				+(SISO)
GO
CREATE TRIGGER HOCVIEN_LOP
ON HOCVIEN
FOR INSERT, DELETE, UPDATE
AS
BEGIN
	DECLARE @MALOP CHAR(3), @MAHV CHAR(5), @SISO TINYINT, @SL INT
	SELECT @MALOP  = MALOP, @SL = COUNT(MAHV)
	FROM inserted
	GROUP BY MALOP
	SELECT @SISO  = SISO
	FROM LOP
	WHERE @MALOP = MALOP
	IF (@SL<>@SISO)
	BEGIN 
	PRINT 'LOI DU LIEU'
	ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
	PRINT' DUNG DU LIEU  - NHAP THANH CONG'
	END
END
--18. Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng một bộ 
--không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”).

--				THEM				XOA					SUA
--DIEUKIEN		+					-					-(*)
GO
CREATE TRIGGER DIEUKIEN_MH
ON DIEUKIEN
FOR INSERT, UPDATE
AS 
BEGIN
		DECLARE @MAMH VARCHAR(10), @MAMH_TRUOC VARCHAR(10)
		SELECT @MAMH  = MAMH, @MAMH_TRUOC = MAMH_TRUOC
		FROM inserted
		IF ((@MAMH = @MAMH_TRUOC) OR(@MAMH_TRUOC = @MAMH))
		BEGIN 
		PRINT 'LOI NHAP LAI'
		END
		ELSE
		BEGIN
		PRINT 'OKE'
		END
END
--19. Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
--					THEM				XOA				SUA
--GIAOVIEN			+					-				+(HOCVI, HOCHAM, MUCLUONG, HESO)

GO
CREATE TRIGGER HOCVI_HOCHAM_HESO
ON GIAOVIEN
FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @HOCVI VARCHAR(10), @HOCHAM VARCHAR(10), @HESO NUMERIC(4,2), @MUCLUONG MONEY, @MUCLUONG2 MONEY
	SELECT @HOCVI = HOCVI, @HOCHAM = HOCHAM, @HESO = HESO, @MUCLUONG = MUCLUONG
	FROM inserted
	SELECT @MUCLUONG2 = MUCLUONG
	FROM GIAOVIEN
	WHERE @HOCVI = HOCVI AND @HOCHAM = HOCHAM AND @HESO = HESO
	IF (@MUCLUONG <> @MUCLUONG2)
	BEGIN 
	PRINT'LOI NHAP'
	END
	ELSE
	BEGIN
	PRINT 'OKE'
	END
END
--20. Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
--					THEM					XOA						SUA
--KETQUATHI			+						-						+(DIEM,NGTHI)
GO
CREATE TRIGGER LANTHI_DIEM
ON KETQUATHI
FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @MAHV CHAR(5), @MAMH VARCHAR(10), @LANTHI2 TINYINT, @DIEM NUMERIC(4,2),@DIEM2 NUMERIC(4,2), @NGTHI SMALLDATETIME, @NGTHI2 SMALLDATETIME
	SELECT @MAHV = MAHV,@MAMH = MAMH, @DIEM = DIEM, @NGTHI = NGTHI
	FROM inserted
	SELECT @NGTHI2 = NGTHI, @DIEM2 = DIEM, @LANTHI2  = LANTHI
	FROM KETQUATHI
	WHERE @MAHV = MAHV AND @MAMH = MAMH AND @LANTHI2 = LANTHI - 1 AND @NGTHI2<NGTHI
	IF (@DIEM2>=5)
	BEGIN 
		PRINT' KO DUOC THI LAI'
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN 
		PRINT 'OKE'
	END
END
--21. Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học).
--					THEM			XOA				SUA
--KETQUATHI			+				-				+(NGTHI)
GO
CREATE TRIGGER LANTHI_NGTHI
ON KETQUATHI
FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @MAHV CHAR(5), @MAMH VARCHAR(10), @LANTHI2 TINYINT,@LANTHI TINYINT,@NGTHI2 SMALLDATETIME, @NGTHI SMALLDATETIME
	SELECT	@MAHV = MAHV, @MAMH = MAMH , @NGTHI = NGTHI,@LANTHI = LANTHI
	FROM inserted
	SELECT @NGTHI2 = KQT.NGTHI
	FROM KETQUATHI AS KQT
	WHERE @MAHV = KQT.MAHV AND @MAMH = KQT.MAMH AND KQT.LANTHI > @LANTHI
	IF (@NGTHI2<@NGTHI)
	BEGIN 
		PRINT' LOI'
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN	
		PRINT 'OKE'
	END
END
--22. Học viên chỉ được thi những môn mà lớp của học viên đó đã học xong.
--					THEM				XOA				SUA
--GIANGDAY			-					+				+(NAM,DENNGAY)
--KETQUATHI			+					-				+(NGTHI)
GO
CREATE TRIGGER LOP_THI
ON KETQUATHI
FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @MAMH VARCHAR(10), @DENNAGY SMALLDATETIME, @NGTHI SMALLDATETIME
	SELECT @MAMH  = MAMH, @NGTHI = NGTHI
	FROM inserted
	SELECT @DENNAGY = DENNGAY
	FROM GIANGDAY
	WHERE @MAMH = MAMH
	IF (@NGTHI<@DENNAGY)
	BEGIN 
	PRINT'LOI'
	ROLLBACK TRANSACTION
	END
	ELSE 
	BEGIN
	PRINT 'OKE'
	END
END
--23. Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau khi học 
--xong những môn học phải học trước mới được học những môn liền sau).
GO
CREATE TRIGGER TRG_GIANGDAY_PHANCONG_GD_MH
ON GIANGDAY
FOR INSERT, UPDATE
AS
BEGIN
	IF(exists (SELECT *
				FROM inserted i join DIEUKIEN DK ON i.MAMH = DK.MAMH
				WHERE not exists (	SELECT *
									FROM GIANGDAY GD1 
									WHERE DK.MAMH_TRUOC = GD1.MAMH and i.MALOP = GD1.MALOP) ) )
	BEGIN 
		ROLLBACK TRANSACTION
		PRINT 'Phai hoc mon hoc truoc de du dieu kien phan cong mon hoc nay'
	END
END
--24. Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách
--			Them	 Xoa	 Sua
--GIANGDAY	  +		  -		  +(MAGV)
--GIAOVIEN	  -		  +		  +(MAKHOA)
--MONHOC		  -		  -		  +(MAKHOA)
GO 
CREATE TRIGGER CheckKhoaGV
	ON GIANGDAY
	FOR INSERT, UPDATE
	AS
	BEGIN
		IF EXISTS 
		(
			SELECT *
			FROM INSERTED I
			JOIN GIAOVIEN GV ON I.MAGV = GV.MAGV
			JOIN MONHOC MH ON I.MAMH = MH.MAMH
			WHERE GV.MAKHOA <> MH.MAKHOA 
		)
		BEGIN
			RAISERROR(N'Giáo viên chỉ được phân công dạy những môn thuộc Khoa giáo viên đó phụ trách.', 16, 1);
			ROLLBACK;
		END
	END
