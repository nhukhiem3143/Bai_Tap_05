# Nguyễn Như Khiêm - K225480106030 
# BÀI TẬP VỀ NHÀ 05, Môn Hệ quản trị csdl.
# SUBJECT: Trigger on mssql
## A. Trình bày lại đầu bài của đồ án PT&TKHT:
1. Mô tả bài toán của đồ án PT&TKHT, đưa ra yêu cầu của bài toán đó
2. Cơ sở dữ liệu của Đồ án PT&TKHT :
- Có database với các bảng dữ liệu cần thiết (3nf),
- Các bảng này đã có PK, FK, CK cần thiết
## B. Nội dung Bài tập 05:
1. Dựa trên cơ sở là csdl của Đồ án
2. Tìm cách bổ xung thêm 1 (hoặc vài) trường phi chuẩn (là trường tính toán đc, nhưng thêm vào thì ok hơn,ok hơn theo 1 logic nào đó, vd ok hơn về speed) => Nêu rõ logic này!
3. Viết trigger cho 1 bảng nào đó, mà có sử dụng trường phi chuẩn này, nhằm đạt được 1 vài mục tiêu nào đó. => Nêu rõ các mục tiêu 
4. Nhập dữ liệu có kiểm soát, nhằm để test sự hiệu quả của việc trigger auto run.
5. Kết luận về Trigger đã giúp gì cho đồ án của em.

# Bài làm
## A. Trình bày đầu bài Đồ án PT&TKHT
### 1. Mô tả bài toán:
- Hệ thống Quản lý sổ thu chi cá nhân cho phép người dùng:
- Quản lý các tài khoản thu chi
- Lưu lại lịch sử giao dịch, đăng nhập
- Lập kế hoạch tiết kiệm và hạn mức chi tiêu
- Nhận thông báo khi vượt hạn mức hoặc đạt mục tiêu
### 2. Các bảng dữ liệu chính:
#### 1. Bảng NguoiDung ( Thông tin người dùng )
- MaNguoiDung (PK)

