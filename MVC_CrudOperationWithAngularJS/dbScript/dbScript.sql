USE [master]
GO
/****** Object:  Database [MVC_CrudOperationWithAngularJS]    Script Date: 12.04.2022 23:46:57 ******/
CREATE DATABASE [MVC_CrudOperationWithAngularJS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVC_CrudOperationWithAngularJS', FILENAME = N'C:\Users\Asus\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\MVC_CrudOperationWithAngularJS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVC_CrudOperationWithAngularJS_log', FILENAME = N'C:\Users\Asus\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\MVC_CrudOperationWithAngularJS.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVC_CrudOperationWithAngularJS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET ANSI_NULLS ON 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET ANSI_PADDING ON 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET ARITHABORT ON 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET RECOVERY FULL 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET  MULTI_USER 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET QUERY_STORE = OFF
GO
USE [MVC_CrudOperationWithAngularJS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [MVC_CrudOperationWithAngularJS]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12.04.2022 23:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [varchar](255) NOT NULL,
	[Price] [money] NULL,
	[Category] [varchar](255) NULL,
	[Manufacturer] [varchar](255) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 12.04.2022 23:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_AddRecord]    Script Date: 12.04.2022 23:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_AddRecord]

   @PName    NVARCHAR (255) ,

   @Price Money ,

   @Category    VARCHAR (255)  ,

   @Manufacturer  NVARCHAR (255) 


     as

     begin

     insert into Product values(@PName,@Price,@Category,@Manufacturer)

     end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAll]    Script Date: 12.04.2022 23:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_GetAll]

as

begin

Select * from Product

End
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetRecordByName]    Script Date: 12.04.2022 23:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_GetRecordByName]

@PName nvarchar(255)

as

begin

Select * from Product where PName=@PName

End
GO
/****** Object:  StoredProcedure [dbo].[Sp_LoginControl]    Script Date: 12.04.2022 23:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[Sp_LoginControl]  @Username    VARCHAR (255) ,@Password    VARCHAR (255) 

as

begin

Select * from UserProfile where UserName=@Username and [Password]=@Password and IsActive=1

End
GO
/****** Object:  StoredProcedure [dbo].[Sp_Product_delete]    Script Date: 12.04.2022 23:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_Product_delete]

@ID int

as

begin

delete from Product where ID=@ID

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Product_Update]    Script Date: 12.04.2022 23:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Product_Update]
@ID    INT ,

@PName    NVARCHAR (255) ,

@Price Money ,

@Category    VARCHAR (255)  ,

@Manufacturer  NVARCHAR (255) 

as

begin

update Product set PName=@PName,Price=@Price,Category=@Category,Manufacturer=@Manufacturer where ID=@ID

end
GO
USE [master]
GO
ALTER DATABASE [MVC_CrudOperationWithAngularJS] SET  READ_WRITE 
GO
