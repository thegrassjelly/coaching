
USE [DB_A1649D_steven321]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DB_A1649D_steven321]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 06/04/2018 1:42:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[UserPic] [nvarchar](250) NULL,
	[Birthday] [datetime] NULL,
	[EmailAdd] [nvarchar](100) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Status] [nvarchar](50) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [nchar](10) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Training]    Script Date: 06/04/2018 1:42:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Training](
	[TrainingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[GoalSetting] [nvarchar](100) NULL,
	[TrainingPackage] [nvarchar](50) NULL,
	[TrainingFee] [decimal](18, 2) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_Training] PRIMARY KEY CLUSTERED 
(
	[TrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingDetails]    Script Date: 06/04/2018 1:42:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingDetails](
	[TrainingDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[TrainingID] [int] NULL,
	[ProgressPicFront] [nvarchar](250) NULL,
	[ProgressPicSide] [nvarchar](250) NULL,
	[ProgressPicBack] [nvarchar](250) NULL,
	[Age] [int] NULL,
	[Height] [nvarchar](50) NULL,
	[Weight] [nvarchar](50) NULL,
	[Arms] [nvarchar](50) NULL,
	[Chest] [nvarchar](50) NULL,
	[Waist] [nvarchar](50) NULL,
	[Hip] [nvarchar](50) NULL,
	[Thigh] [nvarchar](50) NULL,
	[Legs] [nvarchar](50) NULL,
	[Monday] [nvarchar](50) NULL,
	[Tuesday] [nvarchar](50) NULL,
	[Wednesday] [nvarchar](50) NULL,
	[Thursday] [nvarchar](50) NULL,
	[Friday] [nvarchar](50) NULL,
	[Saturday] [nvarchar](50) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_TrainingDetails] PRIMARY KEY CLUSTERED 
(
	[TrainingDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([UserID], [FirstName], [LastName], [UserPic], [Birthday], [EmailAdd], [MobileNo], [Address], [Status], [DateAdded], [DateModified]) VALUES (1, N'Robert Steven', N'Tomas', N'1f1dbe00-b30c-4484-a267-2e95818560cb.jpg', CAST(N'1993-04-13T00:00:00.000' AS DateTime), N'steven.tomas@live.com', N'09083262024', N'Metro Manila
', N'Active', CAST(N'2018-04-04T21:43:09.303' AS DateTime), N'Apr  5 201')
INSERT [dbo].[Clients] ([UserID], [FirstName], [LastName], [UserPic], [Birthday], [EmailAdd], [MobileNo], [Address], [Status], [DateAdded], [DateModified]) VALUES (2, N'David', N'Licauco', N'2fcb3f22-44be-475f-911c-b4e2ebd90618.jpg', CAST(N'2018-04-05T00:00:00.000' AS DateTime), N'davidlicauco@email.com', N'09178798454', N'Quezon City', N'Active', CAST(N'2018-04-05T20:27:12.930' AS DateTime), N'Apr  6 201')
SET IDENTITY_INSERT [dbo].[Clients] OFF
SET IDENTITY_INSERT [dbo].[Training] ON 

INSERT [dbo].[Training] ([TrainingID], [UserID], [GoalSetting], [TrainingPackage], [TrainingFee], [DateAdded], [DateModified]) VALUES (16, 2, N'Weight Loss', N'12 Session', CAST(1.00 AS Decimal(18, 2)), CAST(N'2018-04-06T01:31:07.250' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Training] OFF
SET IDENTITY_INSERT [dbo].[TrainingDetails] ON 

INSERT [dbo].[TrainingDetails] ([TrainingDetailsID], [TrainingID], [ProgressPicFront], [ProgressPicSide], [ProgressPicBack], [Age], [Height], [Weight], [Arms], [Chest], [Waist], [Hip], [Thigh], [Legs], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [DateAdded]) VALUES (15, 16, N'5841ac91-6bf5-449f-9ade-38a4f8578732.jpg', N'e0e82aec-803f-41ba-9abd-95225b345821.jpg', N'605e72e6-cfff-4617-96c0-7484b183a739.jpg', 24, N'160', N'160', N'24', N'24', N'24', N'24', N'24', N'24', N'1', N'1', N'1', N'1', N'1', N'0', CAST(N'2018-04-06T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TrainingDetails] OFF
USE [master]
GO
ALTER DATABASE [Coaching] SET  READ_WRITE 
GO
