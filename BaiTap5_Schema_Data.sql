USE [master]
GO
/****** Object:  Database [QL_SoThuChi_CaNhan]    Script Date: 23/04/2025 9:45:50 CH ******/
CREATE DATABASE [QL_SoThuChi_CaNhan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_SoThuChi_CaNhan', FILENAME = N'E:\Do_an_PTTKHT\QL_SoThuChi_CaNhan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QL_SoThuChi_CaNhan_log', FILENAME = N'E:\Do_an_PTTKHT\QL_SoThuChi_CaNhan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_SoThuChi_CaNhan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET RECOVERY FULL 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET  MULTI_USER 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QL_SoThuChi_CaNhan', N'ON'
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET QUERY_STORE = ON
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QL_SoThuChi_CaNhan]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 23/04/2025 9:45:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [varchar](13) NOT NULL,
	[LoaiDanhMuc] [nvarchar](50) NOT NULL,
	[TenDanhMuc] [nvarchar](100) NULL,
 CONSTRAINT [PK__DanhMuc__B3750887C2CFE630] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoDich]    Script Date: 23/04/2025 9:45:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoDich](
	[MaGiaoDich] [varchar](13) NOT NULL,
	[MaNguoiDung] [varchar](13) NOT NULL,
	[MaTaiKhoan] [varchar](13) NOT NULL,
	[MaDanhMuc] [varchar](13) NOT NULL,
	[SoTien] [float] NOT NULL,
	[NgayGiaoDich] [datetime] NOT NULL,
	[GhiChu] [nvarchar](255) NULL,
	[SoDuSauGiaoDich] [float] NULL,
 CONSTRAINT [PK__GiaoDich__0A2A24EB24D8A131] PRIMARY KEY CLUSTERED 
(
	[MaGiaoDich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HanMucChiTieu]    Script Date: 23/04/2025 9:45:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HanMucChiTieu](
	[MaHanMuc] [varchar](13) NOT NULL,
	[MaNguoiDung] [varchar](13) NOT NULL,
	[MaDanhMuc] [varchar](13) NOT NULL,
	[SoTienToiDa] [float] NOT NULL,
	[NgayApDung] [date] NULL,
 CONSTRAINT [PK__HanMucCh__87381ADD873833BC] PRIMARY KEY CLUSTERED 
(
	[MaHanMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuDangNhap]    Script Date: 23/04/2025 9:45:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuDangNhap](
	[MaLichSu] [varchar](13) NOT NULL,
	[MaNguoiDung] [varchar](13) NOT NULL,
	[ThoiGian] [datetime] NULL,
	[ThietBi_Login] [nvarchar](50) NULL,
 CONSTRAINT [PK__LichSuDa__C443222AE302D6D1] PRIMARY KEY CLUSTERED 
(
	[MaLichSu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MucTieuTietKiem]    Script Date: 23/04/2025 9:45:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MucTieuTietKiem](
	[MaMucTieu] [varchar](13) NOT NULL,
	[MaNguoiDung] [varchar](13) NOT NULL,
	[TenMucTieu] [nvarchar](100) NOT NULL,
	[SoTienMucTieu] [float] NOT NULL,
	[SoTienDaTietKiem] [float] NOT NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
 CONSTRAINT [PK__MucTieuT__E587A329BC4EEFAB] PRIMARY KEY CLUSTERED 
(
	[MaMucTieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 23/04/2025 9:45:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [varchar](13) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[MatKhau] [nvarchar](25) NULL,
	[SoDienThoai] [int] NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK__NguoiDun__C539D762B1BCD6B8] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 23/04/2025 9:45:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [varchar](13) NOT NULL,
	[MaNguoiDung] [varchar](13) NOT NULL,
	[TenTaiKhoan] [nvarchar](100) NULL,
	[LoaiTaiKhoan] [nvarchar](50) NULL,
	[SoDu] [float] NULL,
 CONSTRAINT [PK__TaiKhoan__AD7C652942115124] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongBao]    Script Date: 23/04/2025 9:45:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao](
	[MaThongBao] [varchar](40) NOT NULL,
	[MaNguoiDung] [varchar](13) NOT NULL,
	[NoiDung] [nvarchar](255) NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK__ThongBao__04DEB54E7EFB3DD0] PRIMARY KEY CLUSTERED 
(
	[MaThongBao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [LoaiDanhMuc], [TenDanhMuc]) VALUES (N'DM001', N'Thu', N'Lương')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [LoaiDanhMuc], [TenDanhMuc]) VALUES (N'DM002', N'Chi', N'Ăn uống')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [LoaiDanhMuc], [TenDanhMuc]) VALUES (N'DM003', N'Thu', N'Thu nhập khác')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [LoaiDanhMuc], [TenDanhMuc]) VALUES (N'DM004', N'Chi', N'Giải trí')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [LoaiDanhMuc], [TenDanhMuc]) VALUES (N'DM005', N'Chi', N'Học tập')
