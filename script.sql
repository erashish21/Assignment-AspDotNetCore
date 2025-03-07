USE [master]
GO
/****** Object:  Database [MyDbAPI]    Script Date: 2/5/2025 7:34:35 PM ******/
CREATE DATABASE [MyDbAPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyDbAPI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MyDbAPI.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyDbAPI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MyDbAPI_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyDbAPI] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyDbAPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyDbAPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyDbAPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyDbAPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyDbAPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyDbAPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyDbAPI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyDbAPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyDbAPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyDbAPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyDbAPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyDbAPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyDbAPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyDbAPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyDbAPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyDbAPI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyDbAPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyDbAPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyDbAPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyDbAPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyDbAPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyDbAPI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyDbAPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyDbAPI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyDbAPI] SET  MULTI_USER 
GO
ALTER DATABASE [MyDbAPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyDbAPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyDbAPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyDbAPI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MyDbAPI]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/5/2025 7:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddresses]    Script Date: 2/5/2025 7:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/5/2025 7:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_UserAddresses_UserId]    Script Date: 2/5/2025 7:34:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserAddresses_UserId] ON [dbo].[UserAddresses]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAddresses]  WITH CHECK ADD  CONSTRAINT [FK_UserAddresses_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserAddresses] CHECK CONSTRAINT [FK_UserAddresses_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [MyDbAPI] SET  READ_WRITE 
GO
