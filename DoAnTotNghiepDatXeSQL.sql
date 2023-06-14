USE [master]
GO
/****** Object:  Database [DichVuDatXeWebsite3]    Script Date: 6/12/2023 11:17:26 AM ******/
CREATE DATABASE [DichVuDatXeWebsite3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DichVuDatXeWebsite3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DichVuDatXeWebsite3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DichVuDatXeWebsite3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DichVuDatXeWebsite3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DichVuDatXeWebsite3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET ARITHABORT OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET  MULTI_USER 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET QUERY_STORE = ON
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DichVuDatXeWebsite3]
GO
/****** Object:  Table [dbo].[DanhGiaTaiXe]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaTaiXe](
	[MaDanhGiaTX] [int] IDENTITY(1,1) NOT NULL,
	[KHDanhGia] [varchar](100) NOT NULL,
	[TKTaiXe] [varchar](100) NOT NULL,
	[MucDo] [int] NOT NULL,
	[BinhLuan] [nvarchar](max) NULL,
	[NgayDanhGia] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhGiaTX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGiaUngDung]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaUngDung](
	[MaDanhGia] [int] IDENTITY(1,1) NOT NULL,
	[SoDienThoai] [varchar](100) NOT NULL,
	[NgayDanhGia] [datetime] NULL,
	[MucDo] [int] NULL,
	[NoiDung] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SoDienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[SoDienThoai] [varchar](100) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[NgayThangNamSinh] [date] NULL,
	[CCCD] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[HinhAnh] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SoDienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKhuyenMai] [int] IDENTITY(1,1) NOT NULL,
	[MaCode] [varchar](50) NULL,
	[PhanTram] [decimal](5, 2) NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[DieuKien] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanTin]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanTin](
	[MaNhanTin] [int] IDENTITY(1,1) NOT NULL,
	[SDTNguoiNhan] [varchar](100) NULL,
	[SDTNguoiGui] [varchar](100) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[TrangThaiXem] [bit] NULL,
	[CamXuc] [nvarchar](50) NULL,
	[NgayGui] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenTaiKhoan]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenTaiKhoan](
	[MaQuyenTK] [int] IDENTITY(1,1) NOT NULL,
	[SoDienThoai] [varchar](100) NOT NULL,
	[MaQuyen] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyenTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[SoDienThoai] [varchar](100) NOT NULL,
	[MatKhau] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SoDienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanNganHang]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanNganHang](
	[MaTaiKhoanNH] [int] IDENTITY(1,1) NOT NULL,
	[SoDienThoai] [varchar](100) NOT NULL,
	[CCCD] [nvarchar](50) NULL,
	[MatTruocCCCD] [nvarchar](max) NULL,
	[MatSauCCCD] [nvarchar](max) NULL,
	[SoThe] [nvarchar](100) NOT NULL,
	[SoTaiKhoan] [int] NOT NULL,
	[ChuThe] [nvarchar](100) NOT NULL,
	[ThoiHanThang] [int] NOT NULL,
	[ThoiHanNam] [int] NOT NULL,
	[CVV] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoanNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiXe]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiXe](
	[MaTX] [int] IDENTITY(1,1) NOT NULL,
	[SoDienThoai] [varchar](100) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[NgayThangNamSinh] [date] NULL,
	[Email] [varchar](50) NULL,
	[BienSo] [varchar](50) NULL,
	[CCCD] [varchar](50) NULL,
	[NgayDangKy] [date] NULL,
	[HinhAnh] [varchar](100) NULL,
	[MucDoDanhGiaTB] [decimal](5, 2) NULL,
	[DiemUyTin] [decimal](5, 2) NULL,
	[ViTri] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SoDienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiXeNhanChuyenXe]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiXeNhanChuyenXe](
	[MaNhanChuyen] [int] IDENTITY(1,1) NOT NULL,
	[SoDienThoai] [varchar](100) NOT NULL,
	[MaDatXe] [int] NOT NULL,
	[NgayNhan] [datetime] NULL,
	[TrangThai] [bit] NULL,
	[GhiChu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanChuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToan](
	[MaThanhToan] [int] IDENTITY(1,1) NOT NULL,
	[SoDienThoai] [varchar](100) NOT NULL,
	[MaTaiKhoanNH] [int] NULL,
	[MaDatXe] [int] NULL,
	[MaKhuyenMai] [int] NULL,
	[TongTien] [int] NULL,
	[HinhThucThanhToan] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[NgayThanhToan] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThanhToan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinDatXe]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinDatXe](
	[MaDatXe] [int] IDENTITY(1,1) NOT NULL,
	[SoDienThoai] [varchar](100) NOT NULL,
	[DiemDon] [nvarchar](100) NOT NULL,
	[DiemDen] [nvarchar](100) NOT NULL,
	[SoKm] [varchar](50) NULL,
	[ThoiGian] [nvarchar](50) NULL,
	[ThanhTien] [varchar](50) NULL,
	[LoaiXe] [nvarchar](50) NULL,
	[HinhThucThanhToan] [nvarchar](50) NULL,
	[NgayGioDat] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDatXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThaiHoatDong]    Script Date: 6/12/2023 11:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThaiHoatDong](
	[MaTrangThai] [int] IDENTITY(1,1) NOT NULL,
	[TrangThai] [bit] NULL,
	[SoDienThoai] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DanhGiaTaiXe] ON 

INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (2, N'123456', N'dangquy360@gmail.com', 5, N'Nice job', CAST(N'2023-05-16T00:00:00.000' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (4, N'123456', N'dangquy360@gmail.com', 5, N'Chuyến đi rất là tuyệt vời, cho hẳn 5 sao luôn nha!!!', CAST(N'2023-05-16T22:34:26.987' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (5, N'123456', N'dangquy360@gmail.com', 3, N'Ok, tạm ổn!', CAST(N'2023-05-16T22:39:18.017' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (6, N'123456', N'dangquy360@gmail.com', 4, N'Nice job', CAST(N'2023-05-17T13:25:44.840' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (7, N'123456', N'dangquy360@gmail.com', 5, N'Hi', CAST(N'2023-05-19T14:48:07.413' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (8, N'123456', N'dangquy360@gmail.com', 5, N'Nice job man', CAST(N'2023-05-23T23:06:48.590' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (9, N'123456', N'dangquy360@gmail.com', 4, N'Chuyến đi rất tuyệt vời!!!', CAST(N'2023-05-24T17:53:10.903' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (10, N'123456', N'dangquy360@gmail.com', 4, N'Làm tốt lắm, cho 4 sao luôn', CAST(N'2023-05-25T12:25:40.917' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (11, N'123456', N'dangquy360@gmail.com', 5, N'Nice trip, cho hẳn 5 sao luôn!!!', CAST(N'2023-05-25T13:11:49.127' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (12, N'123456', N'dangquy360@gmail.com', 5, N'Chuyến đi rất tốt, cho hẳn 5 sao luôn nha!!!', CAST(N'2023-05-25T14:16:55.950' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (13, N'123456', N'dangquy360@gmail.com', 5, N'Tài xế rất tốt, chu đáo, cho hẳn 5 sao!!!', CAST(N'2023-05-25T15:59:10.720' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (14, N'123456', N'dangquy360@gmail.com', 5, N'Tài xế rất thân thiện, cho 5 sao luôn !!!', CAST(N'2023-05-25T18:09:25.387' AS DateTime))
INSERT [dbo].[DanhGiaTaiXe] ([MaDanhGiaTX], [KHDanhGia], [TKTaiXe], [MucDo], [BinhLuan], [NgayDanhGia]) VALUES (15, N'123456', N'dangquy360@gmail.com', 5, N'Hi', CAST(N'2023-05-26T18:37:53.977' AS DateTime))
SET IDENTITY_INSERT [dbo].[DanhGiaTaiXe] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhGiaUngDung] ON 

INSERT [dbo].[DanhGiaUngDung] ([MaDanhGia], [SoDienThoai], [NgayDanhGia], [MucDo], [NoiDung]) VALUES (126, N'123456', CAST(N'2023-05-25T18:14:42.230' AS DateTime), 4, N'Hi xin chào')
INSERT [dbo].[DanhGiaUngDung] ([MaDanhGia], [SoDienThoai], [NgayDanhGia], [MucDo], [NoiDung]) VALUES (125, N'dangquy360@gmail.com', CAST(N'2023-05-25T18:12:27.793' AS DateTime), 5, N'Tôi là tài xế quý đăng, cho hẳn 5 sao nha !!!')
SET IDENTITY_INSERT [dbo].[DanhGiaUngDung] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (26, N'0998776523', N'Trương Đăng Quý 123', CAST(N'2001-03-07' AS Date), NULL, N'dangquy360@gmail.com', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (1, N'12345', N'Nguyễn Văn Đạt', CAST(N'2023-03-10' AS Date), N'778156234', N'Dat542@gmail.com', N'kh2.png')
INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (2, N'123456', N'Minh Anh', CAST(N'2023-05-14' AS Date), N'778156234', N'MinhAnh@gmail.com', N'2036647114car-3.png')
INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (5, N'123456789', N'HairSalon2', CAST(N'0001-01-01' AS Date), NULL, N'abc@gmail.com', N'997763050car-3.png')
INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (7, N'456782', N'QuỳnhChi', CAST(N'2023-03-03' AS Date), NULL, N'timofey.gusev.opal@gmail.com', N'997763050car-3.png')
INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (3, N'6789', N'Nhật Nam', CAST(N'2023-03-25' AS Date), N'778156234', N'timofey.gusev.opal@gmail.com', N'997763050car-3.png')
INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (6, N'6789000', N'HairSalon8', CAST(N'2023-03-03' AS Date), NULL, N'abc@gmail.com', N'997763050car-3.png')
INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (4, N'67891', N'Hair3', CAST(N'0001-01-01' AS Date), NULL, N'abc@gmail.com', N'kh4.png')
INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (15, N'84388159145', N'QuyDang123', CAST(N'2001-07-13' AS Date), N'778156234', N'dangquy3601@gmail.com', N'Motor.png')
INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (8, N'dangquy360@gmail.com', N'QuyDang', CAST(N'2023-03-08' AS Date), N'7782133', N'Dangquy360@gmail.com', N'Motor.png')
INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (11, N'havanluong0104@gmail.com', NULL, CAST(N'0001-01-01' AS Date), NULL, N'abc@gmail.com', N'997763050car-3.png')
INSERT [dbo].[KhachHang] ([MaKH], [SoDienThoai], [Ten], [NgayThangNamSinh], [CCCD], [Email], [HinhAnh]) VALUES (10, N'ndung983@gmail.com', N'HairSalon', CAST(N'0001-01-01' AS Date), NULL, N'abc@gmail.com', N'kh10.png')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhuyenMai] ON 

INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [MaCode], [PhanTram], [NgayBatDau], [NgayKetThuc], [DieuKien], [TrangThai]) VALUES (1, N'AxSCjy129', CAST(20.00 AS Decimal(5, 2)), CAST(N'2023-05-11' AS Date), CAST(N'2023-06-12' AS Date), N'Tối đa 30.000 cho chuyến xe 70.000', 1)
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [MaCode], [PhanTram], [NgayBatDau], [NgayKetThuc], [DieuKien], [TrangThai]) VALUES (2, N'TxSCjy425', CAST(10.00 AS Decimal(5, 2)), CAST(N'2023-05-11' AS Date), CAST(N'2023-06-12' AS Date), N'Tối đa 30.000 cho chuyến xe 80.000', 1)
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [MaCode], [PhanTram], [NgayBatDau], [NgayKetThuc], [DieuKien], [TrangThai]) VALUES (3, N'RxSCjy329', CAST(10.00 AS Decimal(5, 2)), CAST(N'2023-04-11' AS Date), CAST(N'2023-05-12' AS Date), N'Tối đa 15.000 cho chuyến xe 60.000', 0)
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [MaCode], [PhanTram], [NgayBatDau], [NgayKetThuc], [DieuKien], [TrangThai]) VALUES (4, N'SkSCjy137', CAST(15.00 AS Decimal(5, 2)), CAST(N'2023-05-11' AS Date), CAST(N'2023-05-20' AS Date), N'Không giới hạn giá chuyến xe', 0)
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [MaCode], [PhanTram], [NgayBatDau], [NgayKetThuc], [DieuKien], [TrangThai]) VALUES (5, N'YxSCjy425', CAST(20.00 AS Decimal(5, 2)), CAST(N'2023-05-11' AS Date), CAST(N'2023-06-12' AS Date), N'Tối đa 20.000 cho chuyến xe 50.000', 1)
SET IDENTITY_INSERT [dbo].[KhuyenMai] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanTin] ON 

INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (78, N'dangquy360@gmail.com', N'123456', N'Hi, em gái', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (79, N'123456', N'dangquy360@gmail.com', N'Hi', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (80, N'dangquy360@gmail.com', N'123456', N'Hi anh trai', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (81, N'dangquy360@gmail.com', N'123456', N'Hi', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (82, N'dangquy360@gmail.com', N'123456', N'Hiss', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (83, N'dangquy360@gmail.com', N'123456', N'a', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (84, N'dangquy360@gmail.com', N'123456', N'Spectre', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (85, N'dangquy360@gmail.com', N'123456', N'Hello m okkkk', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (86, N'dangquy360@gmail.com', N'123456', N'Hiiiiiiiiiiii', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (87, N'123456', N'dangquy360@gmail.com', N'Hikkkklll', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (88, N'6789', N'dangquy360@gmail.com', N'Hi, bạn có phải là người đặt xe không?', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (89, N'dangquy360@gmail.com', N'6789', N'ĐÚng rồi ạ', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (90, N'123456', N'dangquy360@gmail.com', N'Hello anh', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (91, N'123456', N'dangquy360@gmail.com', N'Hi', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (92, N'dangquy360@gmail.com', N'123456', N'Hi', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (93, N'123456', N'dangquy360@gmail.com', N'A', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (94, N'dangquy360@gmail.com', N'123456', N'B', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (95, N'123456', N'dangquy360@gmail.com', N'hi', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (96, N'123456', N'dangquy360@gmail.com', N'KKL', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (97, N'dangquy360@gmail.com', N'123456', N'Hi bạn', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (98, N'123456', N'dangquy360@gmail.com', N'Hi anh trai', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (99, N'123456', N'dangquy360@gmail.com', N'Hi friend', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (100, N'dangquy360@gmail.com', N'123456', N'Hello friend', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (101, N'dangquy360@gmail.com', N'123456', N'Hi driver', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (108, N'123456', N'dangquy360@gmail.com', N'Hi, Minh Anh', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (109, N'dangquy360@gmail.com', N'123456', N'Hi, QuyDang', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (110, N'123456', N'dangquy360@gmail.com', N'Dạo này khỏe không?', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (111, N'dangquy360@gmail.com', N'123456', N'Khỏe nha', NULL, NULL, NULL)
INSERT [dbo].[NhanTin] ([MaNhanTin], [SDTNguoiNhan], [SDTNguoiGui], [NoiDung], [TrangThaiXem], [CamXuc], [NgayGui]) VALUES (112, N'123456', N'dangquy360@gmail.com', N'Hilllllkkkkk', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NhanTin] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen]) VALUES (1, N'Admin')
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen]) VALUES (2, N'Driver')
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen]) VALUES (3, N'User')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[QuyenTaiKhoan] ON 

INSERT [dbo].[QuyenTaiKhoan] ([MaQuyenTK], [SoDienThoai], [MaQuyen]) VALUES (1, N'dangquy360@gmail.com', 2)
INSERT [dbo].[QuyenTaiKhoan] ([MaQuyenTK], [SoDienThoai], [MaQuyen]) VALUES (2, N'123456', 3)
INSERT [dbo].[QuyenTaiKhoan] ([MaQuyenTK], [SoDienThoai], [MaQuyen]) VALUES (3, N'6789', 2)
INSERT [dbo].[QuyenTaiKhoan] ([MaQuyenTK], [SoDienThoai], [MaQuyen]) VALUES (5, N'havanluong0104@gmail.com', 2)
INSERT [dbo].[QuyenTaiKhoan] ([MaQuyenTK], [SoDienThoai], [MaQuyen]) VALUES (6, N'0388159145', 1)
INSERT [dbo].[QuyenTaiKhoan] ([MaQuyenTK], [SoDienThoai], [MaQuyen]) VALUES (7, N'6789', 3)
INSERT [dbo].[QuyenTaiKhoan] ([MaQuyenTK], [SoDienThoai], [MaQuyen]) VALUES (10, N'84388159145', 1)
SET IDENTITY_INSERT [dbo].[QuyenTaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (1, N'0388159145', N'0388159145')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (31, N'0998776523', N'123456789')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (2, N'12345', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (3, N'123456', N'0388159145')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (6, N'123456789', N'12345')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (12, N'456782', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (4, N'6789', N'0388159145')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (8, N'6789000', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (5, N'67891', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (19, N'84388159145', N'0388159145')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (13, N'dangquy360@gmail.com', N'0388159145')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (16, N'havanluong0104@gmail.com', N'123456')
INSERT [dbo].[TaiKhoan] ([MaTK], [SoDienThoai], [MatKhau]) VALUES (15, N'ndung983@gmail.com', N'123456789')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiXe] ON 

INSERT [dbo].[TaiXe] ([MaTX], [SoDienThoai], [Ten], [NgayThangNamSinh], [Email], [BienSo], [CCCD], [NgayDangKy], [HinhAnh], [MucDoDanhGiaTB], [DiemUyTin], [ViTri]) VALUES (2, N'123456', N'Nhan', CAST(N'2001-03-08' AS Date), N'nhan3360@gmail.com', N'60-F1 65166', N'7782993', CAST(N'2020-09-08' AS Date), N'vehicle-4.png', CAST(3.00 AS Decimal(5, 2)), CAST(6.00 AS Decimal(5, 2)), N'Đường D2, Phường 25, Bình Thạnh, Ho Chi Minh City, Vietnam')
INSERT [dbo].[TaiXe] ([MaTX], [SoDienThoai], [Ten], [NgayThangNamSinh], [Email], [BienSo], [CCCD], [NgayDangKy], [HinhAnh], [MucDoDanhGiaTB], [DiemUyTin], [ViTri]) VALUES (3, N'6789', N'Tai', CAST(N'2000-08-09' AS Date), N'tai231@gmai.com', N'59-F1 79912', N'7782993', CAST(N'2020-09-08' AS Date), N'kh4.png', CAST(4.00 AS Decimal(5, 2)), CAST(7.00 AS Decimal(5, 2)), N'Đường Bạch Đằng, Phường 15, Bình Thạnh, Ho Chi Minh City, Vietnam')
INSERT [dbo].[TaiXe] ([MaTX], [SoDienThoai], [Ten], [NgayThangNamSinh], [Email], [BienSo], [CCCD], [NgayDangKy], [HinhAnh], [MucDoDanhGiaTB], [DiemUyTin], [ViTri]) VALUES (1, N'dangquy360@gmail.com', N'QuyDang', CAST(N'2001-03-08' AS Date), N'dangquy360@gmail.com', N'47-F1 88291', N'7782993', CAST(N'2020-09-08' AS Date), N'Motor.png', CAST(5.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), N'Đường Bạch Đằng, Phường 15, Bình Thạnh, Ho Chi Minh City, Vietnam')
SET IDENTITY_INSERT [dbo].[TaiXe] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiXeNhanChuyenXe] ON 

INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (1, N'dangquy360@gmail.com', 279, CAST(N'2023-05-22T14:35:15.423' AS DateTime), 1, N'Tôi đang đến nơi')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (2, N'dangquy360@gmail.com', 280, CAST(N'2023-05-22T14:36:03.857' AS DateTime), 1, N'Tôi sẽ đến trong vòng 5 phút nữa')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (3, N'6789', 281, CAST(N'2023-05-22T14:36:59.910' AS DateTime), 1, N'Tôi đang kẹt một số việc, khoảng 10 phút nữa sẽ có mặt')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (4, N'6789', 282, CAST(N'2023-05-22T14:37:20.450' AS DateTime), 1, N'Tôi sẽ đến nhanh thôi')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (9, N'dangquy360@gmail.com', 257, CAST(N'2023-05-25T11:01:40.510' AS DateTime), 1, N'Sẽ đến ngay')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (11, N'dangquy360@gmail.com', 254, CAST(N'2023-05-25T11:02:10.400' AS DateTime), 1, N'Đến ngay')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (12, N'dangquy360@gmail.com', 243, CAST(N'2023-05-25T11:12:38.847' AS DateTime), 1, N'Coming now')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (17, N'dangquy360@gmail.com', 247, CAST(N'2023-05-25T11:17:47.153' AS DateTime), 1, N'Sẽ đến ngay')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (18, N'dangquy360@gmail.com', 248, CAST(N'2023-05-25T11:18:06.090' AS DateTime), 1, N'Sẽ đến ngay')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (19, N'dangquy360@gmail.com', 249, CAST(N'2023-05-25T11:18:25.300' AS DateTime), 1, N'Sẽ đến ngay')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (22, N'dangquy360@gmail.com', 250, CAST(N'2023-05-25T11:19:40.303' AS DateTime), 1, N'Tôi đang kẹt một số việc, khoảng 10 phút nữa sẽ có mặt')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (23, N'dangquy360@gmail.com', 251, CAST(N'2023-05-25T11:19:47.863' AS DateTime), 1, N'Tôi đang kẹt một số việc, khoảng 10 phút nữa sẽ có mặt')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (24, N'dangquy360@gmail.com', 252, CAST(N'2023-05-25T11:19:54.713' AS DateTime), 1, N'Tôi đang kẹt một số việc, khoảng 10 phút nữa sẽ có mặt')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (25, N'dangquy360@gmail.com', 254, CAST(N'2023-05-25T11:20:07.450' AS DateTime), 1, N'Tôi đang kẹt một số việc, khoảng 10 phút nữa sẽ có mặt')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (26, N'dangquy360@gmail.com', 255, CAST(N'2023-05-25T11:20:16.100' AS DateTime), 1, N'Tôi đang kẹt một số việc, khoảng 10 phút nữa sẽ có mặt')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (27, N'dangquy360@gmail.com', 256, CAST(N'2023-05-25T11:20:42.927' AS DateTime), 1, N'Tôi đang kẹt một số việc, khoảng 10 phút nữa sẽ có mặt')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (28, N'dangquy360@gmail.com', 256, CAST(N'2023-05-25T11:22:52.053' AS DateTime), 1, N'Tôi đang kẹt một số việc, khoảng 10 phút nữa sẽ có mặt')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (29, N'dangquy360@gmail.com', 257, CAST(N'2023-05-25T11:23:11.170' AS DateTime), 1, N'Tôi đang kẹt một số việc, khoảng 10 phút nữa sẽ có mặt')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (30, N'dangquy360@gmail.com', 244, CAST(N'2023-05-25T11:23:33.737' AS DateTime), 1, N'Sẽ đến ngay')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (32, N'dangquy360@gmail.com', 249, CAST(N'2023-05-25T11:24:06.190' AS DateTime), 1, N'Sẽ đến ngay')
INSERT [dbo].[TaiXeNhanChuyenXe] ([MaNhanChuyen], [SoDienThoai], [MaDatXe], [NgayNhan], [TrangThai], [GhiChu]) VALUES (33, N'dangquy360@gmail.com', 279, CAST(N'2023-05-25T11:24:43.897' AS DateTime), 1, N'Sẽ đến ngay')
SET IDENTITY_INSERT [dbo].[TaiXeNhanChuyenXe] OFF
GO
SET IDENTITY_INSERT [dbo].[ThanhToan] ON 

INSERT [dbo].[ThanhToan] ([MaThanhToan], [SoDienThoai], [MaTaiKhoanNH], [MaDatXe], [MaKhuyenMai], [TongTien], [HinhThucThanhToan], [TrangThai], [NgayThanhToan]) VALUES (1, N'123456', NULL, 250, 1, 431892, N'Tiền mặt', 1, CAST(N'2023-05-22T14:38:19.660' AS DateTime))
INSERT [dbo].[ThanhToan] ([MaThanhToan], [SoDienThoai], [MaTaiKhoanNH], [MaDatXe], [MaKhuyenMai], [TongTien], [HinhThucThanhToan], [TrangThai], [NgayThanhToan]) VALUES (2, N'123456', NULL, 248, 2, 282248, N'Tiền mặt', 1, CAST(N'2023-05-22T14:39:48.140' AS DateTime))
INSERT [dbo].[ThanhToan] ([MaThanhToan], [SoDienThoai], [MaTaiKhoanNH], [MaDatXe], [MaKhuyenMai], [TongTien], [HinhThucThanhToan], [TrangThai], [NgayThanhToan]) VALUES (3, N'6789', NULL, 278, 5, 562568, N'Tiền mặt', 1, CAST(N'2023-05-22T14:40:28.237' AS DateTime))
INSERT [dbo].[ThanhToan] ([MaThanhToan], [SoDienThoai], [MaTaiKhoanNH], [MaDatXe], [MaKhuyenMai], [TongTien], [HinhThucThanhToan], [TrangThai], [NgayThanhToan]) VALUES (4, N'6789', NULL, 274, 2, 409472, N'Tiền mặt', 1, CAST(N'2023-05-22T14:41:11.020' AS DateTime))
SET IDENTITY_INSERT [dbo].[ThanhToan] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongTinDatXe] ON 

INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (243, N'dangquy360@gmail.com', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'V792+M6 Long Khánh, Đồng Nai, Vietnam', N'82.35 KM', N'1 giờ, 29 phút', N'339.404 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-03-21T03:42:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (244, N'dangquy360@gmail.com', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'W7J9+XJG, Bàu Trâm, Long Khánh, Dong Nai, Vietnam', N'74.38 KM', N'1 giờ, 17 phút', N'307.508 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-03-15T07:41:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (245, N'dangquy360@gmail.com', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'718 Ấp Chánh, Tiên Thuỷ, Châu Thành, Bến Tre, Vietnam', N'103.05 KM', N'2 giờ, 18 phút', N'422.180 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-03-04T07:47:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (246, N'123456', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'X737+QG Long Khánh, Đồng Nai, Vietnam', N'75.23 KM', N'1 giờ, 21 phút', N'310.904 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-03-11T07:48:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (247, N'dangquy360@gmail.com', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'V64P+WH Long Khánh, Đồng Nai, Vietnam', N'80.66 KM', N'1 giờ, 23 phút', N'332.652 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-03-10T07:54:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (248, N'123456', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'8MHQ+C58 Vườn Rau Vui Vẻ, Bình Nghị, Gò Công Đông, Tiền Giang, Vietnam', N'68.06 KM', N'1 giờ, 58 phút', N'282.248 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-02-02T07:57:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (249, N'123456', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'7MPW+C7 Gò Công Đông District, Tien Giang, Vietnam', N'72.37 KM', N'2 giờ, 2 phút', N'299.492 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-02-12T08:02:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (250, N'123456', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'5C62+7H Giồng Trôm District, Ben Tre, Vietnam', N'105.47 KM', N'2 giờ, 22 phút', N'431.892 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-02-09T08:05:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (251, N'123456', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'GWPM+JG, Tân Phước, Đồng Phú District, Binh Phuoc, Vietnam', N'99.87 KM', N'2 giờ, 26 phút', N'409.472 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-02-20T08:09:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (252, N'dangquy360@gmail.com', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'3565 QL1A, Bảo Hoà, Xuân Lộc, Đồng Nai, Vietnam', N'77.64 KM', N'1 giờ, 22 phút', N'320.544 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-09T08:15:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (254, N'123456', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'Giáo xứ Xuân Bình, Xã Bảo Hòa, Huyện Xuân Lộc, V7V9+WX2, Bảo Hoà, Xuân Lộc, Đồng Nai, Vietnam', N'79.37 KM', N'1 giờ, 23 phút', N'327.476 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-04T10:21:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (255, N'dangquy360@gmail.com', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'8M2R+W3 Gò Công Đông District, Tien Giang, Vietnam', N'71.53 KM', N'2 giờ, 3 phút', N'296.112 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-19T10:24:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (256, N'123456', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'4JJP+WX Tánh Linh District, Bình Thuận, Vietnam', N'138.14 KM', N'2 giờ, 43 phút', N'562.568 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-04T10:26:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (257, N'dangquy360@gmail.com', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'7MQW+V5 Tánh Linh District, Bình Thuận, Vietnam', N'144.44 KM', N'2 giờ, 56 phút', N'587.768 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-04T11:11:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (258, N'dangquy360@gmail.com', N'78/4C Đ. Phùng Văn Cung, Phường 7, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam', N'V783+2H9, Hàng Gòn, Long Khánh, Dong Nai, Vietnam', N'85.87 KM', N'1 giờ, 36 phút', N'353.496 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-04T16:04:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (259, N'dangquy360@gmail.com', N'78/4C Đ. Phùng Văn Cung, Phường 7, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam', N'W77G+CM Long Khánh, Đồng Nai, Vietnam', N'82.28 KM', N'1 giờ, 30 phút', N'339.112 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-04T16:06:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (266, N'dangquy360@gmail.com', N'78/4C Đ. Phùng Văn Cung, Phường 7, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam', N'W77G+CM Long Khánh, Đồng Nai, Vietnam', N'82.28 KM', N'1 giờ, 30 phút', N'400.000 VND', N'Xe máy', N'Tiền mặt', CAST(N'2023-04-19T21:23:49.130' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (267, N'dangquy360@gmail.com', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'78/4C Đ. Phùng Văn Cung, Phường 7, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam', N'82.28 KM', N'1 giờ, 30 phút', N'456.773 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-04-19T21:24:43.170' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (270, N'dangquy360@gmail.com', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'718 Ấp Chánh, Tiên Thuỷ, Châu Thành, Bến Tre, Vietnam', N'138.14 KM', N'1 giờ, 30 phút', N'353.496 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-04-21T22:39:58.707' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (271, N'123456', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'718 Ấp Chánh, Tiên Thuỷ, Châu Thành, Bến Tre, Vietnam', N'138.14 KM', N'1 giờ, 30 phút', N'353.496 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-04-21T22:41:29.140' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (272, N'6789', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'V783+2H9, Hàng Gòn, Long Khánh, Dong Nai, Vietnam', N'138.14 KM', N'2 giờ, 43 phút', N'456.773 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2022-12-22T12:38:54.040' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (273, N'6789', N'78/4C Đ. Phùng Văn Cung, Phường 7, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam', N'W7J9+XJG, Bàu Trâm, Long Khánh, Dong Nai, Vietnam', N'82.28 KM', N'2 giờ, 56 phút', N'353.496 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2022-09-11T12:39:45.717' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (274, N'6789', N'4JJP+WX Tánh Linh District, Bình Thuận, Vietnam', N'718 Ấp Chánh, Tiên Thuỷ, Châu Thành, Bến Tre, Vietnam', N'138.14 KM', N'2 giờ, 26 phút', N'409.472 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2022-07-18T12:40:43.380' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (275, N'6789', N'4JJP+WX Tánh Linh District, Bình Thuận, Vietnam', N'W7J9+XJG, Bàu Trâm, Long Khánh, Dong Nai, Vietnam', N'144.44 KM', N'1 giờ, 36 phút', N'4.327.476 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2022-05-20T12:41:37.810' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (276, N'6789', N'78/4C Đ. Phùng Văn Cung, Phường 7, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'82.28 KM', N'1 giờ, 36 phút', N'409.472 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-22T12:53:34.277' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (278, N'6789', N'4JJP+WX Tánh Linh District, Bình Thuận, Vietnam', N'W7J9+XJG, Bàu Trâm, Long Khánh, Dong Nai, Vietnam', N'138.14 KM', N'1 giờ, 36 phút', N'562.568 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-22T12:54:31.723' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (279, N'123456', N'246/23A11 Xô Viết Nghệ Tĩnh, Phường 21, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam', N'17 Phan Bá Phiến, Phường 12, Tân Bình, Thành phố Hồ Chí Minh, Việt Nam', N'9.93 KM', N'26 phút', N'49.712 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-22T06:02:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (280, N'123456', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam', N'575/22A TL10, Bình Trị Đông B, Bình Tân, Thành phố Hồ Chí Minh, Việt Nam', N'13.63 KM', N'37 phút', N'64.516 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-22T06:05:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (281, N'123456', N'246/23A11 Xô Viết Nghệ Tĩnh, Phường 21, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam', N'539/4 Lũy Bán Bích, Hoà Thanh, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam', N'13.20 KM', N'35 phút', N'62.780 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-22T06:09:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (282, N'123456', N'246/23A11 Xô Viết Nghệ Tĩnh, Phường 21, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam', N'106 Đường Số 34, Bình Trị Đông B, Bình Tân, Thành phố Hồ Chí Minh, Việt Nam', N'14.61 KM', N'40 phút', N'68.424 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-22T06:19:00.000' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (283, N'dangquy360@gmail.com', N'246/23A11 Xô Viết Nghệ Tĩnh, Phường 21, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam', N'539/4 Lũy Bán Bích, Hoà Thanh, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam', N'13.20 KM', N'1 giờ, 36 phút', N'562.568 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-25T13:46:51.750' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (284, N'dangquy360@gmail.com', N'246/23A11 Xô Viết Nghệ Tĩnh, Phường 21, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam', N'78/4C Đ. Phùng Văn Cung, Phường 7, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam', N'14.61 KM', N'35 phút', N'562.568 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-25T13:47:14.290' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (285, N'dangquy360@gmail.com', N'4JJP+WX Tánh Linh District, Bình Thuận, Vietnam', N'W7J9+XJG, Bàu Trâm, Long Khánh, Dong Nai, Vietnam', N'82.28 KM', N'2 giờ, 56 phút', N'64.516 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-25T13:47:24.690' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (286, N'dangquy360@gmail.com', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'82.28 KM', N'1 giờ, 30 phút', N'49.712 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-25T13:47:35.913' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (287, N'dangquy360@gmail.com', N'W7J9+XJG, Bàu Trâm, Long Khánh, Dong Nai, Vietnam', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'82.28 KM', N'1 giờ, 30 phút', N'353.496 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-25T13:47:45.887' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (288, N'dangquy360@gmail.com', N'4JJP+WX Tánh Linh District, Bình Thuận, Vietnam', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'144.44 KM', N'1 giờ, 36 phút', N'353.496 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-25T13:47:57.070' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (289, N'dangquy360@gmail.com', N'78/4C Đ. Phùng Văn Cung, Phường 7, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam', N'V783+2H9, Hàng Gòn, Long Khánh, Dong Nai, Vietnam', N'9.93 KM', N'40 phút', N'68.424 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-25T13:48:03.667' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (290, N'dangquy360@gmail.com', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'537 Xô Viết Nghệ Tĩnh, Phường 26, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'144.44 KM', N'35 phút', N'49.712 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-25T13:48:09.753' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (291, N'dangquy360@gmail.com', N'4JJP+WX Tánh Linh District, Bình Thuận, Vietnam', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'9.93 KM', N'26 phút', N'353.496 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-25T13:48:24.353' AS DateTime))
INSERT [dbo].[ThongTinDatXe] ([MaDatXe], [SoDienThoai], [DiemDon], [DiemDen], [SoKm], [ThoiGian], [ThanhTien], [LoaiXe], [HinhThucThanhToan], [NgayGioDat]) VALUES (292, N'dangquy360@gmail.com', N'129 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Vietnam', N'539/4 Lũy Bán Bích, Hoà Thanh, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam', N'13.63 KM', N'1 giờ, 36 phút', N'353.496 VND ', N'Xe máy', N'Tiền mặt', CAST(N'2023-05-25T13:48:29.897' AS DateTime))
SET IDENTITY_INSERT [dbo].[ThongTinDatXe] OFF
GO
ALTER TABLE [dbo].[DanhGiaTaiXe] ADD  DEFAULT (getdate()) FOR [NgayDanhGia]
GO
ALTER TABLE [dbo].[DanhGiaUngDung] ADD  DEFAULT (getdate()) FOR [NgayDanhGia]
GO
ALTER TABLE [dbo].[NhanTin] ADD  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[TaiXeNhanChuyenXe] ADD  DEFAULT (getdate()) FOR [NgayNhan]
GO
ALTER TABLE [dbo].[ThanhToan] ADD  DEFAULT (getdate()) FOR [NgayThanhToan]
GO
ALTER TABLE [dbo].[ThongTinDatXe] ADD  DEFAULT (getdate()) FOR [NgayGioDat]
GO
ALTER TABLE [dbo].[DanhGiaTaiXe]  WITH CHECK ADD FOREIGN KEY([KHDanhGia])
REFERENCES [dbo].[KhachHang] ([SoDienThoai])
GO
ALTER TABLE [dbo].[DanhGiaTaiXe]  WITH CHECK ADD FOREIGN KEY([TKTaiXe])
REFERENCES [dbo].[TaiXe] ([SoDienThoai])
GO
ALTER TABLE [dbo].[DanhGiaUngDung]  WITH CHECK ADD FOREIGN KEY([SoDienThoai])
REFERENCES [dbo].[KhachHang] ([SoDienThoai])
GO
ALTER TABLE [dbo].[DanhGiaUngDung]  WITH CHECK ADD FOREIGN KEY([SoDienThoai])
REFERENCES [dbo].[TaiXe] ([SoDienThoai])
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD FOREIGN KEY([SoDienThoai])
REFERENCES [dbo].[TaiKhoan] ([SoDienThoai])
GO
ALTER TABLE [dbo].[NhanTin]  WITH CHECK ADD FOREIGN KEY([SDTNguoiNhan])
REFERENCES [dbo].[TaiKhoan] ([SoDienThoai])
GO
ALTER TABLE [dbo].[NhanTin]  WITH CHECK ADD FOREIGN KEY([SDTNguoiGui])
REFERENCES [dbo].[TaiKhoan] ([SoDienThoai])
GO
ALTER TABLE [dbo].[QuyenTaiKhoan]  WITH CHECK ADD FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[PhanQuyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[QuyenTaiKhoan]  WITH CHECK ADD FOREIGN KEY([SoDienThoai])
REFERENCES [dbo].[TaiKhoan] ([SoDienThoai])
GO
ALTER TABLE [dbo].[TaiKhoanNganHang]  WITH CHECK ADD FOREIGN KEY([SoDienThoai])
REFERENCES [dbo].[KhachHang] ([SoDienThoai])
GO
ALTER TABLE [dbo].[TaiXe]  WITH CHECK ADD FOREIGN KEY([SoDienThoai])
REFERENCES [dbo].[TaiKhoan] ([SoDienThoai])
GO
ALTER TABLE [dbo].[TaiXeNhanChuyenXe]  WITH CHECK ADD FOREIGN KEY([MaDatXe])
REFERENCES [dbo].[ThongTinDatXe] ([MaDatXe])
GO
ALTER TABLE [dbo].[TaiXeNhanChuyenXe]  WITH CHECK ADD FOREIGN KEY([SoDienThoai])
REFERENCES [dbo].[TaiXe] ([SoDienThoai])
GO
ALTER TABLE [dbo].[ThanhToan]  WITH CHECK ADD FOREIGN KEY([MaDatXe])
REFERENCES [dbo].[ThongTinDatXe] ([MaDatXe])
GO
ALTER TABLE [dbo].[ThanhToan]  WITH CHECK ADD FOREIGN KEY([MaKhuyenMai])
REFERENCES [dbo].[KhuyenMai] ([MaKhuyenMai])
GO
ALTER TABLE [dbo].[ThanhToan]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoanNH])
REFERENCES [dbo].[TaiKhoanNganHang] ([MaTaiKhoanNH])
GO
ALTER TABLE [dbo].[ThanhToan]  WITH CHECK ADD FOREIGN KEY([SoDienThoai])
REFERENCES [dbo].[KhachHang] ([SoDienThoai])
GO
ALTER TABLE [dbo].[ThongTinDatXe]  WITH CHECK ADD FOREIGN KEY([SoDienThoai])
REFERENCES [dbo].[KhachHang] ([SoDienThoai])
GO
ALTER TABLE [dbo].[TrangThaiHoatDong]  WITH CHECK ADD FOREIGN KEY([SoDienThoai])
REFERENCES [dbo].[TaiKhoan] ([SoDienThoai])
GO
USE [master]
GO
ALTER DATABASE [DichVuDatXeWebsite3] SET  READ_WRITE 
GO
