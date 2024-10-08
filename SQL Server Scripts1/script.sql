USE [master]
GO
/****** Object:  Database [gasStation]    Script Date: 9/30/2024 10:01:58 PM ******/
CREATE DATABASE [gasStation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gasStation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\gasStation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gasStation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\gasStation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [gasStation] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gasStation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gasStation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gasStation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gasStation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gasStation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gasStation] SET ARITHABORT OFF 
GO
ALTER DATABASE [gasStation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gasStation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gasStation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gasStation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gasStation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gasStation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gasStation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gasStation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gasStation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gasStation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gasStation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gasStation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gasStation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gasStation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gasStation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gasStation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gasStation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gasStation] SET RECOVERY FULL 
GO
ALTER DATABASE [gasStation] SET  MULTI_USER 
GO
ALTER DATABASE [gasStation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gasStation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gasStation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gasStation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gasStation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gasStation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'gasStation', N'ON'
GO
ALTER DATABASE [gasStation] SET QUERY_STORE = OFF
GO
USE [gasStation]
GO
/****** Object:  Table [dbo].[district]    Script Date: 9/30/2024 10:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[districtId] [int] IDENTITY(1,1) NOT NULL,
	[city] [nchar](15) NOT NULL,
	[state] [nchar](3) NOT NULL,
	[zipCode] [int] NOT NULL,
	[managerId] [nchar](2) NOT NULL,
 CONSTRAINT [PK_district] PRIMARY KEY CLUSTERED 
(
	[districtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[districtManager]    Script Date: 9/30/2024 10:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[districtManager](
	[firstName] [nchar](15) NOT NULL,
	[lastName] [nchar](15) NOT NULL,
	[managerId] [nchar](2) NOT NULL,
	[isHourly] [int] NOT NULL,
	[pay] [money] NOT NULL,
 CONSTRAINT [PK_districtManager] PRIMARY KEY CLUSTERED 
(
	[managerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 9/30/2024 10:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employeeId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nchar](10) NOT NULL,
	[lastName] [nchar](10) NOT NULL,
	[gasStationId] [int] NOT NULL,
	[payRate] [money] NOT NULL,
	[hireDate] [date] NOT NULL,
	[managerId] [nchar](2) NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gasStation]    Script Date: 9/30/2024 10:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gasStation](
	[gasStationId] [int] IDENTITY(1,1) NOT NULL,
	[streetAddress] [nchar](30) NOT NULL,
	[managerId] [nchar](2) NOT NULL,
	[districtId] [int] NOT NULL,
 CONSTRAINT [PK_gasStation] PRIMARY KEY CLUSTERED 
(
	[gasStationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hiringManager]    Script Date: 9/30/2024 10:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hiringManager](
	[firstName] [nchar](15) NOT NULL,
	[lastName] [nchar](15) NOT NULL,
	[managerId] [nchar](2) NOT NULL,
	[isHourly] [int] NOT NULL,
	[pay] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payroll]    Script Date: 9/30/2024 10:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payroll](
	[employeeId] [int] NOT NULL,
	[payRate] [money] NOT NULL,
	[perMonth] [money] NOT NULL,
	[perYear] [money] NOT NULL,
	[hoursYTD] [int] NOT NULL,
	[partTimeOff] [time](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storeManager]    Script Date: 9/30/2024 10:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storeManager](
	[firstName] [nchar](15) NOT NULL,
	[lastName] [nchar](15) NOT NULL,
	[managerId] [nchar](2) NOT NULL,
	[isHourly] [int] NOT NULL,
	[pay] [money] NOT NULL,
 CONSTRAINT [PK_storeManager] PRIMARY KEY CLUSTERED 
(
	[managerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[district] ON 

INSERT [dbo].[district] ([districtId], [city], [state], [zipCode], [managerId]) VALUES (1, N'Winona         ', N'MN ', 55987, N'D1')
INSERT [dbo].[district] ([districtId], [city], [state], [zipCode], [managerId]) VALUES (2, N'Redwing        ', N'MN ', 55066, N'D2')
SET IDENTITY_INSERT [dbo].[district] OFF
GO
INSERT [dbo].[districtManager] ([firstName], [lastName], [managerId], [isHourly], [pay]) VALUES (N'Todd           ', N'Howard         ', N'D1', 0, 56000.0000)
INSERT [dbo].[districtManager] ([firstName], [lastName], [managerId], [isHourly], [pay]) VALUES (N'Emilia         ', N'Oscarsson      ', N'D2', 0, 48000.0000)
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (1, N'James     ', N'McSherry  ', 1, 16.0000, CAST(N'2024-08-18' AS Date), N'H1')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (2, N'Cassandra ', N'Pineda    ', 1, 16.0000, CAST(N'2024-06-02' AS Date), N'H1')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (3, N'Stella    ', N'Mueller   ', 1, 16.7800, CAST(N'2023-04-20' AS Date), N'H1')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (4, N'Donald    ', N'McNeill   ', 1, 17.5700, CAST(N'2022-01-19' AS Date), N'H1')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (5, N'Normand   ', N'Williams  ', 1, 16.0000, CAST(N'2024-09-30' AS Date), N'H1')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (6, N'Chas      ', N'Duvall    ', 2, 16.2600, CAST(N'2024-03-16' AS Date), N'H1')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (7, N'Nina      ', N'Dunmire   ', 2, 17.0000, CAST(N'2023-09-30' AS Date), N'H1')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (8, N'Anna      ', N'McCoy     ', 2, 19.0000, CAST(N'2020-04-20' AS Date), N'H1')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (9, N'Edward    ', N'Zamora    ', 2, 16.0000, CAST(N'2024-07-28' AS Date), N'H1')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (10, N'Lettie    ', N'Miller    ', 8, 18.0000, CAST(N'2019-07-18' AS Date), N'H2')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (11, N'Gina      ', N'Collins   ', 8, 17.5000, CAST(N'2020-02-25' AS Date), N'H2')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (12, N'Justin    ', N'Rivenburg ', 8, 16.8700, CAST(N'2021-09-12' AS Date), N'H2')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (13, N'Raymond   ', N'Smather   ', 8, 17.0000, CAST(N'2022-06-11' AS Date), N'H2')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (14, N'Charles   ', N'Brown     ', 8, 16.0000, CAST(N'2024-08-22' AS Date), N'H2')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (15, N'Nannie    ', N'Wiegand   ', 9, 14.0000, CAST(N'2024-09-30' AS Date), N'H2')
INSERT [dbo].[employee] ([employeeId], [firstName], [lastName], [gasStationId], [payRate], [hireDate], [managerId]) VALUES (16, N'Gerald    ', N'Emard     ', 9, 14.5000, CAST(N'2023-09-30' AS Date), N'H2')
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
SET IDENTITY_INSERT [dbo].[gasStation] ON 

INSERT [dbo].[gasStation] ([gasStationId], [streetAddress], [managerId], [districtId]) VALUES (1, N'268 W Sarnia St               ', N'S1', 1)
INSERT [dbo].[gasStation] ([gasStationId], [streetAddress], [managerId], [districtId]) VALUES (2, N'770 E Broadway St             ', N'S1', 1)
INSERT [dbo].[gasStation] ([gasStationId], [streetAddress], [managerId], [districtId]) VALUES (3, N'872 W Broadway St             ', N'S1', 1)
INSERT [dbo].[gasStation] ([gasStationId], [streetAddress], [managerId], [districtId]) VALUES (4, N'1058 Homer Rd                 ', N'S2', 1)
INSERT [dbo].[gasStation] ([gasStationId], [streetAddress], [managerId], [districtId]) VALUES (6, N'1601 W 5th St                 ', N'S2', 1)
INSERT [dbo].[gasStation] ([gasStationId], [streetAddress], [managerId], [districtId]) VALUES (7, N'375 Conttonwood Dr            ', N'S2', 1)
INSERT [dbo].[gasStation] ([gasStationId], [streetAddress], [managerId], [districtId]) VALUES (8, N'301 W 7th St                  ', N'S3', 2)
INSERT [dbo].[gasStation] ([gasStationId], [streetAddress], [managerId], [districtId]) VALUES (9, N'915 Main St                   ', N'S3', 2)
INSERT [dbo].[gasStation] ([gasStationId], [streetAddress], [managerId], [districtId]) VALUES (10, N'4820 Great River RD           ', N'S3', 2)
SET IDENTITY_INSERT [dbo].[gasStation] OFF
GO
INSERT [dbo].[hiringManager] ([firstName], [lastName], [managerId], [isHourly], [pay]) VALUES (N'Gabe           ', N'Newell         ', N'H1', 1, 28.0000)
INSERT [dbo].[hiringManager] ([firstName], [lastName], [managerId], [isHourly], [pay]) VALUES (N'Andrew         ', N'Wilson         ', N'H2', 1, 36.0000)
GO
INSERT [dbo].[payroll] ([employeeId], [payRate], [perMonth], [perYear], [hoursYTD], [partTimeOff]) VALUES (1, 16.0000, 1920.0000, 24960.0000, 188, CAST(N'06:00:00' AS Time))
INSERT [dbo].[payroll] ([employeeId], [payRate], [perMonth], [perYear], [hoursYTD], [partTimeOff]) VALUES (2, 16.0000, 2048.0000, 26624.0000, 512, CAST(N'04:00:00' AS Time))
INSERT [dbo].[payroll] ([employeeId], [payRate], [perMonth], [perYear], [hoursYTD], [partTimeOff]) VALUES (3, 16.7800, 2684.8000, 34902.4000, 1560, CAST(N'13:00:00' AS Time))
INSERT [dbo].[payroll] ([employeeId], [payRate], [perMonth], [perYear], [hoursYTD], [partTimeOff]) VALUES (6, 16.2600, 2341.4400, 30438.7200, 1008, CAST(N'06:45:00' AS Time))
INSERT [dbo].[payroll] ([employeeId], [payRate], [perMonth], [perYear], [hoursYTD], [partTimeOff]) VALUES (7, 17.0000, 2720.0000, 35360.0000, 1560, CAST(N'20:00:00' AS Time))
INSERT [dbo].[payroll] ([employeeId], [payRate], [perMonth], [perYear], [hoursYTD], [partTimeOff]) VALUES (8, 19.0000, 3040.0000, 39520.0000, 1560, CAST(N'13:00:00' AS Time))
INSERT [dbo].[payroll] ([employeeId], [payRate], [perMonth], [perYear], [hoursYTD], [partTimeOff]) VALUES (10, 18.0000, 2160.0000, 28080.0000, 1560, CAST(N'00:00:00' AS Time))
INSERT [dbo].[payroll] ([employeeId], [payRate], [perMonth], [perYear], [hoursYTD], [partTimeOff]) VALUES (11, 17.5000, 2800.0000, 36.4000, 1560, CAST(N'04:00:00' AS Time))
INSERT [dbo].[payroll] ([employeeId], [payRate], [perMonth], [perYear], [hoursYTD], [partTimeOff]) VALUES (12, 16.8700, 1619.5200, 21053.7600, 936, CAST(N'02:00:00' AS Time))
INSERT [dbo].[payroll] ([employeeId], [payRate], [perMonth], [perYear], [hoursYTD], [partTimeOff]) VALUES (15, 14.0000, 2240.0000, 29120.0000, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[payroll] ([employeeId], [payRate], [perMonth], [perYear], [hoursYTD], [partTimeOff]) VALUES (16, 14.5000, 2320.0000, 30160.0000, 1560, CAST(N'09:00:00' AS Time))
GO
INSERT [dbo].[storeManager] ([firstName], [lastName], [managerId], [isHourly], [pay]) VALUES (N'Bill           ', N'Gates          ', N'S1', 0, 42000.0000)
INSERT [dbo].[storeManager] ([firstName], [lastName], [managerId], [isHourly], [pay]) VALUES (N'Tim            ', N'Cook           ', N'S2', 0, 36000.0000)
INSERT [dbo].[storeManager] ([firstName], [lastName], [managerId], [isHourly], [pay]) VALUES (N'Kenichiro      ', N'Yoshida        ', N'S3', 0, 32000.0000)
GO
USE [master]
GO
ALTER DATABASE [gasStation] SET  READ_WRITE 
GO
