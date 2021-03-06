USE [master]
GO
/****** Object:  Database [EIDdb]    Script Date: 08/15/2012 16:40:49 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'EIDdb')
BEGIN
CREATE DATABASE [EIDdb] ON  PRIMARY 
( NAME = N'EIDdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\EIDdb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EIDdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\EIDdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [EIDdb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EIDdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EIDdb] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [EIDdb] SET ANSI_NULLS OFF
GO
ALTER DATABASE [EIDdb] SET ANSI_PADDING OFF
GO
ALTER DATABASE [EIDdb] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [EIDdb] SET ARITHABORT OFF
GO
ALTER DATABASE [EIDdb] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [EIDdb] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [EIDdb] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [EIDdb] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [EIDdb] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [EIDdb] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [EIDdb] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [EIDdb] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [EIDdb] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [EIDdb] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [EIDdb] SET  DISABLE_BROKER
GO
ALTER DATABASE [EIDdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [EIDdb] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [EIDdb] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [EIDdb] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [EIDdb] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [EIDdb] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [EIDdb] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [EIDdb] SET  READ_WRITE
GO
ALTER DATABASE [EIDdb] SET RECOVERY FULL
GO
ALTER DATABASE [EIDdb] SET  MULTI_USER
GO
ALTER DATABASE [EIDdb] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [EIDdb] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'EIDdb', N'ON'
GO
USE [EIDdb]
GO
/****** Object:  ForeignKey [FK_Volunteer_Staff]    Script Date: 08/15/2012 16:40:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Volunteer_Staff]') AND parent_object_id = OBJECT_ID(N'[dbo].[Volunteer]'))
ALTER TABLE [dbo].[Volunteer] DROP CONSTRAINT [FK_Volunteer_Staff]
GO
/****** Object:  ForeignKey [FK_Resident_Staff]    Script Date: 08/15/2012 16:40:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Resident_Staff]') AND parent_object_id = OBJECT_ID(N'[dbo].[Resident]'))
ALTER TABLE [dbo].[Resident] DROP CONSTRAINT [FK_Resident_Staff]
GO
/****** Object:  ForeignKey [FK_Item_Purchase]    Script Date: 08/15/2012 16:40:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Purchase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Item_Purchase]
GO
/****** Object:  ForeignKey [FK_Account_Staff]    Script Date: 08/15/2012 16:40:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_Staff]') AND parent_object_id = OBJECT_ID(N'[dbo].[Account]'))
ALTER TABLE [dbo].[Account] DROP CONSTRAINT [FK_Account_Staff]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 08/15/2012 16:40:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
DROP TABLE [dbo].[Account]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 08/15/2012 16:40:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Item]') AND type in (N'U'))
DROP TABLE [dbo].[Item]
GO
/****** Object:  Table [dbo].[Resident]    Script Date: 08/15/2012 16:40:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resident]') AND type in (N'U'))
DROP TABLE [dbo].[Resident]
GO
/****** Object:  Table [dbo].[Volunteer]    Script Date: 08/15/2012 16:40:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Volunteer]') AND type in (N'U'))
DROP TABLE [dbo].[Volunteer]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 08/15/2012 16:40:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Staff]') AND type in (N'U'))
DROP TABLE [dbo].[Staff]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 08/15/2012 16:40:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Purchase]') AND type in (N'U'))
DROP TABLE [dbo].[Purchase]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 08/15/2012 16:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Purchase]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Purchase](
	[Purchase_id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NULL,
	[Date_required] [date] NULL,
	[Pur_date] [date] NULL,
	[DateOfDelivery] [date] NULL,
	[Remark] [varchar](50) NULL,
	[Staff_no] [int] NULL,
	[Vol_no] [int] NULL,
	[Resident_no] [int] NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[Purchase_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase] ON
INSERT [dbo].[Purchase] ([Purchase_id], [Status], [Date_required], [Pur_date], [DateOfDelivery], [Remark], [Staff_no], [Vol_no], [Resident_no]) VALUES (1, N'processing', NULL, CAST(0xFC350B00 AS Date), CAST(0xFD350B00 AS Date), N'Urgent', 2, 1, 2)
INSERT [dbo].[Purchase] ([Purchase_id], [Status], [Date_required], [Pur_date], [DateOfDelivery], [Remark], [Staff_no], [Vol_no], [Resident_no]) VALUES (2, N'processing', NULL, CAST(0xFB350B00 AS Date), CAST(0x04360B00 AS Date), NULL, 3, 2, 1)
INSERT [dbo].[Purchase] ([Purchase_id], [Status], [Date_required], [Pur_date], [DateOfDelivery], [Remark], [Staff_no], [Vol_no], [Resident_no]) VALUES (3, N'processing', NULL, CAST(0xFD350B00 AS Date), CAST(0x04360B00 AS Date), NULL, 2, 3, 1)
INSERT [dbo].[Purchase] ([Purchase_id], [Status], [Date_required], [Pur_date], [DateOfDelivery], [Remark], [Staff_no], [Vol_no], [Resident_no]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Purchase] OFF
/****** Object:  Table [dbo].[Staff]    Script Date: 08/15/2012 16:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Staff]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Staff](
	[Staff_no] [int] IDENTITY(1,1) NOT NULL,
	[Staff_name] [varchar](60) NULL,
	[NRIC] [varchar](9) NULL,
	[Contact_no] [int] NULL,
	[Address] [varchar](100) NULL,
	[DOB] [date] NULL,
	[Gender] [char](1) NULL,
	[Email] [varchar](45) NULL,
	[Ethnic_Group] [varchar](20) NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Staff_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (1, N'Han Xu', N'G2397321U', 81233121, N'Ang Mo Kio Ave 1  #03-131 Square COURT', CAST(0x80170B00 AS Date), N'M', N'as1231@qq.com', N'Chinese', NULL)
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (2, N'Wu Xex', N'G2339431U', 82333121, N'Ang Mo Kio Ave 1  #03-131 Square COURT', CAST(0x781A0B00 AS Date), N'M', N'56tyh@gmail.com', N'Chinese', NULL)
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (3, N'Marcus Hong', N'G1231321U', 34211121, N'Bishan Street 14 #04-310 Sawa COURT', CAST(0x52140B00 AS Date), N'M', N'peterLinh@hotmail.com', N'Chinese', NULL)
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (4, N'Hong kiat Seng', N'G6539321U', 87542132, N'Tampines Industrial Ave 5 ', CAST(0x7F140B00 AS Date), N'M', N'kenSc@sb.com', N'Chinese', NULL)
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (5, N'Kitty', N'G1233421U', 83412132, N'32 DUKU ROAD#04-03 HARMONY MANSIONS ', CAST(0x5E100B00 AS Date), N'F', N'akeas@qq.com', N'Chinese', NULL)
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (6, N'Hello Kitty', N'G5463421X', 34112132, N'130 TAMPINES STREET 11 #12-324 TAMPINES COURT', CAST(0x53150B00 AS Date), N'M', N'keasdc@hotmail.com', N'Chinese', NULL)
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (7, N'Mickey Duck', N'G5445121X', 83465232, N'120 TAMPINES STREET 11 #04-310 TAMPINES COURT', CAST(0x420B0B00 AS Date), N'M', N'Kenajol@hotmail.com', N'Chinese', NULL)
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (10, N'pokemon pokemon', N'S451478Z', 4564564, N'456123', CAST(0xB2350B00 AS Date), N'M', N'lala@lala.com', N'Malay', N'asdada')
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (11, N'pokemon pokemon', N'S123131A', 1231231, N'pokemon center', CAST(0xB2350B00 AS Date), N'M', N'12312@hotmail.com', N'Malay', N'a')
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (12, N'hello pikachu', N'S8412154Z', 123456, N'123456', CAST(0xB2350B00 AS Date), N'M', N'123456@123456.com', N'Malay', N'123456')
INSERT [dbo].[Staff] ([Staff_no], [Staff_name], [NRIC], [Contact_no], [Address], [DOB], [Gender], [Email], [Ethnic_Group], [Description]) VALUES (13, N'pokemon Pokemon', N'S4545412Z', 91469701, N'pokemon center', CAST(0xB2350B00 AS Date), N'M', N'adasd@hotmail.com', N'Malay', N'asdada')
SET IDENTITY_INSERT [dbo].[Staff] OFF
/****** Object:  Table [dbo].[Volunteer]    Script Date: 08/15/2012 16:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Volunteer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Volunteer](
	[Vol_no] [int] IDENTITY(1,1) NOT NULL,
	[Vol_Name] [varchar](60) NULL,
	[NRIC] [varchar](9) NULL,
	[Address] [varchar](100) NULL,
	[Contact_no] [int] NULL,
	[Email] [varchar](60) NULL,
	[Available_day] [varchar](150) NULL,
	[Description] [varchar](100) NULL,
	[Remark] [varchar](100) NULL,
	[Staff_no] [int] NULL,
	[Avaliable_Time] [varchar](150) NULL,
 CONSTRAINT [PK_Volunteer] PRIMARY KEY CLUSTERED 
(
	[Vol_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Volunteer] ON
INSERT [dbo].[Volunteer] ([Vol_no], [Vol_Name], [NRIC], [Address], [Contact_no], [Email], [Available_day], [Description], [Remark], [Staff_no], [Avaliable_Time]) VALUES (1, N'Nicole Nicholas', N'F3191212G', N'1 Fullerton Square', 97339594, N'Fiasa@gmail.com', N'Monday, Wedensday, Friday', N'passionate', N'NIL', 1, N'Morning (8am - 12pm)')
INSERT [dbo].[Volunteer] ([Vol_no], [Vol_Name], [NRIC], [Address], [Contact_no], [Email], [Available_day], [Description], [Remark], [Staff_no], [Avaliable_Time]) VALUES (2, N'Michelle Alex', N'F3112311F', N'170 Bencoolen Street, Singapore 189657', 65932888, N'12334165@qq.com', N'Sunday, Tuesday', N'NIL', N'NIL', 1, N'Morning (8am - 12pm)')
INSERT [dbo].[Volunteer] ([Vol_no], [Vol_Name], [NRIC], [Address], [Contact_no], [Email], [Available_day], [Description], [Remark], [Staff_no], [Avaliable_Time]) VALUES (3, N'lee Yusri', N'G2121341S', N'190 Orchard Boulevard', 67341110, N'asd12@gmail.com', N'Sunday, Tuesday', N'passionate', N'NIL', 2, N'Afternoon (12pm - 6pm)')
INSERT [dbo].[Volunteer] ([Vol_no], [Vol_Name], [NRIC], [Address], [Contact_no], [Email], [Available_day], [Description], [Remark], [Staff_no], [Avaliable_Time]) VALUES (4, N'zena Anil', N'G1232141S', N'378 Alexandra Rd, Singapore 159964', 97878121, N'6541165@qq.com', N'Sunday, Tuesday', N'NIL', N'NIL', 3, N'Night (6pm - 11pm)')
SET IDENTITY_INSERT [dbo].[Volunteer] OFF
/****** Object:  Table [dbo].[Resident]    Script Date: 08/15/2012 16:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resident]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Resident](
	[Resident_no] [int] IDENTITY(1,1) NOT NULL,
	[Resident_name] [varchar](60) NULL,
	[NRIC] [varchar](9) NULL,
	[Address] [varchar](100) NULL,
	[DOB] [date] NULL,
	[Ethic_group] [varchar](20) NULL,
	[Des_of_disabiliy] [varchar](100) NULL,
	[Remarks] [varchar](50) NULL,
	[Staff_no] [int] NULL,
	[Gender] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Contact_no] [int] NULL,
 CONSTRAINT [PK_Resident] PRIMARY KEY CLUSTERED 
(
	[Resident_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Resident] ON
INSERT [dbo].[Resident] ([Resident_no], [Resident_name], [NRIC], [Address], [DOB], [Ethic_group], [Des_of_disabiliy], [Remarks], [Staff_no], [Gender], [Email], [Contact_no]) VALUES (1, N'Mikey Kitty', N'G0756515F', N'150 Tanglin Road, Singapore 247969', CAST(0xF7190B00 AS Date), N'98810011', N'One and a half leg ...', N'good', 2, N'Female', N'45sda@qq.com', 98810011)
INSERT [dbo].[Resident] ([Resident_no], [Resident_name], [NRIC], [Address], [DOB], [Ethic_group], [Des_of_disabiliy], [Remarks], [Staff_no], [Gender], [Email], [Contact_no]) VALUES (3, N'Siena 1231', N'G2123116U', N'Queens TownT BLK 491C TAMPINES STREET 45 #03-218 SINGAPORE 522491', CAST(0xC7180B00 AS Date), N'92123123', N'legs disableasdasda', N'good', 3, N'Female', N'allen@hotmail.com', 92123123)
INSERT [dbo].[Resident] ([Resident_no], [Resident_name], [NRIC], [Address], [DOB], [Ethic_group], [Des_of_disabiliy], [Remarks], [Staff_no], [Gender], [Email], [Contact_no]) VALUES (4, N'Goh KiaSeng Lin', N'G2123122U', N'NULLAPT BLK 491C TAMPINES STREET 45 #03-218 SINGAPORE 522491', CAST(0x5A170B00 AS Date), N'Chinese', N'Mad', N'good', 2, N'Female', N'marcus@qq.com', 92423213)
INSERT [dbo].[Resident] ([Resident_no], [Resident_name], [NRIC], [Address], [DOB], [Ethic_group], [Des_of_disabiliy], [Remarks], [Staff_no], [Gender], [Email], [Contact_no]) VALUES (9, N'haha1231', N'5446', N'asdas', CAST(0xB5180B00 AS Date), N'33587856', N'asdas', NULL, 4, N'Male', N'asdas@qq.com', 33587856)
INSERT [dbo].[Resident] ([Resident_no], [Resident_name], [NRIC], [Address], [DOB], [Ethic_group], [Des_of_disabiliy], [Remarks], [Staff_no], [Gender], [Email], [Contact_no]) VALUES (11, N'Sheailun', N'G0758151U', N'asdasasda #', CAST(0x3A170B00 AS Date), N'12125758', N'asdasda', NULL, 4, N'Female', N'sdassd@qq.com', 12125758)
SET IDENTITY_INSERT [dbo].[Resident] OFF
/****** Object:  Table [dbo].[Item]    Script Date: 08/15/2012 16:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Item]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Item](
	[Item_no] [int] IDENTITY(1,1) NOT NULL,
	[Item_name] [varchar](45) NULL,
	[Quantity] [varchar](50) NULL,
	[Short_description] [varchar](50) NULL,
	[Purchase_id] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Item_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON
INSERT [dbo].[Item] ([Item_no], [Item_name], [Quantity], [Short_description], [Purchase_id]) VALUES (2, N'apple', N'4', N'red one pls', NULL)
INSERT [dbo].[Item] ([Item_no], [Item_name], [Quantity], [Short_description], [Purchase_id]) VALUES (3, N'banana', N'5', NULL, NULL)
INSERT [dbo].[Item] ([Item_no], [Item_name], [Quantity], [Short_description], [Purchase_id]) VALUES (4, N'orange', N'3', N'small ', NULL)
INSERT [dbo].[Item] ([Item_no], [Item_name], [Quantity], [Short_description], [Purchase_id]) VALUES (5, N'mango', N'3', N'small ', NULL)
SET IDENTITY_INSERT [dbo].[Item] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 08/15/2012 16:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Account](
	[Username] [varchar](16) NOT NULL,
	[Password] [varchar](16) NULL,
	[Staff_no] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Username], [Password], [Staff_no]) VALUES (N'AAS', N'AAS', 4)
INSERT [dbo].[Account] ([Username], [Password], [Staff_no]) VALUES (N'Admin', N'Admin', 1)
INSERT [dbo].[Account] ([Username], [Password], [Staff_no]) VALUES (N'edia', N'edia', 6)
INSERT [dbo].[Account] ([Username], [Password], [Staff_no]) VALUES (N'Hello', N'Kitty', 2)
INSERT [dbo].[Account] ([Username], [Password], [Staff_no]) VALUES (N'KidAs', N'KidAs', 3)
INSERT [dbo].[Account] ([Username], [Password], [Staff_no]) VALUES (N'Kitty', N'Kitty', 5)
INSERT [dbo].[Account] ([Username], [Password], [Staff_no]) VALUES (N'Mickey Duck', N'MickeyDuck', 7)
/****** Object:  ForeignKey [FK_Volunteer_Staff]    Script Date: 08/15/2012 16:40:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Volunteer_Staff]') AND parent_object_id = OBJECT_ID(N'[dbo].[Volunteer]'))
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer_Staff] FOREIGN KEY([Staff_no])
REFERENCES [dbo].[Staff] ([Staff_no])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Volunteer_Staff]') AND parent_object_id = OBJECT_ID(N'[dbo].[Volunteer]'))
ALTER TABLE [dbo].[Volunteer] CHECK CONSTRAINT [FK_Volunteer_Staff]
GO
/****** Object:  ForeignKey [FK_Resident_Staff]    Script Date: 08/15/2012 16:40:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Resident_Staff]') AND parent_object_id = OBJECT_ID(N'[dbo].[Resident]'))
ALTER TABLE [dbo].[Resident]  WITH CHECK ADD  CONSTRAINT [FK_Resident_Staff] FOREIGN KEY([Staff_no])
REFERENCES [dbo].[Staff] ([Staff_no])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Resident_Staff]') AND parent_object_id = OBJECT_ID(N'[dbo].[Resident]'))
ALTER TABLE [dbo].[Resident] CHECK CONSTRAINT [FK_Resident_Staff]
GO
/****** Object:  ForeignKey [FK_Item_Purchase]    Script Date: 08/15/2012 16:40:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Purchase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Purchase] FOREIGN KEY([Purchase_id])
REFERENCES [dbo].[Purchase] ([Purchase_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Purchase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Purchase]
GO
/****** Object:  ForeignKey [FK_Account_Staff]    Script Date: 08/15/2012 16:40:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_Staff]') AND parent_object_id = OBJECT_ID(N'[dbo].[Account]'))
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Staff] FOREIGN KEY([Staff_no])
REFERENCES [dbo].[Staff] ([Staff_no])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_Staff]') AND parent_object_id = OBJECT_ID(N'[dbo].[Account]'))
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Staff]
GO
