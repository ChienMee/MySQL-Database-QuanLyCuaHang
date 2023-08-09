-- DROP DATABASE qlycuahang_ps27765;
-- CREATE DATABASE qlycuahang_ps27765;
-- SHOW DATABASES;
-- USE qlycuahang_ps27765;
CREATE TABLE cuahang
(
	macuahang VARCHAR(28),
    tencuahang VARCHAR(100),
    diachi VARCHAR(255),
    sodienthoai VARCHAR(14),
    email VARCHAR(100),
    PRIMARY KEY (maCuaHang)
)
;
CREATE TABLE phieuxuathang
(
	sophieuxuat VARCHAR(28),
    thanhtien INT ,
    ngaylapphieu DATE,
    ngayxuatphieu DATE,
    macuahang VARCHAR(28),
    PRIMARY KEY (sophieuxuat),
    FOREIGN KEY (maCuaHang) REFERENCES cuahang(maCuaHang)
)
;
CREATE TABLE loaihang
(
	maloaihang VARCHAR(28),
    tenloaihang VARCHAR(100),
    PRIMARY KEY (maloaihang)
)
;
CREATE TABLE mathang
(
	mamathang VARCHAR(28),
    tenmathang VARCHAR(100),
    donvitinh VARCHAR(100),
    dongia INT,
    maloaihang VARCHAR(28),
    PRIMARY KEY (mamathang),
    FOREIGN KEY (maloaihang) REFERENCES loaihang(maloaihang)
);
CREATE TABLE phieuxuatchitiet
(
	mamathang VARCHAR(28),
    sophieuxuat VARCHAR(28),
    dongia INT,
    soluong INT,
    PRIMARY KEY (mamathang,sophieuxuat),
    FOREIGN KEY (mamathang) REFERENCES mathang(mamathang),
    FOREIGN KEY (sophieuxuat) REFERENCES phieuxuathang(sophieuxuat) 
)
;