GO
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD001', N'ND001', N'TK001', N'DM002', 10000, CAST(N'2025-04-22T15:38:31.453' AS DateTime), N'Cà phê', 91000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD002', N'ND002', N'TK002', N'DM001', 10000, CAST(N'2025-04-22T15:38:31.453' AS DateTime), N'Lương tháng 4', 210000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD003', N'ND003', N'TK003', N'DM004', 10000, CAST(N'2025-04-22T15:38:31.453' AS DateTime), N'Xem phim', 290000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD004', N'ND004', N'TK004', N'DM005', 20000, CAST(N'2025-04-22T15:38:31.453' AS DateTime), NULL, 130000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD005', N'ND005', N'TK005', N'DM003', 30000, CAST(N'2025-04-22T15:38:31.453' AS DateTime), N'Thu nhập phụ', 530000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD006', N'ND001', N'TK001', N'DM002', 11000, CAST(N'2025-04-22T16:20:42.067' AS DateTime), N'xem', 80001)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD007', N'ND001', N'TK001', N'DM001', 2, CAST(N'2025-04-22T16:49:44.037' AS DateTime), NULL, 91001)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD008', N'ND002', N'TK002', N'DM002', 50000, CAST(N'2025-04-22T19:14:42.647' AS DateTime), NULL, 160000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD009', N'ND001', N'TK006', N'DM004', 21000, CAST(N'2025-04-22T19:16:38.450' AS DateTime), N'CHƠI BỜI', 58000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD010', N'ND001', N'TK006', N'DM003', 50000, CAST(N'2025-04-22T19:17:58.703' AS DateTime), N'kêu gọi từ thiện', 158000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD011', N'ND001', N'TK006', N'DM005', 10000, CAST(N'2025-04-23T17:07:48.967' AS DateTime), NULL, 125777)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD012', N'ND005', N'TK005', N'DM004', 10000, CAST(N'2025-04-23T17:22:45.507' AS DateTime), NULL, 520000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD013', N'ND005', N'TK005', N'DM005', 10, CAST(N'2025-04-23T17:25:57.480' AS DateTime), NULL, 519990)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD014', N'ND004', N'TK004', N'DM002', 10000, CAST(N'2025-04-23T20:09:25.033' AS DateTime), N'Ăn uống', 120000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD015', N'ND004', N'TK004', N'DM001', 40000, CAST(N'2025-04-23T20:17:51.073' AS DateTime), NULL, 160000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD016', N'ND004', N'TK004', N'DM002', 1000, CAST(N'2025-04-23T00:00:00.000' AS DateTime), NULL, 159000)
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [MaNguoiDung], [MaTaiKhoan], [MaDanhMuc], [SoTien], [NgayGiaoDich], [GhiChu], [SoDuSauGiaoDich]) VALUES (N'GD018', N'ND004', N'TK004', N'DM002', 10000, CAST(N'2025-04-23T00:00:00.000' AS DateTime), NULL, 149000)
GO
INSERT [dbo].[HanMucChiTieu] ([MaHanMuc], [MaNguoiDung], [MaDanhMuc], [SoTienToiDa], [NgayApDung]) VALUES (N'HM001', N'ND001', N'DM002', 10000, CAST(N'2025-04-01' AS Date))
INSERT [dbo].[HanMucChiTieu] ([MaHanMuc], [MaNguoiDung], [MaDanhMuc], [SoTienToiDa], [NgayApDung]) VALUES (N'HM002', N'ND002', N'DM004', 20000, CAST(N'2025-04-01' AS Date))
INSERT [dbo].[HanMucChiTieu] ([MaHanMuc], [MaNguoiDung], [MaDanhMuc], [SoTienToiDa], [NgayApDung]) VALUES (N'HM003', N'ND003', N'DM005', 50000, CAST(N'2025-04-01' AS Date))
INSERT [dbo].[HanMucChiTieu] ([MaHanMuc], [MaNguoiDung], [MaDanhMuc], [SoTienToiDa], [NgayApDung]) VALUES (N'HM004', N'ND004', N'DM002', 75000, CAST(N'2025-04-01' AS Date))
INSERT [dbo].[HanMucChiTieu] ([MaHanMuc], [MaNguoiDung], [MaDanhMuc], [SoTienToiDa], [NgayApDung]) VALUES (N'HM005', N'ND001', N'DM005', 10000, CAST(N'2025-04-01' AS Date))
INSERT [dbo].[HanMucChiTieu] ([MaHanMuc], [MaNguoiDung], [MaDanhMuc], [SoTienToiDa], [NgayApDung]) VALUES (N'HM006', N'ND005', N'DM005', 100, CAST(N'2025-03-01' AS Date))
GO
INSERT [dbo].[LichSuDangNhap] ([MaLichSu], [MaNguoiDung], [ThoiGian], [ThietBi_Login]) VALUES (N'LS001', N'ND001', CAST(N'2025-04-22T15:38:31.453' AS DateTime), N'Chrome - Windows')
INSERT [dbo].[LichSuDangNhap] ([MaLichSu], [MaNguoiDung], [ThoiGian], [ThietBi_Login]) VALUES (N'LS002', N'ND002', CAST(N'2025-04-22T15:38:31.453' AS DateTime), N'Edge - Windows')
INSERT [dbo].[LichSuDangNhap] ([MaLichSu], [MaNguoiDung], [ThoiGian], [ThietBi_Login]) VALUES (N'LS003', N'ND003', CAST(N'2025-04-22T15:38:31.453' AS DateTime), N'Safari - iOS')
INSERT [dbo].[LichSuDangNhap] ([MaLichSu], [MaNguoiDung], [ThoiGian], [ThietBi_Login]) VALUES (N'LS004', N'ND004', CAST(N'2025-04-22T15:38:31.453' AS DateTime), N'Firefox - Linux')
INSERT [dbo].[LichSuDangNhap] ([MaLichSu], [MaNguoiDung], [ThoiGian], [ThietBi_Login]) VALUES (N'LS005', N'ND005', CAST(N'2025-04-22T15:38:31.453' AS DateTime), N'Chrome - Android')
GO
INSERT [dbo].[MucTieuTietKiem] ([MaMucTieu], [MaNguoiDung], [TenMucTieu], [SoTienMucTieu], [SoTienDaTietKiem], [NgayBatDau], [NgayKetThuc]) VALUES (N'MT001', N'ND001', N'Mua Laptop', 2000, 5000, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date))
INSERT [dbo].[MucTieuTietKiem] ([MaMucTieu], [MaNguoiDung], [TenMucTieu], [SoTienMucTieu], [SoTienDaTietKiem], [NgayBatDau], [NgayKetThuc]) VALUES (N'MT002', N'ND002', N'Du lịch', 1500, 3000, CAST(N'2023-02-01' AS Date), CAST(N'2024-10-01' AS Date))
INSERT [dbo].[MucTieuTietKiem] ([MaMucTieu], [MaNguoiDung], [TenMucTieu], [SoTienMucTieu], [SoTienDaTietKiem], [NgayBatDau], [NgayKetThuc]) VALUES (N'MT003', N'ND003', N'Mua xe máy', 3000, 1000, CAST(N'2023-03-01' AS Date), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[MucTieuTietKiem] ([MaMucTieu], [MaNguoiDung], [TenMucTieu], [SoTienMucTieu], [SoTienDaTietKiem], [NgayBatDau], [NgayKetThuc]) VALUES (N'MT004', N'ND004', N'Cưới vợ', 5000, 2000, CAST(N'2022-04-01' AS Date), CAST(N'2024-04-01' AS Date))
INSERT [dbo].[MucTieuTietKiem] ([MaMucTieu], [MaNguoiDung], [TenMucTieu], [SoTienMucTieu], [SoTienDaTietKiem], [NgayBatDau], [NgayKetThuc]) VALUES (N'MT005', N'ND005', N'Học tiếng Anh', 1000, 2500, CAST(N'2023-05-01' AS Date), CAST(N'2024-11-01' AS Date))
GO
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [Email], [MatKhau], [SoDienThoai], [NgayTao]) VALUES (N'ND001', N'Nguyễn Văn A', N'a@gmail.com', N'matkhau1', 91234567, CAST(N'2025-04-22T15:38:31.453' AS DateTime))
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [Email], [MatKhau], [SoDienThoai], [NgayTao]) VALUES (N'ND002', N'Trần Thị B', N'b@gmail.com', N'matkhau2', 82345678, CAST(N'2025-04-22T15:38:31.453' AS DateTime))
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [Email], [MatKhau], [SoDienThoai], [NgayTao]) VALUES (N'ND003', N'Lê Văn C', N'c@gmail.com', N'matkhau3', 73456789, CAST(N'2025-04-22T15:38:31.453' AS DateTime))
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [Email], [MatKhau], [SoDienThoai], [NgayTao]) VALUES (N'ND004', N'Phạm Thị D', N'd@gmail.com', N'matkhau4', 64567890, CAST(N'2025-04-22T15:38:31.453' AS DateTime))
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [Email], [MatKhau], [SoDienThoai], [NgayTao]) VALUES (N'ND005', N'Vũ Văn E', N'e@gmail.com', N'matkhau5', 55678901, CAST(N'2025-04-22T15:38:31.453' AS DateTime))
GO
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MaNguoiDung], [TenTaiKhoan], [LoaiTaiKhoan], [SoDu]) VALUES (N'TK001', N'ND001', N'Tài khoản chính', N'Tiền mặt', 80001)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MaNguoiDung], [TenTaiKhoan], [LoaiTaiKhoan], [SoDu]) VALUES (N'TK002', N'ND002', N'Tài khoản ngân hàng', N'Chuyển khoản', 160000)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MaNguoiDung], [TenTaiKhoan], [LoaiTaiKhoan], [SoDu]) VALUES (N'TK003', N'ND003', N'Ví Momo', N'Ví điện tử', 290000)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MaNguoiDung], [TenTaiKhoan], [LoaiTaiKhoan], [SoDu]) VALUES (N'TK004', N'ND004', N'Ví ZaloPay', N'Ví điện tử', 149000)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MaNguoiDung], [TenTaiKhoan], [LoaiTaiKhoan], [SoDu]) VALUES (N'TK005', N'ND005', N'Tài khoản phụ', N'Tiền mặt', 519990)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MaNguoiDung], [TenTaiKhoan], [LoaiTaiKhoan], [SoDu]) VALUES (N'TK006', N'ND001', N'MB Bank', N'giải trí', 125777)
GO
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'4F70D152-16E0-409F-A830-5B161FE367A8', N'ND004', N'Chi tiêu vượt hạn mức cho danh mục này. Vui lòng kiểm tra lại.', CAST(N'2025-04-23T21:29:15.533' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'B27BF18E-F50C-4489-A1A2-AB316FEF9D2F', N'ND004', N'Chi tiêu vượt hạn mức cho danh mục này. Vui lòng kiểm tra lại.', CAST(N'2025-04-23T21:30:12.813' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'TB001', N'ND001', N'Hạn mức sắp hết!', CAST(N'2025-04-22T15:38:31.453' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'TB002', N'ND002', N'Đã nhận lương', CAST(N'2025-04-22T15:38:31.453' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'TB003', N'ND003', N'Thống kê tuần đã sẵn sàng', CAST(N'2025-04-22T15:38:31.453' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'TB004', N'ND004', N'Bạn đã chi tiêu quá hạn mức', CAST(N'2025-04-22T15:38:31.453' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'TB005', N'ND005', N'Đặt mục tiêu tiết kiệm mới', CAST(N'2025-04-22T15:38:31.453' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'TB006', N'ND005', N'Giao dịch mới: Giải trí', CAST(N'2025-04-23T17:22:45.520' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'TB007', N'ND005', N'Giao dịch mới: Học tập', CAST(N'2025-04-23T17:25:57.480' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'TB008', N'ND004', N'Giao dịch mới: Ăn uống', CAST(N'2025-04-23T20:09:25.057' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'TB009', N'ND004', N'Giao dịch mới: Lương', CAST(N'2025-04-23T20:17:51.090' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'TB010', N'ND004', N'Giao dịch mới: Ăn uống', CAST(N'2025-04-23T21:12:26.973' AS DateTime))
INSERT [dbo].[ThongBao] ([MaThongBao], [MaNguoiDung], [NoiDung], [NgayTao]) VALUES (N'TB013', N'ND004', N'Giao dịch mới: Ăn uống', CAST(N'2025-04-23T21:37:01.713' AS DateTime))
GO
/****** Object:  Index [UQ__NguoiDun__0389B7BDE640E676]    Script Date: 23/04/2025 9:45:50 CH ******/
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [UQ__NguoiDun__0389B7BDE640E676] UNIQUE NONCLUSTERED 
(
	[SoDienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NguoiDun__A9D1053488737F94]    Script Date: 23/04/2025 9:45:50 CH ******/
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [UQ__NguoiDun__A9D1053488737F94] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GiaoDich] ADD  CONSTRAINT [DF__GiaoDich__NgayGi__4222D4EF]  DEFAULT (getdate()) FOR [NgayGiaoDich]
GO
ALTER TABLE [dbo].[LichSuDangNhap] ADD  CONSTRAINT [DF__LichSuDan__ThoiG__4BAC3F29]  DEFAULT (getdate()) FOR [ThoiGian]
GO
ALTER TABLE [dbo].[MucTieuTietKiem] ADD  CONSTRAINT [DF__MucTieuTi__SoTie__534D60F1]  DEFAULT ((0)) FOR [SoTienDaTietKiem]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF__NguoiDung__NgayT__398D8EEE]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [DF__TaiKhoan__SoDu__3C69FB99]  DEFAULT ((0)) FOR [SoDu]
GO
ALTER TABLE [dbo].[ThongBao] ADD  CONSTRAINT [DF__ThongBao__NgayTa__4F7CD00D]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[GiaoDich]  WITH CHECK ADD  CONSTRAINT [FK__GiaoDich__MaDanh] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GiaoDich] CHECK CONSTRAINT [FK__GiaoDich__MaDanh]
GO
ALTER TABLE [dbo].[GiaoDich]  WITH CHECK ADD  CONSTRAINT [FK__GiaoDich__MaNguoidung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GiaoDich] CHECK CONSTRAINT [FK__GiaoDich__MaNguoidung]
GO
ALTER TABLE [dbo].[GiaoDich]  WITH CHECK ADD  CONSTRAINT [FK__GiaoDich__MaTK] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[GiaoDich] CHECK CONSTRAINT [FK__GiaoDich__MaTK]
GO
ALTER TABLE [dbo].[HanMucChiTieu]  WITH CHECK ADD  CONSTRAINT [FK__HanMucChi__MaDanh] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HanMucChiTieu] CHECK CONSTRAINT [FK__HanMucChi__MaDanh]
GO
ALTER TABLE [dbo].[HanMucChiTieu]  WITH CHECK ADD  CONSTRAINT [FK__HanMucChi__MaNguoidung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HanMucChiTieu] CHECK CONSTRAINT [FK__HanMucChi__MaNguoidung]
GO
ALTER TABLE [dbo].[LichSuDangNhap]  WITH CHECK ADD  CONSTRAINT [FK__LichSuDan__MaNguoidung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LichSuDangNhap] CHECK CONSTRAINT [FK__LichSuDan__MaNguoidung]
GO
ALTER TABLE [dbo].[MucTieuTietKiem]  WITH CHECK ADD  CONSTRAINT [FK_MucTieuTietKiem_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MucTieuTietKiem] CHECK CONSTRAINT [FK_MucTieuTietKiem_NguoiDung]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK__TaiKhoan__MaNguoidung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK__TaiKhoan__MaNguoidung]
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD  CONSTRAINT [FK__ThongBao__MaNguoidung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ThongBao] CHECK CONSTRAINT [FK__ThongBao__MaNguoidung]
GO
ALTER TABLE [dbo].[GiaoDich]  WITH CHECK ADD  CONSTRAINT [CK_GiaoDich_ngayGD] CHECK  (([NgayGiaoDich]>='2000-01-01 00:00:00' AND [NgayGiaoDich]<=getdate()))
GO
ALTER TABLE [dbo].[GiaoDich] CHECK CONSTRAINT [CK_GiaoDich_ngayGD]
GO
ALTER TABLE [dbo].[HanMucChiTieu]  WITH CHECK ADD  CONSTRAINT [CK_HanMucChiTieu_NgayApdung] CHECK  (([NgayApDung]>='2000-01-01' AND [NgayApDung]<=getdate()))
GO
ALTER TABLE [dbo].[HanMucChiTieu] CHECK CONSTRAINT [CK_HanMucChiTieu_NgayApdung]
GO
ALTER TABLE [dbo].[LichSuDangNhap]  WITH CHECK ADD  CONSTRAINT [CK_LichSuDangNhap_TG] CHECK  (([ThoiGian]>='2000-01-01 00:00:00' AND [ThoiGian]<=getdate()))
GO
ALTER TABLE [dbo].[LichSuDangNhap] CHECK CONSTRAINT [CK_LichSuDangNhap_TG]
GO
ALTER TABLE [dbo].[MucTieuTietKiem]  WITH CHECK ADD  CONSTRAINT [CK_MucTieuTietKiem_NgayBD] CHECK  (([NgayBatDau]>='20000101' AND [NgayBatDau]<=getdate()))
GO
ALTER TABLE [dbo].[MucTieuTietKiem] CHECK CONSTRAINT [CK_MucTieuTietKiem_NgayBD]
GO
ALTER TABLE [dbo].[MucTieuTietKiem]  WITH CHECK ADD  CONSTRAINT [CK_MucTieuTietKiem_NgayKT] CHECK  (([NgayKetThuc]>='20000101' AND [NgayKetThuc]<=getdate()))
GO
ALTER TABLE [dbo].[MucTieuTietKiem] CHECK CONSTRAINT [CK_MucTieuTietKiem_NgayKT]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [CK_NguoiDung_NgayTao] CHECK  (([NgayTao]>='2000-01-01 00:00:00' AND [NgayTao]<=getdate()))
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [CK_NguoiDung_NgayTao]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [CK_TaiKhoan_soDu] CHECK  (([SoDu]>=(0)))
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [CK_TaiKhoan_soDu]
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD  CONSTRAINT [CK_ThongBao_NgayTao] CHECK  (([NgayTao]>='2000-01-01 00:00:00' AND [NgayTao]<=getdate()))
GO
ALTER TABLE [dbo].[ThongBao] CHECK CONSTRAINT [CK_ThongBao_NgayTao]
GO
/****** Object:  Trigger [dbo].[trg_CapNhatSoDuSauGiaoDich]    Script Date: 23/04/2025 9:45:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_CapNhatSoDuSauGiaoDich]
ON [dbo].[GiaoDich]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra nếu giao dịch vượt quá hạn mức
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN HanMucChiTieu hmc ON i.MaNguoiDung = hmc.MaNguoiDung 
                               AND i.MaDanhMuc = hmc.MaDanhMuc
        WHERE i.SoTien > hmc.SoTienToiDa
    )
    BEGIN
        -- Ghi thông báo
        INSERT INTO ThongBao (MaThongBao, MaNguoiDung, NoiDung, NgayTao)
        SELECT 
            NEWID(), 
            i.MaNguoiDung,
            N'Giao dịch vượt quá hạn mức chi tiêu cho danh mục: ' + i.MaDanhMuc,
            GETDATE()
        FROM inserted i
        JOIN HanMucChiTieu hmc ON i.MaNguoiDung = hmc.MaNguoiDung 
                               AND i.MaDanhMuc = hmc.MaDanhMuc
        WHERE i.SoTien > hmc.SoTienToiDa;

        -- Huỷ giao dịch
        RAISERROR(N'Giao dịch vượt quá hạn mức chi tiêu!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Cập nhật SoDu trong bảng TaiKhoan
    UPDATE tk
    SET tk.SoDu = 
        CASE 
            WHEN dm.LoaiDanhMuc = N'Thu' THEN ISNULL(tk.SoDu, 0) + i.SoTien
            WHEN dm.LoaiDanhMuc = N'Chi' THEN ISNULL(tk.SoDu, 0) - i.SoTien
            ELSE ISNULL(tk.SoDu, 0)
        END
    FROM TaiKhoan tk
    JOIN inserted i ON tk.MaTaiKhoan = i.MaTaiKhoan
    JOIN DanhMuc dm ON i.MaDanhMuc = dm.MaDanhMuc;

    -- Cập nhật SoDuSauGiaoDich cho các giao dịch
    UPDATE gd
    SET gd.SoDuSauGiaoDich = tk.SoDu
    FROM GiaoDich gd
    JOIN inserted i ON gd.MaGiaoDich = i.MaGiaoDich
    JOIN TaiKhoan tk ON i.MaTaiKhoan = tk.MaTaiKhoan
    WHERE tk.SoDu IS NOT NULL;
END;
GO
ALTER TABLE [dbo].[GiaoDich] ENABLE TRIGGER [trg_CapNhatSoDuSauGiaoDich]
GO
/****** Object:  Trigger [dbo].[trg_KiemTraHanMuc]    Script Date: 23/04/2025 9:45:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_KiemTraHanMuc]
ON [dbo].[GiaoDich]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaNguoiDung VARCHAR(13), @MaDanhMuc VARCHAR(13), @SoTien FLOAT, @NgayGD DATETIME;
    
    SELECT 
        @MaNguoiDung = MaNguoiDung,
        @MaDanhMuc = MaDanhMuc,
        @SoTien = SoTien,
        @NgayGD = NgayGiaoDich
    FROM inserted;

    -- Chỉ áp dụng với giao dịch loại "Chi"
    IF EXISTS (
        SELECT 1
        FROM DanhMuc dm
        WHERE dm.MaDanhMuc = @MaDanhMuc AND dm.LoaiDanhMuc = N'Chi'
    )
    BEGIN
        DECLARE @TongChi FLOAT = (
            SELECT ISNULL(SUM(SoTien), 0)
            FROM GiaoDich gd
            WHERE gd.MaNguoiDung = @MaNguoiDung
              AND gd.MaDanhMuc = @MaDanhMuc
              AND MONTH(gd.NgayGiaoDich) = MONTH(@NgayGD)
              AND YEAR(gd.NgayGiaoDich) = YEAR(@NgayGD)
        );

        DECLARE @HanMuc FLOAT = (
            SELECT SoTienToiDa
            FROM HanMucChiTieu
            WHERE MaNguoiDung = @MaNguoiDung AND MaDanhMuc = @MaDanhMuc
        );

        IF (@TongChi + @SoTien > ISNULL(@HanMuc, 999999999))
        BEGIN
            -- Gửi thông báo thay vì thêm giao dịch
            INSERT INTO ThongBao(MaThongBao, MaNguoiDung, NoiDung, NgayTao)
            VALUES (
                NEWID(), 
                @MaNguoiDung, 
                N'Chi tiêu vượt hạn mức cho danh mục này. Vui lòng kiểm tra lại.', 
                GETDATE()
            );
            RETURN;
        END
    END

    -- Nếu không vượt, cho phép thêm giao dịch
    INSERT INTO GiaoDich
    SELECT * FROM inserted;
END
GO
ALTER TABLE [dbo].[GiaoDich] ENABLE TRIGGER [trg_KiemTraHanMuc]
GO
/****** Object:  Trigger [dbo].[trg_ThongBao_GiaoDichMoi]    Script Date: 23/04/2025 9:45:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_ThongBao_GiaoDichMoi]
ON [dbo].[GiaoDich]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Thêm thông báo mới cho mỗi giao dịch được thêm vào
    INSERT INTO ThongBao (MaThongBao, MaNguoiDung, NoiDung, NgayTao)
    SELECT 
        -- Tạo mã Thông báo tự động dạng TBxxx
        'TB' + RIGHT('000' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) 
            + (SELECT COUNT(*) FROM ThongBao) AS VARCHAR), 3),
        i.MaNguoiDung,
        N'Giao dịch mới: ' + ISNULL(dm.TenDanhMuc, i.MaDanhMuc),
        GETDATE()
    FROM inserted i
    LEFT JOIN DanhMuc dm ON i.MaDanhMuc = dm.MaDanhMuc;
END;
GO
ALTER TABLE [dbo].[GiaoDich] ENABLE TRIGGER [trg_ThongBao_GiaoDichMoi]
GO
USE [master]
GO
ALTER DATABASE [QL_SoThuChi_CaNhan] SET  READ_WRITE 
GO
