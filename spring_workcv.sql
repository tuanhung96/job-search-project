USE [master]
GO
/****** Object:  Database [spring_workcv]    Script Date: 13/7/2023 9:47:56 AM ******/
CREATE DATABASE [spring_workcv]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'spring_workcv', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\spring_workcv.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'spring_workcv_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\spring_workcv_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [spring_workcv].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [spring_workcv] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [spring_workcv] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [spring_workcv] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [spring_workcv] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [spring_workcv] SET ARITHABORT OFF 
GO
ALTER DATABASE [spring_workcv] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [spring_workcv] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [spring_workcv] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [spring_workcv] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [spring_workcv] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [spring_workcv] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [spring_workcv] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [spring_workcv] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [spring_workcv] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [spring_workcv] SET  DISABLE_BROKER 
GO
ALTER DATABASE [spring_workcv] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [spring_workcv] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [spring_workcv] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [spring_workcv] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [spring_workcv] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [spring_workcv] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [spring_workcv] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [spring_workcv] SET RECOVERY FULL 
GO
ALTER DATABASE [spring_workcv] SET  MULTI_USER 
GO
ALTER DATABASE [spring_workcv] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [spring_workcv] SET DB_CHAINING OFF 
GO
ALTER DATABASE [spring_workcv] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [spring_workcv] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'spring_workcv', N'ON'
GO
USE [spring_workcv]
GO
/****** Object:  User [Tuanhung96]    Script Date: 13/7/2023 9:47:57 AM ******/
CREATE USER [Tuanhung96] FOR LOGIN [Tuanhung96] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[applypost]    Script Date: 13/7/2023 9:47:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[applypost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [varchar](255) NULL,
	[recruitment_id] [int] NULL,
	[user_id] [int] NULL,
	[name_cv] [nvarchar](255) NULL,
	[status] [int] NULL,
	[text] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category]    Script Date: 13/7/2023 9:47:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[number_choose] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company]    Script Date: 13/7/2023 9:47:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[description] [text] NULL,
	[email] [varchar](255) NULL,
	[logo] [nvarchar](255) NULL,
	[name_company] [nvarchar](255) NULL,
	[phone_number] [varchar](255) NULL,
	[status] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cv]    Script Date: 13/7/2023 9:47:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cv](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_name] [nvarchar](255) NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[follow_company]    Script Date: 13/7/2023 9:47:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[follow_company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recruitment]    Script Date: 13/7/2023 9:47:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[recruitment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[created_at] [varchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[experience] [nvarchar](255) NULL,
	[quantity] [int] NULL,
	[rank] [nvarchar](255) NULL,
	[salary] [nvarchar](255) NULL,
	[status] [int] NULL,
	[title] [nvarchar](255) NULL,
	[type] [varchar](255) NULL,
	[views] [int] NULL,
	[category_id] [int] NULL,
	[company_id] [int] NULL,
	[deadline] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[role]    Script Date: 13/7/2023 9:47:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[save_job]    Script Date: 13/7/2023 9:47:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[save_job](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[recruitment_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 13/7/2023 9:47:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
	[password] [varchar](255) NULL,
	[phone_number] [varchar](255) NULL,
	[status] [int] NULL,
	[role_id] [int] NULL,
	[enabled] [bit] NOT NULL,
	[verification_code] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[applypost] ON 

INSERT [dbo].[applypost] ([id], [created_at], [recruitment_id], [user_id], [name_cv], [status], [text]) VALUES (1, N'2023-05-23', 1, 2, N'CV_JavaDeveloper', 1, N'Ứng tuyển lập trình viên Java')
INSERT [dbo].[applypost] ([id], [created_at], [recruitment_id], [user_id], [name_cv], [status], [text]) VALUES (2, N'2023-05-23', 2, 2, N'CV_JavaDeveloper', 1, N'Ứng tuyển lập trình viên Java')
INSERT [dbo].[applypost] ([id], [created_at], [recruitment_id], [user_id], [name_cv], [status], [text]) VALUES (5, N'2023-05-23', 5, 3, N'CV_JavaDeveloper', 1, N'Ứng tuyển lập trình viên Java')
INSERT [dbo].[applypost] ([id], [created_at], [recruitment_id], [user_id], [name_cv], [status], [text]) VALUES (7, N'2023-05-23', 1, 3, N'Ðây là tên CV', NULL, N'Ứng tuyển lập trình viên Java')
INSERT [dbo].[applypost] ([id], [created_at], [recruitment_id], [user_id], [name_cv], [status], [text]) VALUES (19, N'2023-06-04', 2, 4, N'CV.pdf', NULL, N'a')
INSERT [dbo].[applypost] ([id], [created_at], [recruitment_id], [user_id], [name_cv], [status], [text]) VALUES (20, N'2023-06-05', 3, 4, N'CV.pdf', NULL, N'a')
SET IDENTITY_INSERT [dbo].[applypost] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name], [number_choose]) VALUES (1, N'JAVA', 4)
INSERT [dbo].[category] ([id], [name], [number_choose]) VALUES (2, N'PHP', 1)
INSERT [dbo].[category] ([id], [name], [number_choose]) VALUES (3, N'NODEJS', 3)
INSERT [dbo].[category] ([id], [name], [number_choose]) VALUES (4, N'ASP .NET', 2)
INSERT [dbo].[category] ([id], [name], [number_choose]) VALUES (5, N'PYTHON', 2)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[company] ON 

INSERT [dbo].[company] ([id], [address], [description], [email], [logo], [name_company], [phone_number], [status], [user_id]) VALUES (1, NULL, NULL, NULL, N'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/FPT_Software_logo.svg/1200px-FPT_Software_logo.svg.png', N'FPT Software', NULL, NULL, 1)
INSERT [dbo].[company] ([id], [address], [description], [email], [logo], [name_company], [phone_number], [status], [user_id]) VALUES (2, NULL, NULL, NULL, N'https://mksmart.com.vn/wp-content/themes/mksmarts/images/logo.png', N'MK Smart', NULL, NULL, NULL)
INSERT [dbo].[company] ([id], [address], [description], [email], [logo], [name_company], [phone_number], [status], [user_id]) VALUES (3, NULL, NULL, NULL, N'https://www.mobifone.vn/assets/source/icons/logo-mobile2.png', N'MobiFone', NULL, NULL, NULL)
INSERT [dbo].[company] ([id], [address], [description], [email], [logo], [name_company], [phone_number], [status], [user_id]) VALUES (4, NULL, NULL, NULL, N'https://photos.prnewswire.com/prnfull/20161102/435263LOGO', N'NashTech', NULL, NULL, NULL)
INSERT [dbo].[company] ([id], [address], [description], [email], [logo], [name_company], [phone_number], [status], [user_id]) VALUES (5, NULL, NULL, NULL, N'https://onemount.com/img/OneMountWebsite.Wordmark_RGB_White.png?KcZpkDxolci7OxwYLHHqNw', N'One Mount', NULL, NULL, NULL)
INSERT [dbo].[company] ([id], [address], [description], [email], [logo], [name_company], [phone_number], [status], [user_id]) VALUES (6, NULL, NULL, NULL, N'https://i.ytimg.com/vi/TTG_gLCVT3A/hqdefault.jpg?sqp=-oaymwEjCPYBEIoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLCsVwWbeMh9v_f--9M2xMxfjddrmw', N'VNPT Technology', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[company] OFF
GO
SET IDENTITY_INSERT [dbo].[cv] ON 

INSERT [dbo].[cv] ([id], [file_name], [user_id]) VALUES (4, N'CV.pdf', 4)
INSERT [dbo].[cv] ([id], [file_name], [user_id]) VALUES (5, N'CV - Copy.pdf', 2)
SET IDENTITY_INSERT [dbo].[cv] OFF
GO
SET IDENTITY_INSERT [dbo].[recruitment] ON 

INSERT [dbo].[recruitment] ([id], [address], [created_at], [description], [experience], [quantity], [rank], [salary], [status], [title], [type], [views], [category_id], [company_id], [deadline]) VALUES (1, N'Đà Nẵng', N'2023-05-23', N'', N'1 năm', 1, N'1', N'1000$', 1, N'Tuyển lập trình viên Java', N'FULL TIME', 1, 1, 1, N'2023-06-31')
INSERT [dbo].[recruitment] ([id], [address], [created_at], [description], [experience], [quantity], [rank], [salary], [status], [title], [type], [views], [category_id], [company_id], [deadline]) VALUES (2, N'Đà Nẵng', N'2023-05-23', N'', N'1 năm', 1, N'1', N'1000$', 1, N'Tuyển lập trình viên Java', N'FULL TIME', 1, 2, 2, N'2023-06-31')
INSERT [dbo].[recruitment] ([id], [address], [created_at], [description], [experience], [quantity], [rank], [salary], [status], [title], [type], [views], [category_id], [company_id], [deadline]) VALUES (3, N'Đà Nẵng', N'2023-05-23', N'', N'1 năm', 1, N'1', N'1000$', 1, N'Tuyển lập trình viên Java', N'FULL TIME', 1, 3, 3, N'2023-06-31')
INSERT [dbo].[recruitment] ([id], [address], [created_at], [description], [experience], [quantity], [rank], [salary], [status], [title], [type], [views], [category_id], [company_id], [deadline]) VALUES (4, N'Đà Nẵng', N'2023-05-23', N'', N'1 năm', 1, N'1', N'1000$', 1, N'Tuyển lập trình viên Java', N'FULL TIME', 1, 4, 4, N'2023-06-31')
INSERT [dbo].[recruitment] ([id], [address], [created_at], [description], [experience], [quantity], [rank], [salary], [status], [title], [type], [views], [category_id], [company_id], [deadline]) VALUES (5, N'Đà Nẵng', N'2023-05-23', N'', N'1 năm', 1, N'1', N'1000$', 1, N'Tuyển lập trình viên Java', N'FULL TIME', 1, 5, 5, N'2023-06-31')
INSERT [dbo].[recruitment] ([id], [address], [created_at], [description], [experience], [quantity], [rank], [salary], [status], [title], [type], [views], [category_id], [company_id], [deadline]) VALUES (6, N'110 Tran Phu, Ha Dong', N'2023-05-23', N'abc', N'1 ', 1, NULL, N'1', NULL, N'abc', N'FULL TIME', NULL, 1, 1, N'2023-05-30')
SET IDENTITY_INSERT [dbo].[recruitment] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [role_name]) VALUES (1, N'ROLE_EMPLOYER')
INSERT [dbo].[role] ([id], [role_name]) VALUES (2, N'ROLE_CANDIDATE')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[save_job] ON 

INSERT [dbo].[save_job] ([id], [recruitment_id], [user_id]) VALUES (2, 3, 4)
INSERT [dbo].[save_job] ([id], [recruitment_id], [user_id]) VALUES (19, 3, 2)
SET IDENTITY_INSERT [dbo].[save_job] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [address], [description], [email], [full_name], [image], [password], [phone_number], [status], [role_id], [enabled], [verification_code]) VALUES (1, N'110 Tran Phu, Ha Dong', N'', N'employer@gmail.com', N'Lưu Hưng', N'http://localhost:8080/uploads/images/ava 2.jpg', N'$2a$10$bInjvzAV97DXBjzUB4bKeus9BwQqYGCcZ9Q21TwN7sXvqJj/N1wUy', N'0337785929', NULL, 1, 1, NULL)
INSERT [dbo].[users] ([id], [address], [description], [email], [full_name], [image], [password], [phone_number], [status], [role_id], [enabled], [verification_code]) VALUES (2, N'110 Tran Phu, Ha Dong', N'abc', N'candidate@gmail.com', N'Lưu Hưng', N'http://localhost:8080/uploads/images/Screenshot_3.png', N'$2a$10$bInjvzAV97DXBjzUB4bKeus9BwQqYGCcZ9Q21TwN7sXvqJj/N1wUy', N'0337785928', NULL, 2, 1, NULL)
INSERT [dbo].[users] ([id], [address], [description], [email], [full_name], [image], [password], [phone_number], [status], [role_id], [enabled], [verification_code]) VALUES (3, NULL, NULL, N'Ktrhung@gmail.com', N'Lưu Hưng', NULL, N'$2a$10$BVRrnJlEzhISELU7MJ8QaOieauHwNkjVVGNp5Mpy2RiTng52uk7.G', NULL, NULL, 2, 1, NULL)
INSERT [dbo].[users] ([id], [address], [description], [email], [full_name], [image], [password], [phone_number], [status], [role_id], [enabled], [verification_code]) VALUES (4, NULL, NULL, N'hung@gmail.com', N'Lưu Hưng', NULL, N'$2a$10$xnQsTfJrniLSn6.VGY3CEO4iqgh8YhW02F7rxWKA5SeCqIiLXU01W', NULL, NULL, 2, 1, NULL)
INSERT [dbo].[users] ([id], [address], [description], [email], [full_name], [image], [password], [phone_number], [status], [role_id], [enabled], [verification_code]) VALUES (5, NULL, NULL, N'test@gmail.com', N'candidate', NULL, N'$2a$10$bInjvzAV97DXBjzUB4bKeus9BwQqYGCcZ9Q21TwN7sXvqJj/N1wUy', NULL, NULL, 2, 1, NULL)
INSERT [dbo].[users] ([id], [address], [description], [email], [full_name], [image], [password], [phone_number], [status], [role_id], [enabled], [verification_code]) VALUES (16, NULL, NULL, N'clonegialap1@gmail.com', N'Lưu Hưng', NULL, N'$2a$10$Qf.REJALp1F7XPgxC9qIp.xhs/jj10wRx6GcHzMoGoaiGI7r11M4S', NULL, NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[applypost] ADD  DEFAULT (NULL) FOR [created_at]
GO
ALTER TABLE [dbo].[applypost] ADD  DEFAULT (NULL) FOR [recruitment_id]
GO
ALTER TABLE [dbo].[applypost] ADD  DEFAULT (NULL) FOR [name_cv]
GO
ALTER TABLE [dbo].[applypost] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[applypost] ADD  DEFAULT (NULL) FOR [text]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT (NULL) FOR [number_choose]
GO
ALTER TABLE [dbo].[company] ADD  DEFAULT (NULL) FOR [address]
GO
ALTER TABLE [dbo].[company] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[company] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[company] ADD  DEFAULT (NULL) FOR [logo]
GO
ALTER TABLE [dbo].[company] ADD  DEFAULT (NULL) FOR [name_company]
GO
ALTER TABLE [dbo].[company] ADD  DEFAULT (NULL) FOR [phone_number]
GO
ALTER TABLE [dbo].[company] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [address]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [created_at]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [experience]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [quantity]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [rank]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [salary]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [title]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [type]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [views]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [category_id]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [company_id]
GO
ALTER TABLE [dbo].[recruitment] ADD  DEFAULT (NULL) FOR [deadline]
GO
ALTER TABLE [dbo].[role] ADD  DEFAULT (NULL) FOR [role_name]
GO
ALTER TABLE [dbo].[save_job] ADD  DEFAULT (NULL) FOR [recruitment_id]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [address]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [full_name]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [image]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [password]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [phone_number]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [verification_code]
GO
ALTER TABLE [dbo].[applypost]  WITH CHECK ADD  CONSTRAINT [FK_recruitment_applypost] FOREIGN KEY([recruitment_id])
REFERENCES [dbo].[recruitment] ([id])
GO
ALTER TABLE [dbo].[applypost] CHECK CONSTRAINT [FK_recruitment_applypost]
GO
ALTER TABLE [dbo].[applypost]  WITH CHECK ADD  CONSTRAINT [FK_user_applypost] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[applypost] CHECK CONSTRAINT [FK_user_applypost]
GO
ALTER TABLE [dbo].[company]  WITH CHECK ADD  CONSTRAINT [FK_user_company] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[company] CHECK CONSTRAINT [FK_user_company]
GO
ALTER TABLE [dbo].[cv]  WITH CHECK ADD  CONSTRAINT [FK_user_cv] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[cv] CHECK CONSTRAINT [FK_user_cv]
GO
ALTER TABLE [dbo].[follow_company]  WITH CHECK ADD  CONSTRAINT [FK_company_follow] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([id])
GO
ALTER TABLE [dbo].[follow_company] CHECK CONSTRAINT [FK_company_follow]
GO
ALTER TABLE [dbo].[follow_company]  WITH CHECK ADD  CONSTRAINT [FK_user_followcompany] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[follow_company] CHECK CONSTRAINT [FK_user_followcompany]
GO
ALTER TABLE [dbo].[recruitment]  WITH CHECK ADD  CONSTRAINT [FK_category_recruitment] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[recruitment] CHECK CONSTRAINT [FK_category_recruitment]
GO
ALTER TABLE [dbo].[recruitment]  WITH CHECK ADD  CONSTRAINT [FK_company_recruitment] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([id])
GO
ALTER TABLE [dbo].[recruitment] CHECK CONSTRAINT [FK_company_recruitment]
GO
ALTER TABLE [dbo].[save_job]  WITH CHECK ADD  CONSTRAINT [FK_recruitment_savejob] FOREIGN KEY([recruitment_id])
REFERENCES [dbo].[recruitment] ([id])
GO
ALTER TABLE [dbo].[save_job] CHECK CONSTRAINT [FK_recruitment_savejob]
GO
ALTER TABLE [dbo].[save_job]  WITH CHECK ADD  CONSTRAINT [FK_user_savejob] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[save_job] CHECK CONSTRAINT [FK_user_savejob]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_role_users] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_role_users]
GO
USE [master]
GO
ALTER DATABASE [spring_workcv] SET  READ_WRITE 
GO
