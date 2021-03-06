USE [master]
GO
/****** Object:  Database [library management]    Script Date: 09/06/2020 04:06:03 ص ******/
CREATE DATABASE [library management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\library.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\library_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [library management] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [library management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [library management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [library management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [library management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [library management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [library management] SET ARITHABORT OFF 
GO
ALTER DATABASE [library management] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [library management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [library management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [library management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [library management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [library management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [library management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [library management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [library management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [library management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [library management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [library management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [library management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [library management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [library management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [library management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [library management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [library management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [library management] SET  MULTI_USER 
GO
ALTER DATABASE [library management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [library management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [library management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [library management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [library management] SET DELAYED_DURABILITY = DISABLED 
GO
USE [library management]
GO
/****** Object:  Table [dbo].[tbLbook]    Script Date: 09/06/2020 04:06:04 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbLbook](
	[bookID] [int] NOT NULL,
	[booktitle] [nvarchar](max) NOT NULL,
	[bookedition] [nvarchar](50) NOT NULL,
	[bookauthor] [nvarchar](100) NOT NULL,
	[bookpublisher] [nvarchar](50) NOT NULL,
	[bookcost] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_book] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbLborrowers]    Script Date: 09/06/2020 04:06:04 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbLborrowers](
	[borrowersID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
	[studID] [int] NOT NULL,
	[staffName] [nvarchar](50) NOT NULL,
	[DueDate] [date] NOT NULL,
 CONSTRAINT [PK_borrowers] PRIMARY KEY CLUSTERED 
(
	[borrowersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbLmember]    Script Date: 09/06/2020 04:06:04 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbLmember](
	[expiryDate] [date] NOT NULL,
	[membname] [nvarchar](50) NOT NULL,
	[membID] [int] NOT NULL,
	[membaddress] [nvarchar](50) NOT NULL,
	[membtype] [nvarchar](50) NOT NULL,
	[bookID] [int] NULL,
 CONSTRAINT [PK_tbmember] PRIMARY KEY CLUSTERED 
(
	[expiryDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbLtransaction]    Script Date: 09/06/2020 04:06:04 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbLtransaction](
	[transID] [int] NOT NULL,
	[memberID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
	[duedate] [date] NOT NULL,
 CONSTRAINT [PK_tbtransaction] PRIMARY KEY CLUSTERED 
(
	[transID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [library management] SET  READ_WRITE 
GO