![Screenshot 2025-04-23 172851](https://github.com/user-attachments/assets/e5b7f7cc-57ca-4b05-8e44-79fb8a6806c1)
- NgayTao (CK)

![Screenshot 2025-04-23 173200](https://github.com/user-attachments/assets/8f99c6e8-1fb5-4c17-ad65-f85fde178e73)

#### 2. Bảng TaiKhoan (Tài khoản thu/chi thuộc người dùng)
- MaTaiKhoan (PK)

![Screenshot 2025-04-23 173355](https://github.com/user-attachments/assets/1173e3de-5af6-4cf0-8aa0-1954f60d06c7)

- MaNguoiDung (FK)

![Screenshot 2025-04-23 173456](https://github.com/user-attachments/assets/ac429c08-d804-4ab4-84d0-52dd3b5c2bce)

- SoDu (CK)

![Screenshot 2025-04-23 173657](https://github.com/user-attachments/assets/467f42be-593b-4ca6-a6dd-afb1459658f7)

### *Các bảng còn lại tương tự đều có PK , FK, CK cần thiết cho các trường*
#### 3. Bảng GiaoDich ( Lưu lại các giao dịch thu chi)
![Screenshot 2025-04-23 173851](https://github.com/user-attachments/assets/42b2a098-3835-4a4c-97e3-8c043e48ccb4)

#### 4. Bảng DanhMuc (Phân loại các giao dịch (Thu/Chi) )
![Screenshot 2025-04-23 174206](https://github.com/user-attachments/assets/13a69688-630c-48f7-b328-a0b4c0a57226)

#### 5. Bảng HanMucChiTieu ( Đặt hạn mức chi tiêu theo danh mục )
![Screenshot 2025-04-23 174301](https://github.com/user-attachments/assets/3086874e-ae6d-4cd0-a0f9-1f49998e54a1)

#### 6. Bảng MucTieuTietKiem (Lập mục tiêu tiết kiệm )
![Screenshot 2025-04-23 174319](https://github.com/user-attachments/assets/6ab26adf-5e9f-4bb3-9123-2362b34e8ab0)

#### 7. Bảng ThongBao ( Thông báo hệ thống gửi đến người dùng)
![Screenshot 2025-04-23 174342](https://github.com/user-attachments/assets/38a47c4b-99e2-48a1-ab2f-2a1d6aa91e9d)

#### 8. Bảng LichSuDangNhap ( Ghi nhận lần đăng nhập của người dùng)
![Screenshot 2025-04-23 174413](https://github.com/user-attachments/assets/09f37e82-80ac-4a36-94b4-983970562d97)

### Biểu đồ thực thể liên kết
![Screenshot 2025-04-23 192811](https://github.com/user-attachments/assets/bd824af0-aff6-4b7d-a0db-e98d74badc61)

## B. Nội dung Bài tập 05
### 1. Trường phi chuẩn: SoDuSauGiaoDich
- Lý do thêm: Trường này có thể tính toán từ dữ liệu khác, nhưng thêm vào giúp tăng tốc độ truy xuất báo cáo lịch sử số dư theo từng giao dịch.
- Logic: Truy xuất lịch sử số dư nhanh hơn, tránh phải tính dồn nhiều lần mỗi khi truy vấn.

### 2. Trigger sử dụng trường phi chuẩn
```sql
-- Cập nhật SoDuSauGiaoDich cho các giao dịch
UPDATE gd
SET gd.SoDuSauGiaoDich = tk.SoDu
FROM GiaoDich gd
JOIN inserted i ON gd.MaGiaoDich = i.MaGiaoDich
JOIN TaiKhoan tk ON i.MaTaiKhoan = tk.MaTaiKhoan
WHERE tk.SoDu IS NOT NULL;
```
### 4. Mục tiêu của Trigger:
- Tự động cập nhật số dư sau mỗi giao dịch theo thời gian thực
- Tránh sai sót khi nhập liệu thủ công
- Giảm độ phức tạp trong truy vấn báo cáo

### 5. Nhập dữ liệu có kiểm soát
- *Nhập dữ liệu cho các bảng liên quan*
#### 5.1. Bảng NguoiDung
![Screenshot 2025-04-23 195329](https://github.com/user-attachments/assets/923ca7a6-f2ac-40e6-a288-7b12652d3f81)

#### 5.2. Bảng TaiKhoan
![Screenshot 2025-04-23 195257](https://github.com/user-attachments/assets/ab73cb99-0745-4a31-85df-f9f13f73aa57)

#### 5.3. Bảng GiaoDich
![Screenshot 2025-04-23 195738](https://github.com/user-attachments/assets/6818b770-b197-4fe5-8c77-e7aa5faea22c)

#### 5.4. Bảng DanhMuc
![Screenshot 2025-04-23 195813](https://github.com/user-attachments/assets/97a079b3-4ece-44ee-b9e8-22e1f3363b6a)

#### 5.5. Bảng HanMucChiTieu 
![Screenshot 2025-04-23 195838](https://github.com/user-attachments/assets/13907a11-084b-4175-a958-47b4d2b4e8e7)

### 6. Kết quả
- Người dùng 4 : Trong TK004 có số dư như sau :

![Screenshot 2025-04-23 200537](https://github.com/user-attachments/assets/bed78e0f-0f15-4882-a933-1c3d41bfbcdd)

- Người dùng 4 : Chi tiền ăn uống 10000

- *Trigger tự tính toán số tiền đã chi*

![Screenshot 2025-04-23 201127](https://github.com/user-attachments/assets/49ced1c5-e79e-4cea-9987-3e70532b1c43)
- *Số dư sau giao dịch còn 120000*

- Với DM002 là Chi

![Screenshot 2025-04-23 201405](https://github.com/user-attachments/assets/eba0b8fd-0559-46cc-a68b-63816575b0a4)

- Ngược lại nếu Người dùng 4 sử dụng DM001 là Thu
- *Cập nhật lại số dư*
![Screenshot 2025-04-23 201800](https://github.com/user-attachments/assets/07885ab8-c26c-4f18-ae5f-f158702fdf77)

- TK004 trong bảng TaiKhoan cũng sẽ được cập nhật

![Screenshot 2025-04-23 201952](https://github.com/user-attachments/assets/d6c4bb59-b15c-4aa4-a7c1-95dc2ff3912e)

#### *Ngoài ra trong bài còn tự động cập nhật ThongBao tự động mỗi khi có 1 giao dịch mới theo thời gian thực*
![Screenshot 2025-04-23 202150](https://github.com/user-attachments/assets/2e00789a-8170-4e14-a2f2-557b1600d89a)

### 7. Kết luận
- Trigger trg_CapNhatSoDuSauGiaoDich đã giúp
- Tự động hóa xử lý logic nghiệp vụ quan trọng
- Đảm bảo tính nhất quán giữa số dư và giao dịch
- Hỗ trợ tạo báo cáo tài chính dễ dàng và hiệu quả hơn

# THE END
