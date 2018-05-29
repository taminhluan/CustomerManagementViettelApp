USE [master]
GO
/****** Object:  Database [CustomerManagementApp]    Script Date: 5/29/2018 9:24:31 PM ******/
CREATE DATABASE [CustomerManagementApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomerManagementApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CustomerManagementApp.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CustomerManagementApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CustomerManagementApp_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CustomerManagementApp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerManagementApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerManagementApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CustomerManagementApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerManagementApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomerManagementApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CustomerManagementApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomerManagementApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CustomerManagementApp] SET  MULTI_USER 
GO
ALTER DATABASE [CustomerManagementApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomerManagementApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomerManagementApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomerManagementApp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CustomerManagementApp] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CustomerManagementApp]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 5/29/2018 9:24:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](255) NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 5/29/2018 9:24:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDichVu] [int] IDENTITY(1,1) NOT NULL,
	[TenDichVu] [nvarchar](255) NULL,
	[Gia] [float] NULL,
	[KhuyenMai] [float] NULL,
	[MoTa] [nvarchar](255) NULL,
	[MaDanhMuc] [int] NULL,
	[NgayTao] [datetime] NULL,
	[HinhAnh] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LichSuDangKy]    Script Date: 5/29/2018 9:24:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LichSuDangKy](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[MaDichVu] [int] NULL,
	[Gia] [float] NULL,
	[TenTaiKhoan] [varchar](255) NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiTaiKhoan]    Script Date: 5/29/2018 9:24:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiKhoan](
	[MaLoaiTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTaiKhoan] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 5/29/2018 9:24:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenTaiKhoan] [varchar](255) NOT NULL,
	[MatKhau] [varchar](255) NULL,
	[TenHienThi] [nvarchar](255) NULL,
	[MaLoaiTaiKhoan] [int] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoanDichVu]    Script Date: 5/29/2018 9:24:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoanDichVu](
	[MaDichVu] [int] NOT NULL,
	[TenTaiKhoan] [varchar](255) NOT NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC,
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThongTinTaiKhoan]    Script Date: 5/29/2018 9:24:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThongTinTaiKhoan](
	[TenTaiKhoan] [varchar](255) NOT NULL,
	[HoTen] [nvarchar](255) NULL,
	[NgaySinh] [datetime] NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[HinhAnh] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Tien] [float] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [NgayTao]) VALUES (1, N'Dịch vụ khuyến mại', NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [NgayTao]) VALUES (2, N'Dịch vụ mới', NULL)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [Gia], [KhuyenMai], [MoTa], [MaDanhMuc], [NgayTao], [HinhAnh]) VALUES (1, N'Dịch vụ 1', 100000, 50, N'Mô tả', 1, NULL, NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [Gia], [KhuyenMai], [MoTa], [MaDanhMuc], [NgayTao], [HinhAnh]) VALUES (3, N'Dịch vụ 3', 100000, 30, N'Mô tả 2', 2, CAST(N'2018-05-06 21:43:09.670' AS DateTime), NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [Gia], [KhuyenMai], [MoTa], [MaDanhMuc], [NgayTao], [HinhAnh]) VALUES (4, N'Dịch vụ 4', 100000, 20, N'Mô tả 2', 2, CAST(N'2018-05-06 21:44:41.703' AS DateTime), N'viettel-icon.png')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [Gia], [KhuyenMai], [MoTa], [MaDanhMuc], [NgayTao], [HinhAnh]) VALUES (16, N'Dịch vụ 5', 100000, 10, N'Mô tả 2', 2, CAST(N'2018-05-07 20:48:44.630' AS DateTime), NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [Gia], [KhuyenMai], [MoTa], [MaDanhMuc], [NgayTao], [HinhAnh]) VALUES (17, N'Dịch vụ 6', 100000, 75, N'Mô tả 2', 2, CAST(N'2018-05-07 20:48:46.717' AS DateTime), NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [Gia], [KhuyenMai], [MoTa], [MaDanhMuc], [NgayTao], [HinhAnh]) VALUES (18, N'Dịch vụ 7', 100000, 50, N'Mô tả 2', 2, CAST(N'2018-05-07 20:48:48.053' AS DateTime), NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [Gia], [KhuyenMai], [MoTa], [MaDanhMuc], [NgayTao], [HinhAnh]) VALUES (19, N'Dịch vụ 8', 100000, 35, N'Mô tả 2', 2, CAST(N'2018-05-07 20:48:49.853' AS DateTime), NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [Gia], [KhuyenMai], [MoTa], [MaDanhMuc], [NgayTao], [HinhAnh]) VALUES (20, N'tam', 100000, 50, N'Mô tả', 1, CAST(N'2018-05-29 19:25:36.410' AS DateTime), NULL)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [Gia], [KhuyenMai], [MoTa], [MaDanhMuc], [NgayTao], [HinhAnh]) VALUES (21, N'tam', 100000, 50, N'Mô tả', 1, CAST(N'2018-05-29 19:25:49.163' AS DateTime), N'fc32f922.png')
