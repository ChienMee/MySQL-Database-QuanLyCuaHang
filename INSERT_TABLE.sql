INSERT INTO qlycuahang_ps27765.cuahang (macuahang,tenCuahang,diachi,sodienthoai,email)
VALUES 
("CH001","CH1","Quận 1","123456780","ahyonhaseyo@gmail.com"),
("CH002","CH2","Quận 3","123456781",""),
("CH003","CH3","Quận 3","123456782",""),
("CH004","CH4","Quận 10","123456783",""),
("CH005","CH5","Quận 5","123456784",""),
("CH006","CH6","Quận 1","1234567811","supermar@mail.com")
;
INSERT INTO qlycuahang_ps27765.phieuxuathang (sophieuxuat,ngaylapphieu,ngayxuatphieu,macuahang)
VALUES
("PX001","2021-01-01","2021-01-02","CH001"),
("PX002","2021-04-11","2021-04-12","CH005"),
("PX003","2021-05-01","2021-05-03","CH003"),
("PX004","2021-07-02","2021-07-03","CH004"),
("PX005","2022-07-02","2022-07-04","CH001"),
("PX006","2022-08-09","2022-08-10","CH002"),
("PX007","2022-08-11","2023-08-12","CH004"),
("PX008","2022-09-14","2023-09-15","CH004"),
("PX009","2022-10-01","2023-10-02","CH005"),
("PX010","2022-10-01","2023-10-02","CH005"),
("PX011","2023-02-04",NULL,"CH001"),
("PX012","2023-03-01",NULL,"CH004")
;
INSERT INTO qlycuahang_ps27765.loaihang (maloaihang,tenloaihang)
VALUES
("LH001","thời trang"),
("LH002","đồ gia dụng"),
("LH003","thiết bị điện tử"),
("LH004","sản phẩm y tế"),
("LH005","thực phẩm")
;
INSERT INTO qlycuahang_ps27765.mathang (mamathang,tenmathang,donvitinh,dongia,maloaihang)
VALUES
("MH001","Áo ADASH","chiếc",20000,"LH001"),
("MH002","Quần Nice","chiếc",24000,"LH001"),
("MH003","Ifall","chiếc",220000,"LH003"),
("MH004","Xamsunderland Void S20 Ultimate","chiếc",225000,"LH003"),
("MH005","WiWi","chiếc",200000,"LH003"),
("MH006","XiaoU U11","chiếc",244000,"LH003"),
("MH007","Dopamine","hộp",20000,"LH004"),
("MH008","Bánh 3,14zza","cái",29000,"LH005"),
("MH009","nón BalenciaGAS","cái",22000,"LH001"),
("MH010","Jumpo Vape","cái",20000,"LH003"),
("MH011","miếng dán hạ hỏa Sasuke","hộp",20000,"LH004"),
("MH012","bộ nồi Inox Moon House","bộ",42220000,"LH002"),
("MH014","chổi quét nhà Moon House","cây",220000,"LH002"),
("MH015","Bộ dụng cụ làm bếp Tutu Nana","bộ",20000,"LH002"),
("MH016","đồng phục học sinh","chiếc",900200,"LH001")
;
INSERT INTO qlycuahang_ps27765.phieuxuatchitiet(sophieuxuat,mamathang,dongia,soluong)
VALUES
("PX001","MH001",20000,1),
("PX001","MH002",24000,1),
("PX002","MH003",220000,5),
("PX002","MH004",225000,1),
("PX003","MH005",225000,2),
("PX003","MH002",24000,1),
("PX004","MH007",20000,8),
("PX005","MH015",20000,1),
("PX006","MH014",220000,1),
("PX007","MH009",22000,2),
("PX008","MH011",20000,4)
-- cần thêm vào phiếu xuất từ 9 cho đến 12
;
SET @@sql_safe_updates = OFF; -- tắt trạng thái sql_safe_update
UPDATE phieuxuathang
SET thanhtien = (
	SELECT SUM(dongia * soluong)
    FROM phieuxuatchitiet
    WHERE sophieuxuat = phieuxuathang.sophieuxuat
)
; -- câu lệnh dùng để cập nhật giá trị của thành tiền bằng với giá trị của số lượng * đơn giá
SET @@sql_safe_updates = ON; -- bật trạng thái sql_safe_update
SELECT * FROM information_schema.tables WHERE table_schema = 'qlycuahang_ps27765' AND table_type = 'BASE TABLE';