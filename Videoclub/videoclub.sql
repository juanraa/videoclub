USE [master]
GO
/****** Object:  Database [videoclub]    Script Date: 10/12/2015 23:15:41 ******/
CREATE DATABASE [videoclub]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'videoclub', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\videoclub.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'videoclub_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\videoclub_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [videoclub] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [videoclub].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [videoclub] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [videoclub] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [videoclub] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [videoclub] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [videoclub] SET ARITHABORT OFF 
GO
ALTER DATABASE [videoclub] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [videoclub] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [videoclub] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [videoclub] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [videoclub] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [videoclub] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [videoclub] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [videoclub] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [videoclub] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [videoclub] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [videoclub] SET  DISABLE_BROKER 
GO
ALTER DATABASE [videoclub] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [videoclub] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [videoclub] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [videoclub] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [videoclub] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [videoclub] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [videoclub] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [videoclub] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [videoclub] SET  MULTI_USER 
GO
ALTER DATABASE [videoclub] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [videoclub] SET DB_CHAINING OFF 
GO
ALTER DATABASE [videoclub] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [videoclub] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [videoclub]
GO
/****** Object:  StoredProcedure [dbo].[Lista]    Script Date: 10/12/2015 23:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Lista]
@Estado varchar(20)
AS
BEGIN
SELECT Titulo from Peliculas where Estado='Disponible'
END

GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 10/12/2015 23:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(100,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[APaterno] [nvarchar](50) NOT NULL,
	[AMaterno] [nvarchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Direccion] [nvarchar](50) NOT NULL,
	[Suscripcion] [nvarchar](50) NOT NULL,
	[Recargos] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 10/12/2015 23:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[Titulo] [nvarchar](50) NOT NULL,
	[Genero] [nvarchar](50) NOT NULL,
	[Estado] [nchar](20) NOT NULL,
	[Stock] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rentas]    Script Date: 10/12/2015 23:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentas](
	[idRentas] [int] IDENTITY(1,1) NOT NULL,
	[Titulos] [nvarchar](max) NOT NULL,
	[Categorias] [nvarchar](max) NOT NULL,
	[Cliente] [nvarchar](50) NOT NULL,
	[Recargos] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [videoclub] SET  READ_WRITE 
GO
