USE [master]
GO
/****** Object:  Database [s16guest44]    Script Date: 5/5/2016 6:20:03 PM ******/
CREATE DATABASE [s16guest44]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N's16guest44', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s16guest44.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N's16guest44_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s16guest44_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [s16guest44] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [s16guest44].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [s16guest44] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [s16guest44] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [s16guest44] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [s16guest44] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [s16guest44] SET ARITHABORT OFF 
GO
ALTER DATABASE [s16guest44] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [s16guest44] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [s16guest44] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [s16guest44] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [s16guest44] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [s16guest44] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [s16guest44] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [s16guest44] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [s16guest44] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [s16guest44] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [s16guest44] SET  ENABLE_BROKER 
GO
ALTER DATABASE [s16guest44] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [s16guest44] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [s16guest44] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [s16guest44] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [s16guest44] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [s16guest44] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [s16guest44] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [s16guest44] SET RECOVERY FULL 
GO
ALTER DATABASE [s16guest44] SET  MULTI_USER 
GO
ALTER DATABASE [s16guest44] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [s16guest44] SET DB_CHAINING OFF 
GO
ALTER DATABASE [s16guest44] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [s16guest44] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N's16guest44', N'ON'
GO
USE [s16guest44]
GO
/****** Object:  User [s16guest44]    Script Date: 5/5/2016 6:20:04 PM ******/
CREATE USER [s16guest44] FOR LOGIN [s16guest44] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [s16guest44]
GO
/****** Object:  StoredProcedure [dbo].[get_email]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ali Alqahtani
-- Create date: 5/1/2016
-- Description:	retrieve customer email using customer ID
-- =============================================
CREATE PROCEDURE [dbo].[get_email] 
	-- Add the parameters for the stored procedure here
	@customer_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY

		SELECT email FROM subscription WHERE customer_id = @customer_id
	END TRY
	BEGIN CATCH
		RAISERROR('there was a problem retrieving customer email',1,1);
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[get_product_id]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ali Alqahtani
-- Create date: 5/1/2016
-- Description:	retrieve product ID
-- =============================================
CREATE PROCEDURE [dbo].[get_product_id] 
	@product_name varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT product_id FROM product where @product_name = product_name
	END TRY
   
    BEGIN CATCH
		RAISERROR('Error retrieving prodct ID',1,1);
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[insert_customer]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ali Alqahtani
-- Create date: 5/1/2016
-- Description:	insert new customer into customer table
-- =============================================
CREATE PROCEDURE [dbo].[insert_customer] 
	@customer_id int,
	@first_name varchar(20),
	@last_name varchar(20),
	@company_id int
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	
	SET NOCOUNT ON;
    BEGIN TRY

		INSERT INTO customer 
		VALUES (@customer_id, @first_name, @last_name, @company_id)
	END TRY
	BEGIN CATCH
		RAISERROR('Error inserting a new customer',1,1)
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[update_version]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ali Alqahtani
-- Create date: 5/1/2016
-- Description: update vesion
-- =============================================
CREATE PROCEDURE [dbo].[update_version] 
	-- Add the parameters for the stored procedure here
	@product_id tinyint,
	@version_id tinyint,
	@new_version_num tinyint

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		UPDATE version SET version_num = @new_version_num
		WHERE product_id = @product_id AND version_id = @version_id;
	END TRY
	BEGIN CATCH
		RAISERROR('Error updating the product version',1,1);
	END CATCH
END

GO
/****** Object:  Table [dbo].[commit]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[commit](
	[commit_id] [tinyint] NOT NULL,
	[product_id] [tinyint] NOT NULL,
	[commit_date] [char](10) NOT NULL,
	[releaase_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_commit] PRIMARY KEY CLUSTERED 
(
	[commit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[company]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company](
	[company_id] [int] NOT NULL,
	[company_address_id] [smallint] NOT NULL,
	[company_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_company] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[company_address]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company_address](
	[company_address_id] [smallint] NOT NULL,
	[street] [varchar](50) NOT NULL,
	[state_id] [tinyint] NOT NULL,
	[country_id] [tinyint] NOT NULL,
	[city] [varchar](20) NOT NULL,
	[zip_code] [char](10) NOT NULL,
	[company_id] [int] NOT NULL,
 CONSTRAINT [PK_company_address] PRIMARY KEY CLUSTERED 
(
	[company_address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country](
	[country_id] [tinyint] NOT NULL,
	[country_name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] NOT NULL,
	[first_name] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NOT NULL,
	[company_id] [int] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dev_release]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dev_release](
	[dev_release_id] [tinyint] NOT NULL,
	[version_id] [tinyint] NOT NULL,
	[commit_id] [tinyint] NOT NULL,
	[product_id] [tinyint] NOT NULL,
	[dev_release_date] [varchar](10) NOT NULL,
 CONSTRAINT [PK_dev_release] PRIMARY KEY CLUSTERED 
(
	[dev_release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[download_log]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[download_log](
	[download_log_id] [int] NOT NULL,
	[subscription_id] [int] NOT NULL,
	[version_id] [tinyint] NOT NULL,
	[date] [char](10) NOT NULL,
 CONSTRAINT [PK_download_log] PRIMARY KEY CLUSTERED 
(
	[download_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feature]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[feature](
	[feature_id] [tinyint] NOT NULL,
	[feature_desc] [varchar](150) NOT NULL,
 CONSTRAINT [PK_feature] PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[phone]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phone](
	[phone_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[phone_num] [char](15) NOT NULL,
	[phone_type_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_phone] PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[phone_type]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phone_type](
	[phone_type_id] [tinyint] NOT NULL,
	[type] [varchar](10) NOT NULL,
 CONSTRAINT [PK_phone_type] PRIMARY KEY CLUSTERED 
(
	[phone_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[platform]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[platform](
	[platform_id] [tinyint] NOT NULL,
	[platform] [varchar](20) NOT NULL,
 CONSTRAINT [PK_platform] PRIMARY KEY CLUSTERED 
(
	[platform_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](50) NOT NULL,
	[describtion] [varchar](150) NOT NULL,
	[platform_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[release]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[release](
	[release_id] [tinyint] NOT NULL,
	[version_id] [tinyint] NOT NULL,
	[feature_id] [tinyint] NOT NULL,
	[release_date] [date] NOT NULL,
	[release_type] [varchar](150) NOT NULL,
	[release_num] [nchar](10) NOT NULL,
 CONSTRAINT [PK_release] PRIMARY KEY CLUSTERED 
(
	[release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[state]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[state](
	[state_id] [tinyint] NOT NULL,
	[state] [varchar](20) NOT NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[subscription]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[subscription](
	[subscription_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_subscription] PRIMARY KEY CLUSTERED 
(
	[subscription_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[version]    Script Date: 5/5/2016 6:20:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[version](
	[version_id] [tinyint] NOT NULL,
	[product_id] [tinyint] NOT NULL,
	[version_num] [varchar](10) NOT NULL,
 CONSTRAINT [PK_vesion] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[company] ([company_id], [company_address_id], [company_name]) VALUES (1, 1, N'ABC records')
INSERT [dbo].[company] ([company_id], [company_address_id], [company_name]) VALUES (2, 2, N'ZYX Corp')
INSERT [dbo].[company] ([company_id], [company_address_id], [company_name]) VALUES (3, 3, N'99 Store')
INSERT [dbo].[company_address] ([company_address_id], [street], [state_id], [country_id], [city], [zip_code], [company_id]) VALUES (1, N'123 Private Street', 1, 1, N'Los Angeles', N'91601     ', 1)
INSERT [dbo].[company_address] ([company_address_id], [street], [state_id], [country_id], [city], [zip_code], [company_id]) VALUES (2, N'348 Jinx Road', 4, 2, N'London', N'none      ', 2)
INSERT [dbo].[country] ([country_id], [country_name]) VALUES (1, N'USA')
INSERT [dbo].[country] ([country_id], [country_name]) VALUES (2, N'England')
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [company_id]) VALUES (1, N'Peter', N'Smith', 1)
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [company_id]) VALUES (2, N'Maria', N'Bounte', 2)
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [company_id]) VALUES (3, N'David', N'Sommers', 3)
INSERT [dbo].[customer] ([customer_id], [first_name], [last_name], [company_id]) VALUES (4, N'Maria', N'Bounte', 3)
INSERT [dbo].[download_log] ([download_log_id], [subscription_id], [version_id], [date]) VALUES (1, 1, 3, N'6/1/2000  ')
INSERT [dbo].[download_log] ([download_log_id], [subscription_id], [version_id], [date]) VALUES (2, 2, 3, N'3/1/2000  ')
INSERT [dbo].[download_log] ([download_log_id], [subscription_id], [version_id], [date]) VALUES (3, 3, 4, N'7/1/2000  ')
INSERT [dbo].[download_log] ([download_log_id], [subscription_id], [version_id], [date]) VALUES (4, 4, 4, N'9/1/2000  ')
INSERT [dbo].[feature] ([feature_id], [feature_desc]) VALUES (1, N'login module')
INSERT [dbo].[feature] ([feature_id], [feature_desc]) VALUES (2, N'patient registeration')
INSERT [dbo].[feature] ([feature_id], [feature_desc]) VALUES (3, N'patient profile')
INSERT [dbo].[feature] ([feature_id], [feature_desc]) VALUES (4, N'patient release form')
INSERT [dbo].[feature] ([feature_id], [feature_desc]) VALUES (5, N'physician profile')
INSERT [dbo].[feature] ([feature_id], [feature_desc]) VALUES (6, N'address verification')
INSERT [dbo].[feature] ([feature_id], [feature_desc]) VALUES (7, N'patient authentication')
INSERT [dbo].[feature] ([feature_id], [feature_desc]) VALUES (8, N'patient medication form')
INSERT [dbo].[feature] ([feature_id], [feature_desc]) VALUES (9, N'patient e-bill')
INSERT [dbo].[feature] ([feature_id], [feature_desc]) VALUES (10, N'patient reporting')
INSERT [dbo].[feature] ([feature_id], [feature_desc]) VALUES (11, N'patient reporting bug fix')
INSERT [dbo].[phone] ([phone_id], [customer_id], [phone_num], [phone_type_id]) VALUES (1, 1, N'123-485-8973   ', 1)
INSERT [dbo].[phone] ([phone_id], [customer_id], [phone_num], [phone_type_id]) VALUES (2, 2, N'1-28-397863896 ', 1)
INSERT [dbo].[phone] ([phone_id], [customer_id], [phone_num], [phone_type_id]) VALUES (3, 3, N'179-397-87968  ', 2)
INSERT [dbo].[phone] ([phone_id], [customer_id], [phone_num], [phone_type_id]) VALUES (4, 4, N'178-763-98764  ', 2)
INSERT [dbo].[phone_type] ([phone_type_id], [type]) VALUES (1, N'work')
INSERT [dbo].[phone_type] ([phone_type_id], [type]) VALUES (2, N'mobile')
INSERT [dbo].[platform] ([platform_id], [platform]) VALUES (1, N'Windows')
INSERT [dbo].[platform] ([platform_id], [platform]) VALUES (2, N'Linux')
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (1, N'EHR System', N'health records system for the patients', 1)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (2, N'EHR System', N'health records system for the patients', 1)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (3, N'EHR System', N'health records system for the patients', 1)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (4, N'EHR System', N'health records system for the patients', 1)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (5, N'EHR System', N'health records system for the patients', 1)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (6, N'EHR System', N'health records system for the patients', 1)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (7, N'EHR System', N'health records system for the patients', 2)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (8, N'EHR System', N'health records system for the patients', 2)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (9, N'EHR System', N'health records system for the patients', 2)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (10, N'EHR System', N'health records system for the patients', 2)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (11, N'EHR System', N'health records system for the patients', 2)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (12, N'EHR System', N'health records system for the patients', 2)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (13, N'EHR System', N'health records system for the patients', 1)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (14, N'EHR System', N'health records system for the patients', 1)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (15, N'EHR System', N'health records system for the patients', 1)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (16, N'EHR System', N'health records system for the patients', 1)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (17, N'EHR System', N'health records system for the patients', 2)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (18, N'EHR System', N'health records system for the patients', 2)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (19, N'EHR System', N'health records system for the patients', 2)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (20, N'EHR System', N'health records system for the patients', 2)
INSERT [dbo].[product] ([product_id], [product_name], [describtion], [platform_id]) VALUES (21, N'EHR System', N'health records system for the patients', 2)
SET IDENTITY_INSERT [dbo].[product] OFF
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (1, 1, 1, CAST(0x07240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (2, 1, 2, CAST(0x07240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (3, 1, 3, CAST(0x07240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (4, 1, 4, CAST(0x07240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (5, 1, 5, CAST(0x07240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (6, 1, 6, CAST(0x07240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (7, 2, 1, CAST(0x07240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (8, 2, 2, CAST(0x07240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (9, 2, 3, CAST(0x07240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (10, 2, 4, CAST(0x07240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (11, 2, 5, CAST(0x07240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (12, 1, 6, CAST(0x80240B00 AS Date), N'new product release', N'1.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (13, 3, 7, CAST(0x80240B00 AS Date), N'new product release', N'2.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (14, 3, 8, CAST(0x80240B00 AS Date), N'new product release', N'2.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (15, 3, 9, CAST(0x80240B00 AS Date), N'new product release', N'2.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (16, 3, 10, CAST(0x80240B00 AS Date), N'new product release', N'2.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (17, 4, 7, CAST(0x80240B00 AS Date), N'new product release', N'2.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (18, 4, 8, CAST(0x80240B00 AS Date), N'new product release', N'2.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (19, 4, 9, CAST(0x80240B00 AS Date), N'new product release', N'2.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (20, 4, 10, CAST(0x80240B00 AS Date), N'new product release', N'2.1       ')
INSERT [dbo].[release] ([release_id], [version_id], [feature_id], [release_date], [release_type], [release_num]) VALUES (21, 4, 11, CAST(0xAB240B00 AS Date), N'bug fix release', N'2.2       ')
INSERT [dbo].[state] ([state_id], [state]) VALUES (1, N'CA')
INSERT [dbo].[state] ([state_id], [state]) VALUES (2, N'NV')
INSERT [dbo].[state] ([state_id], [state]) VALUES (3, N'AZ')
INSERT [dbo].[state] ([state_id], [state]) VALUES (4, N'London')
INSERT [dbo].[subscription] ([subscription_id], [customer_id], [email]) VALUES (1, 1, N'p.smith@abc.com')
INSERT [dbo].[subscription] ([subscription_id], [customer_id], [email]) VALUES (2, 2, N'maria@zyx.com')
INSERT [dbo].[subscription] ([subscription_id], [customer_id], [email]) VALUES (3, 3, N'david.sommerset@99cents.store')
INSERT [dbo].[subscription] ([subscription_id], [customer_id], [email]) VALUES (4, 4, N'maria.bounte@99cents.store')
INSERT [dbo].[version] ([version_id], [product_id], [version_num]) VALUES (1, 1, N'1.1')
INSERT [dbo].[version] ([version_id], [product_id], [version_num]) VALUES (2, 1, N'1.2')
INSERT [dbo].[version] ([version_id], [product_id], [version_num]) VALUES (3, 1, N'2.1')
INSERT [dbo].[version] ([version_id], [product_id], [version_num]) VALUES (4, 1, N'2.2')
ALTER TABLE [dbo].[commit]  WITH CHECK ADD  CONSTRAINT [FK_commit_release] FOREIGN KEY([releaase_id])
REFERENCES [dbo].[release] ([release_id])
GO
ALTER TABLE [dbo].[commit] CHECK CONSTRAINT [FK_commit_release]
GO
ALTER TABLE [dbo].[company_address]  WITH CHECK ADD  CONSTRAINT [FK_company_address_company] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO
ALTER TABLE [dbo].[company_address] CHECK CONSTRAINT [FK_company_address_company]
GO
ALTER TABLE [dbo].[company_address]  WITH CHECK ADD  CONSTRAINT [FK_company_address_country] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([country_id])
GO
ALTER TABLE [dbo].[company_address] CHECK CONSTRAINT [FK_company_address_country]
GO
ALTER TABLE [dbo].[company_address]  WITH CHECK ADD  CONSTRAINT [FK_company_address_state] FOREIGN KEY([state_id])
REFERENCES [dbo].[state] ([state_id])
GO
ALTER TABLE [dbo].[company_address] CHECK CONSTRAINT [FK_company_address_state]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_company] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_company]
GO
ALTER TABLE [dbo].[dev_release]  WITH CHECK ADD  CONSTRAINT [FK_dev_release_vesion] FOREIGN KEY([version_id])
REFERENCES [dbo].[version] ([version_id])
GO
ALTER TABLE [dbo].[dev_release] CHECK CONSTRAINT [FK_dev_release_vesion]
GO
ALTER TABLE [dbo].[download_log]  WITH CHECK ADD  CONSTRAINT [FK_download_log_subscription] FOREIGN KEY([subscription_id])
REFERENCES [dbo].[subscription] ([subscription_id])
GO
ALTER TABLE [dbo].[download_log] CHECK CONSTRAINT [FK_download_log_subscription]
GO
ALTER TABLE [dbo].[download_log]  WITH CHECK ADD  CONSTRAINT [FK_download_log_vesion] FOREIGN KEY([version_id])
REFERENCES [dbo].[version] ([version_id])
GO
ALTER TABLE [dbo].[download_log] CHECK CONSTRAINT [FK_download_log_vesion]
GO
ALTER TABLE [dbo].[phone]  WITH CHECK ADD  CONSTRAINT [FK_phone_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[phone] CHECK CONSTRAINT [FK_phone_customer]
GO
ALTER TABLE [dbo].[phone]  WITH CHECK ADD  CONSTRAINT [FK_phone_phone] FOREIGN KEY([phone_type_id])
REFERENCES [dbo].[phone_type] ([phone_type_id])
GO
ALTER TABLE [dbo].[phone] CHECK CONSTRAINT [FK_phone_phone]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_platform] FOREIGN KEY([platform_id])
REFERENCES [dbo].[platform] ([platform_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_platform]
GO
ALTER TABLE [dbo].[release]  WITH CHECK ADD  CONSTRAINT [FK_release_feature] FOREIGN KEY([feature_id])
REFERENCES [dbo].[feature] ([feature_id])
GO
ALTER TABLE [dbo].[release] CHECK CONSTRAINT [FK_release_feature]
GO
ALTER TABLE [dbo].[release]  WITH CHECK ADD  CONSTRAINT [FK_release_vesion] FOREIGN KEY([version_id])
REFERENCES [dbo].[version] ([version_id])
GO
ALTER TABLE [dbo].[release] CHECK CONSTRAINT [FK_release_vesion]
GO
ALTER TABLE [dbo].[subscription]  WITH CHECK ADD  CONSTRAINT [FK_subscription_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[subscription] CHECK CONSTRAINT [FK_subscription_customer]
GO
ALTER TABLE [dbo].[version]  WITH CHECK ADD  CONSTRAINT [FK_vesion_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[version] CHECK CONSTRAINT [FK_vesion_product]
GO
USE [master]
GO
ALTER DATABASE [s16guest44] SET  READ_WRITE 
GO