SET IDENTITY_INSERT [dbo].[DichVu] OFF
SET IDENTITY_INSERT [dbo].[LichSuDangKy] ON 

INSERT [dbo].[LichSuDangKy] ([Ma], [MaDichVu], [Gia], [TenTaiKhoan], [NgayTao]) VALUES (4, 17, 2500000, N'admin', CAST(N'2018-05-18 22:44:44.240' AS DateTime))
INSERT [dbo].[LichSuDangKy] ([Ma], [MaDichVu], [Gia], [TenTaiKhoan], [NgayTao]) VALUES (5, 1, 5000000, N'admin', CAST(N'2018-05-18 22:45:09.297' AS DateTime))
INSERT [dbo].[LichSuDangKy] ([Ma], [MaDichVu], [Gia], [TenTaiKhoan], [NgayTao]) VALUES (8, 4, 80000, N'admin', CAST(N'2018-05-19 10:20:29.910' AS DateTime))
INSERT [dbo].[LichSuDangKy] ([Ma], [MaDichVu], [Gia], [TenTaiKhoan], [NgayTao]) VALUES (13, 17, 25000, N'admin', CAST(N'2018-05-29 19:15:22.207' AS DateTime))
SET IDENTITY_INSERT [dbo].[LichSuDangKy] OFF
SET IDENTITY_INSERT [dbo].[LoaiTaiKhoan] ON 

INSERT [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan], [TenLoaiTaiKhoan]) VALUES (1, N'Quản lý')
INSERT [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan], [TenLoaiTaiKhoan]) VALUES (2, N'Quản trị')
INSERT [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan], [TenLoaiTaiKhoan]) VALUES (4, N'Khách hàng')
SET IDENTITY_INSERT [dbo].[LoaiTaiKhoan] OFF
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [TenHienThi], [MaLoaiTaiKhoan], [NgayTao]) VALUES (N'admin', N'12345', N'Admin', 2, NULL)
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [TenHienThi], [MaLoaiTaiKhoan], [NgayTao]) VALUES (N'customer', N'12345', N'Customer', 4, CAST(N'2018-05-29 21:19:23.100' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [TenHienThi], [MaLoaiTaiKhoan], [NgayTao]) VALUES (N'manager', N'12345', N'Manager', 1, CAST(N'2018-05-29 21:19:00.757' AS DateTime))
INSERT [dbo].[TaiKhoanDichVu] ([MaDichVu], [TenTaiKhoan], [NgayTao]) VALUES (1, N'admin', CAST(N'2018-05-18 22:45:09.297' AS DateTime))
INSERT [dbo].[TaiKhoanDichVu] ([MaDichVu], [TenTaiKhoan], [NgayTao]) VALUES (3, N'admin', CAST(N'2018-05-14 20:09:28.987' AS DateTime))
INSERT [dbo].[TaiKhoanDichVu] ([MaDichVu], [TenTaiKhoan], [NgayTao]) VALUES (4, N'admin', CAST(N'2018-05-19 10:20:29.907' AS DateTime))
INSERT [dbo].[TaiKhoanDichVu] ([MaDichVu], [TenTaiKhoan], [NgayTao]) VALUES (16, N'admin', CAST(N'2018-05-14 20:09:32.460' AS DateTime))
INSERT [dbo].[TaiKhoanDichVu] ([MaDichVu], [TenTaiKhoan], [NgayTao]) VALUES (17, N'admin', CAST(N'2018-05-29 19:15:22.200' AS DateTime))
INSERT [dbo].[ThongTinTaiKhoan] ([TenTaiKhoan], [HoTen], [NgaySinh], [SoDienThoai], [HinhAnh], [Email], [Tien]) VALUES (N'admin', N'Tạ Minh Luận', CAST(N'1996-12-25 17:35:15.000' AS DateTime), N'0966810905', N'22549886_2008160576097028_8541310036694794791_n.jpg', N'ngoalongtb001@gmail.com', 395000)
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LichSuDangKy]  WITH CHECK ADD  CONSTRAINT [FK__LichSuDan__MaDic__36B12243] FOREIGN KEY([MaDichVu])
REFERENCES [dbo].[DichVu] ([MaDichVu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LichSuDangKy] CHECK CONSTRAINT [FK__LichSuDan__MaDic__36B12243]
GO
ALTER TABLE [dbo].[LichSuDangKy]  WITH CHECK ADD  CONSTRAINT [FK__LichSuDan__TenTa__37A5467C] FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LichSuDangKy] CHECK CONSTRAINT [FK__LichSuDan__TenTa__37A5467C]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([MaLoaiTaiKhoan])
REFERENCES [dbo].[LoaiTaiKhoan] ([MaLoaiTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoanDichVu]  WITH CHECK ADD FOREIGN KEY([MaDichVu])
REFERENCES [dbo].[DichVu] ([MaDichVu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoanDichVu]  WITH CHECK ADD FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThongTinTaiKhoan]  WITH CHECK ADD FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [CustomerManagementApp] SET  READ_WRITE 
GO
