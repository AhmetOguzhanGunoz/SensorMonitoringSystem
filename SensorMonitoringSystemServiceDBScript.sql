USE [master]
GO
/****** Object:  Database [SensorMonitoringSystem]    Script Date: 25.12.2017 12:23:03 ******/
CREATE DATABASE [SensorMonitoringSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SensorMonitoringSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.DEVICE01\MSSQL\DATA\SensorMonitoringSystem.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SensorMonitoringSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.DEVICE01\MSSQL\DATA\SensorMonitoringSystem_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SensorMonitoringSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SensorMonitoringSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SensorMonitoringSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SensorMonitoringSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SensorMonitoringSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SensorMonitoringSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SensorMonitoringSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SensorMonitoringSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [SensorMonitoringSystem] SET  MULTI_USER 
GO
ALTER DATABASE [SensorMonitoringSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SensorMonitoringSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SensorMonitoringSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SensorMonitoringSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SensorMonitoringSystem', N'ON'
GO
USE [SensorMonitoringSystem]
GO
/****** Object:  Schema [SystemMaster]    Script Date: 25.12.2017 12:23:03 ******/
CREATE SCHEMA [SystemMaster]
GO
/****** Object:  StoredProcedure [SystemMaster].[DataRegistration]    Script Date: 25.12.2017 12:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [SystemMaster].[DataRegistration]
(
@OkunanDeger as decimal(5,2), @OkunanDegerZamani as datetime, @SensorID as int
)
AS
INSERT INTO SystemMaster.[SensorsDatas]([ReadValue],[ReadValueTime],[SensorID])
VALUES (@OkunanDeger,@OkunanDegerZamani,@SensorID)

GO
/****** Object:  StoredProcedure [SystemMaster].[SensorRegistration]    Script Date: 25.12.2017 12:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [SystemMaster].[SensorRegistration]
(
@KurumID as int, @SensorTipi as nvarchar (30), @SensorAdresi as nvarchar(200), 
@KucukGrafikDegeri as int, @BuyukGrafikDegeri as int,
@KucukKritikDegeri as decimal(5,2), @BuyukKritikDegeri as decimal(5,2),
@SensorBirimi as nvarchar(10)
)
AS
INSERT INTO SystemMaster.[Sensors](
[CompanyID],[SensorDescription],[SensorAddress],[GraphicalMinValue],
[GraphicalMaxValue],[LowestCriticalValue],[HighestCriticalValue],[SensorUnit])
VALUES (
@KurumID,@SensorTipi,@SensorAdresi,@KucukGrafikDegeri,
@BuyukGrafikDegeri,@KucukKritikDegeri,@BuyukKritikDegeri,@SensorBirimi)

GO
/****** Object:  Table [SystemMaster].[Companies]    Script Date: 25.12.2017 12:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SystemMaster].[Companies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [SystemMaster].[Sensors]    Script Date: 25.12.2017 12:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SystemMaster].[Sensors](
	[SensorID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[SensorDescription] [nvarchar](30) NOT NULL,
	[SensorAddress] [nvarchar](200) NOT NULL,
	[GraphicalMinValue] [int] NOT NULL,
	[GraphicalMaxValue] [int] NOT NULL,
	[LowestCriticalValue] [decimal](5, 2) NOT NULL,
	[HighestCriticalValue] [decimal](5, 2) NOT NULL,
	[SensorUnit] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SensorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [SystemMaster].[SensorsDatas]    Script Date: 25.12.2017 12:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SystemMaster].[SensorsDatas](
	[DataID] [int] IDENTITY(1,1) NOT NULL,
	[SensorID] [int] NOT NULL,
	[ReadValue] [decimal](5, 2) NOT NULL,
	[ReadValueTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [SystemMaster].[Users]    Script Date: 25.12.2017 12:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [SystemMaster].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Surname] [nvarchar](30) NOT NULL,
	[PhoneNumber] [varchar](10) NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[IsActivated] [bit] NOT NULL,
	[RegistrationCode] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [SystemMaster].[UsersDetails]    Script Date: 25.12.2017 12:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SystemMaster].[UsersDetails](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[City] [nvarchar](20) NOT NULL,
	[Adress] [nvarchar](200) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [SystemMaster].[DatasBetweenDates]    Script Date: 25.12.2017 12:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [SystemMaster].[DatasBetweenDates]
(
@SensorID as int,@Date1 as datetime, @Date2 as datetime
)
RETURNS TABLE
AS
	RETURN
(
	SELECT TOP 100 PERCENT [DataID],[SensorID],[ReadValue],[ReadValueTime] FROM SystemMaster.[SensorsDatas] WHERE [SensorID] = @SensorID AND 
	[ReadValueTime] BETWEEN @Date1 AND @Date2 ORDER BY [ReadValueTime] ASC
)

GO
ALTER TABLE [SystemMaster].[Sensors]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [SystemMaster].[Companies] ([CompanyID])
GO
ALTER TABLE [SystemMaster].[SensorsDatas]  WITH CHECK ADD FOREIGN KEY([SensorID])
REFERENCES [SystemMaster].[Sensors] ([SensorID])
GO
ALTER TABLE [SystemMaster].[Users]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [SystemMaster].[Companies] ([CompanyID])
GO
ALTER TABLE [SystemMaster].[UsersDetails]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [SystemMaster].[Users] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [SensorMonitoringSystem] SET  READ_WRITE 
GO
