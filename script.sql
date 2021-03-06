USE [master]
GO
/****** Object:  Database [capstone]    Script Date: 4/8/2020 11:38:05 AM ******/
CREATE DATABASE [capstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'capstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\capstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'capstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\capstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [capstone] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [capstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [capstone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [capstone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [capstone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [capstone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [capstone] SET ARITHABORT OFF 
GO
ALTER DATABASE [capstone] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [capstone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [capstone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [capstone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [capstone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [capstone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [capstone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [capstone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [capstone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [capstone] SET  DISABLE_BROKER 
GO
ALTER DATABASE [capstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [capstone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [capstone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [capstone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [capstone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [capstone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [capstone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [capstone] SET RECOVERY FULL 
GO
ALTER DATABASE [capstone] SET  MULTI_USER 
GO
ALTER DATABASE [capstone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [capstone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [capstone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [capstone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [capstone] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'capstone', N'ON'
GO
ALTER DATABASE [capstone] SET QUERY_STORE = OFF
GO
USE [capstone]
GO
/****** Object:  Table [dbo].[tblAge_GroupDim]    Script Date: 4/8/2020 11:38:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAge_GroupDim](
	[Age_group_Id] [int] NOT NULL,
	[Age_group_desc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblAge_GroupDim] PRIMARY KEY CLUSTERED 
(
	[Age_group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBirth_rate_countFact]    Script Date: 4/8/2020 11:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBirth_rate_countFact](
	[Birth_rate_count_id] [int] NOT NULL,
	[Region_id] [int] NOT NULL,
	[Region_cod] [nvarchar](50) NOT NULL,
	[Region_desc] [nvarchar](50) NOT NULL,
	[Year] [int] NOT NULL,
	[Birth_Rate] [float] NOT NULL,
	[Birth_Count] [int] NOT NULL,
	[Type_Birth_Id] [int] NOT NULL,
	[Type_birth_desc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblBirth_rate_countFact] PRIMARY KEY CLUSTERED 
(
	[Birth_rate_count_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMatagepercentageFact]    Script Date: 4/8/2020 11:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMatagepercentageFact](
	[Matagepercentage_id] [int] NOT NULL,
	[Region_id] [int] NOT NULL,
	[Region_cod] [nvarchar](50) NOT NULL,
	[Region_desc] [nvarchar](50) NOT NULL,
	[Year] [int] NOT NULL,
	[Percentage] [float] NOT NULL,
	[Age_group_Id] [int] NOT NULL,
	[Age_group_desc] [nvarchar](50) NOT NULL,
	[Type_Birth_Id] [int] NOT NULL,
	[Type_birth_desc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMatagepercentageFact] PRIMARY KEY CLUSTERED 
(
	[Matagepercentage_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRace_EthnicitypercentageFact]    Script Date: 4/8/2020 11:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRace_EthnicitypercentageFact](
	[Race_Ethinicitypercentage_id] [int] NOT NULL,
	[Region_id] [int] NOT NULL,
	[Region_cod] [nvarchar](50) NOT NULL,
	[Region_desc] [nvarchar](50) NOT NULL,
	[Year] [int] NOT NULL,
	[Percentage] [float] NOT NULL,
	[Race_ethnicity_id] [int] NOT NULL,
	[Race_ethnicity_desc] [nvarchar](50) NOT NULL,
	[Type_Birth_Id] [int] NOT NULL,
	[Type_birth_desc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRace_EthnicitypercentageFact] PRIMARY KEY CLUSTERED 
(
	[Race_Ethinicitypercentage_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblraceethnicityDim]    Script Date: 4/8/2020 11:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblraceethnicityDim](
	[Race_ethnicity_id] [int] NOT NULL,
	[Race_ethnicity_desc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblraceethnicityDim] PRIMARY KEY CLUSTERED 
(
	[Race_ethnicity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatesDim]    Script Date: 4/8/2020 11:38:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatesDim](
	[Region_id] [int] NOT NULL,
	[Region] [nvarchar](50) NOT NULL,
	[State_desc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatesDim] PRIMARY KEY CLUSTERED 
(
	[Region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblType_birthDim]    Script Date: 4/8/2020 11:38:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblType_birthDim](
	[Type_Birth_Id] [int] NOT NULL,
	[Type_birth_desc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblType_birthDim] PRIMARY KEY CLUSTERED 
(
	[Type_Birth_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBirth_rate_countFact]  WITH CHECK ADD  CONSTRAINT [FK_tblBirth_rate_countFact_tblStatesDim] FOREIGN KEY([Region_id])
REFERENCES [dbo].[tblStatesDim] ([Region_id])
GO
ALTER TABLE [dbo].[tblBirth_rate_countFact] CHECK CONSTRAINT [FK_tblBirth_rate_countFact_tblStatesDim]
GO
ALTER TABLE [dbo].[tblBirth_rate_countFact]  WITH CHECK ADD  CONSTRAINT [FK_tblBirth_rate_countFact_tblType_birthDim] FOREIGN KEY([Type_Birth_Id])
REFERENCES [dbo].[tblType_birthDim] ([Type_Birth_Id])
GO
ALTER TABLE [dbo].[tblBirth_rate_countFact] CHECK CONSTRAINT [FK_tblBirth_rate_countFact_tblType_birthDim]
GO
ALTER TABLE [dbo].[tblMatagepercentageFact]  WITH CHECK ADD  CONSTRAINT [FK_tblMatagepercentageFact_tblAge_GroupDim] FOREIGN KEY([Age_group_Id])
REFERENCES [dbo].[tblAge_GroupDim] ([Age_group_Id])
GO
ALTER TABLE [dbo].[tblMatagepercentageFact] CHECK CONSTRAINT [FK_tblMatagepercentageFact_tblAge_GroupDim]
GO
ALTER TABLE [dbo].[tblMatagepercentageFact]  WITH CHECK ADD  CONSTRAINT [FK_tblMatagepercentageFact_tblStatesDim] FOREIGN KEY([Region_id])
REFERENCES [dbo].[tblStatesDim] ([Region_id])
GO
ALTER TABLE [dbo].[tblMatagepercentageFact] CHECK CONSTRAINT [FK_tblMatagepercentageFact_tblStatesDim]
GO
ALTER TABLE [dbo].[tblMatagepercentageFact]  WITH CHECK ADD  CONSTRAINT [FK_tblMatagepercentageFact_tblType_birthDim] FOREIGN KEY([Type_Birth_Id])
REFERENCES [dbo].[tblType_birthDim] ([Type_Birth_Id])
GO
ALTER TABLE [dbo].[tblMatagepercentageFact] CHECK CONSTRAINT [FK_tblMatagepercentageFact_tblType_birthDim]
GO
ALTER TABLE [dbo].[tblRace_EthnicitypercentageFact]  WITH CHECK ADD  CONSTRAINT [FK_tblRace_EthnicitypercentageFact_tblraceethnicityDim] FOREIGN KEY([Race_ethnicity_id])
REFERENCES [dbo].[tblraceethnicityDim] ([Race_ethnicity_id])
GO
ALTER TABLE [dbo].[tblRace_EthnicitypercentageFact] CHECK CONSTRAINT [FK_tblRace_EthnicitypercentageFact_tblraceethnicityDim]
GO
ALTER TABLE [dbo].[tblRace_EthnicitypercentageFact]  WITH CHECK ADD  CONSTRAINT [FK_tblRace_EthnicitypercentageFact_tblStatesDim] FOREIGN KEY([Region_id])
REFERENCES [dbo].[tblStatesDim] ([Region_id])
GO
ALTER TABLE [dbo].[tblRace_EthnicitypercentageFact] CHECK CONSTRAINT [FK_tblRace_EthnicitypercentageFact_tblStatesDim]
GO
ALTER TABLE [dbo].[tblRace_EthnicitypercentageFact]  WITH CHECK ADD  CONSTRAINT [FK_tblRace_EthnicitypercentageFact_tblType_birthDim] FOREIGN KEY([Type_Birth_Id])
REFERENCES [dbo].[tblType_birthDim] ([Type_Birth_Id])
GO
ALTER TABLE [dbo].[tblRace_EthnicitypercentageFact] CHECK CONSTRAINT [FK_tblRace_EthnicitypercentageFact_tblType_birthDim]
GO
USE [master]
GO
ALTER DATABASE [capstone] SET  READ_WRITE 
GO
