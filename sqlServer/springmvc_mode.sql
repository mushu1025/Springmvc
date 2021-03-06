USE [db_zsl]
GO
/****** Object:  User [yangjun]    Script Date: 08/05/2017 17:44:48 ******/
CREATE USER [yangjun] FOR LOGIN [yangjun] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[functionmenu]    Script Date: 08/05/2017 17:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[functionmenu](
	[id] [int] NOT NULL,
	[fparentid] [int] NOT NULL,
	[name] [varchar](max) NOT NULL,
	[url] [varchar](max) NULL,
	[iconCls] [varchar](max) NULL,
 CONSTRAINT [PK_functionmenu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_t]    Script Date: 08/05/2017 17:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_t](
	[id] [bigint] NULL,
	[user_name] [varchar](50) NULL,
	[password] [varchar](max) NULL,
	[age] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tuser]    Script Date: 08/05/2017 17:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tuser](
	[ID] [varchar](50) NULL,
	[NAME] [varchar](max) NULL,
	[PWD] [varchar](max) NULL,
	[CREATE_TIME] [date] NULL,
	[UPDATE_TIME] [date] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_User]    Script Date: 08/05/2017 17:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_User](
	[FuserId] [int] NOT NULL,
	[FstraffId] [int] NULL,
	[FuserName] [varchar](max) NULL,
	[Fpassword] [varchar](max) NULL,
	[FroleId] [int] NULL,
	[Fmodifier] [varchar](max) NULL,
	[FmodifyTime] [datetime] NULL,
 CONSTRAINT [PK_T_USER] PRIMARY KEY CLUSTERED 
(
	[FuserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Role]    Script Date: 08/05/2017 17:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Role](
	[FroleId] [int] NOT NULL,
	[FroleName] [varchar](max) NULL,
	[FparentId] [int] NULL,
	[Functionitemids] [varchar](max) NULL,
	[Fmodifier] [varchar](max) NULL,
	[FmodifyTime] [datetime] NULL,
 CONSTRAINT [PK_T_ROLE] PRIMARY KEY CLUSTERED 
(
	[FroleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_FunctionItem]    Script Date: 08/05/2017 17:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_FunctionItem](
	[FitemId] [int] NOT NULL,
	[FitemName] [varchar](max) NULL,
	[FparentId] [int] NULL,
	[Furl] [varchar](max) NULL,
	[FunctionType] [int] NULL,
	[iconcls] [varchar](max) NULL,
	[Fmodifier] [varchar](max) NULL,
	[FmodifyTime] [datetime] NULL,
 CONSTRAINT [PK_T_FUNCTIONITEM] PRIMARY KEY CLUSTERED 
(
	[FitemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[P_maxID]    Script Date: 08/05/2017 17:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE
PROC [dbo].[P_maxID] @TabName varchar(40)
AS  
declare @A varchar(20)
declare @sql Nvarchar(200) 
select @A=column_name from information_schema.columns
     where table_name=@TabName and ordinal_position=1
set @sql=N'select max('+ @A +')+1 as id from '+@TabName
exec sp_executesql @sql
GO
/****** Object:  Table [dbo].[M_user_item]    Script Date: 08/05/2017 17:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_user_item](
	[Mid] [int] NOT NULL,
	[FroleId] [int] NULL,
	[FitemId] [int] NULL,
	[Fmodifier] [varchar](max) NULL,
	[FmodifyTime] [datetime] NULL,
 CONSTRAINT [PK_M_USER_ITEM] PRIMARY KEY CLUSTERED 
(
	[Mid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [T_FK1]    Script Date: 08/05/2017 17:44:48 ******/
ALTER TABLE [dbo].[M_user_item]  WITH CHECK ADD  CONSTRAINT [T_FK1] FOREIGN KEY([FroleId])
REFERENCES [dbo].[T_Role] ([FroleId])
GO
ALTER TABLE [dbo].[M_user_item] CHECK CONSTRAINT [T_FK1]
GO
/****** Object:  ForeignKey [T_FK2]    Script Date: 08/05/2017 17:44:48 ******/
ALTER TABLE [dbo].[M_user_item]  WITH CHECK ADD  CONSTRAINT [T_FK2] FOREIGN KEY([FitemId])
REFERENCES [dbo].[T_FunctionItem] ([FitemId])
GO
ALTER TABLE [dbo].[M_user_item] CHECK CONSTRAINT [T_FK2]
GO
