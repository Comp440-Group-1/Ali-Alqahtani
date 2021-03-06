USE [s16guest44]
GO
/****** Object:  Table [dbo].[commit]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[company]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[company_address]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[country]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[customer]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[dev_release]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[download_log]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[feature]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[phone]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[phone_type]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[platform]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[product]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[release]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[state]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[subscription]    Script Date: 5/5/2016 5:53:53 PM ******/
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
/****** Object:  Table [dbo].[version]    Script Date: 5/5/2016 5:53:53 PM ******/
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
