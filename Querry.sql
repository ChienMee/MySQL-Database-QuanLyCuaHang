-- 6.1. Hiển thị tất cả mặt hàng. Danh sách sắp xếp theo đơn giá tăng dần. 
SELECT *
FROM mathang
ORDER BY dongia
;
/* 6.2. Hiển thị tất cả các mặt hàng thuộc loại hàng “Thời trang”. Thông tin gồm: mã mặt 
hàng, tên mặt hàng, đơn vị tính, đơn giá, tên loại hàng. */
SELECT mathang.mamathang,mathang.tenmathang,mathang.donvitinh,mathang.dongia,loaihang.tenloaihang
FROM mathang
JOIN loaihang ON mathang.maloaihang = loaihang.maloaihang
WHERE loaihang.tenloaihang LIKE 'thời trang'
;
/* 6.3. Thống kê số mặt hàng theo loại hàng, thông tin gồm: mã loại hàng, tên loại hàng, tổng 
số mặt hàng. Danh sách sắp xếp theo tổng số mặt hàng giảm dần. */
SELECT COUNT(mathang.mamathang) TongSoMaHang,loaihang.maloaihang,loaihang.tenloaihang
FROM mathang
JOIN loaihang ON mathang.maloaihang = loaihang.maloaihang
GROUP BY mathang.maloaihang
;
-- 6.4. Liệt kê số phiếu xuất, ngày xuất hàng, mã cửa hàng, tên mặt hàng, số lượng, đơn giá, thành tiền.
SELECT pxh.sophieuxuat,pxh.ngayxuatphieu,cuahang.macuahang,cuahang.tencuahang,phieuxuatchitiet.soluong,phieuxuatchitiet.dongia,pxh.thanhtien
FROM phieuxuathang pxh
JOIN cuahang ON pxh.macuahang = cuahang.macuahang
JOIN phieuxuatchitiet ON pxh.sophieuxuat = phieuxuatchitiet.sophieuxuat
;
-- 6.5. Thống kế tổng số lần xuất hàng theo từng tháng trong năm 2021, thông tin gồm: tháng/năm, số lần xuất hàng.
SELECT MONTH(phieuxuathang.ngayxuatphieu) AS "tháng",pxct.sophieuxuat,COUNT(pxct.sophieuxuat) AS "số lần xuất hàng"
FROM phieuxuatchitiet pxct
JOIN phieuxuathang ON pxct.sophieuxuat = phieuxuathang.sophieuxuat
WHERE YEAR(phieuxuathang.ngayxuatphieu) = 2021
GROUP BY MONTH(phieuxuathang.ngayxuatphieu),pxct.sophieuxuat
;
-- 6.6. Liệt kê 5 mặt hàng có số lượng xuất kho nhiều nhất.
SELECT pxct.mamathang,mh.tenmathang tenmathang,SUM(pxct.soluong) TongSoLuong
FROM phieuxuatchitiet pxct
JOIN mathang mh ON pxct.mamathang = mh.mamathang
GROUP BY pxct.mamathang
ORDER BY TongSoLuong DESC
LIMIT 5
;
-- 6.7. Thống kê số hàng nhập về cửa hàng “Chi nhánh quận 5”, thông tin hiển thị: Tên cửa hàng, số lần nhập hàng.
/*cách 1: ta có thể hiểu do câu này bị thiếu dữ liệu để truy vấn do nếu muốn truy vấn số lần nhập hàng thì phải có bảng nhập hàng 
1. có 2 khóa ngoại đó là 
- mã cửa hàng liên kết đến bảng cửa hàng 
- mã mặt hàng liên kết đến bảng mặt hàng
2. bảng nhập hàng bao gồm các thuộc tính:
- mã đơn hàng(khóa chính),
- ngày nhập hàng,
- số lượng hàng nhập,
- mã mặt hàng(khóa ngoại liên kết đến bảng mặt hàng)
- mã cửa hàng(khóa ngoại liên kết đến bảng của hàng)
3.kết luận:
- do trong lúc thiết kế CSDL theo yêu cầu ASM1 không có bảng trên nên không thể truy xuất các thông tin trên*/
-- cách 2 sô lượng xuất hàng là số lượng hàng nhập vậy phiếu xuất hàng chính là phiếu nhập hàng
SELECT cuahang.macuahang,cuahang.tencuahang,COUNT(phieuxuathang.macuahang) solannhaphang
FROM cuahang
JOIN phieuxuathang ON cuahang.macuahang = phieuxuathang.macuahang
WHERE cuahang.diachi LIKE 'Quận 5'
GROUP BY cuahang.macuahang,cuahang.tencuahang
;
-- 6.8. Thống kê tổng tiền hàng xuất kho theo ngày, thông tin hiển thị: Ngày xuất hàng, tổng thành tiền.
SELECT pxh.sophieuxuat,pxh.ngayxuatphieu,SUM(pxh.thanhtien) tongtien
FROM phieuxuathang pxh
GROUP BY pxh.sophieuxuat
;
-- 6.9. Cập nhật ngày xuất hàng là ngày hiện hành cho các phiếu xuất chưa có ngày xuất 
SELECT *
FROM phieuxuathang 
WHERE ngayxuatphieu IS NULL
;
SET @@sql_safe_updates = OFF;
UPDATE phieuxuathang
SET phieuxuathang.ngayxuatphieu = CURDATE()
WHERE phieuxuathang.ngayxuatphieu IS NULL
;
SET @@sql_safe_updates = ON;
SELECT *
FROM phieuxuathang 
WHERE ngayxuatphieu = CURDATE()
;
-- 6.10. Cập nhật đơn giá của “Đồng phục học sinh” giảm 10% trên đơn giá hiện tại.
SELECT *
FROM mathang
WHERE tenmathang LIKE 'đồng phục học sinh'
;
SET @@sql_safe_updates = OFF;
UPDATE mathang
SET dongia = dongia * 0.9
WHERE tenmathang = 'đồng phục học sinh'
;
SET @@sql_safe_updates = ON;
-- 6.11. Thực hiện xóa các cửa hàng chưa có thông tin xuất hàng.
SELECT *
FROM cuahang
;
SET @@sql_safe_updates = OFF;
DELETE FROM cuahang
WHERE macuahang NOT IN(
	SELECT macuahang
    FROM phieuxuathang
)
;
SET @@sql_safe_updates = ON;
-- 6.12. Liệt kê danh sách các mặt hàng có số lượng xuất hàng thấp nhất: Mã hàng, tên hàng, tổng số lượng xuất.
SELECT pxct.mamathang,SUM(pxct.soluong) soluongxuat
FROM phieuxuatchitiet pxct
GROUP BY pxct.mamathang
;
SELECT MIN(soluongxuat) MINSLXuat
FROM(
	SELECT pxct.mamathang,SUM(pxct.soluong) soluongxuat
	FROM phieuxuatchitiet pxct
	GROUP BY pxct.mamathang
) soluongxuatnhonhat
;
SELECT mathang.mamathang,mathang.tenmathang,SUM(pxct.soluong) tongsoluongxuat
FROM mathang
JOIN phieuxuatchitiet pxct ON mathang.mamathang = pxct.mamathang
GROUP BY mathang.mamathang,mathang.tenmathang
HAVING tongsoluongxuat = (
SELECT MIN(soluongxuat) MINSLXuat
FROM(
	SELECT pxct.mamathang,SUM(pxct.soluong) soluongxuat
	FROM phieuxuatchitiet pxct
	GROUP BY pxct.mamathang
) soluongxuatnhonhat
)
;
-- 6.13. Liệt kê những mặt hàng chưa từng xuất cho các cửa hàng, thông tin gồm: Mã mặt hàng, tên mặt hàng, tên loại hàng.
SELECT mathang.*,pxct.sophieuxuat
FROM mathang
LEFT JOIN phieuxuatchitiet pxct ON mathang.mamathang = pxct.mamathang
; -- kiểm tra xem mặt hàng nào chưa từng xuất hàng lần nào
SELECT mathang.mamathang,mathang.tenmathang,loaihang.tenloaihang
FROM mathang
LEFT JOIN phieuxuatchitiet pxct ON mathang.mamathang = pxct.mamathang
JOIN loaihang ON mathang.maloaihang = loaihang.maloaihang
WHERE pxct.sophieuxuat IS NULL
; -- xuất ra mặt hàng chưa từng xuất hàng lần nào cho các cửa hàng