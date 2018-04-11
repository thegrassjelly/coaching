USE [master]
GO
/****** Object:  Database [Coaching]    Script Date: 11/04/2018 5:38:54 PM ******/
CREATE DATABASE [Coaching]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Coaching', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLDEV17\MSSQL\DATA\Coaching.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Coaching_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLDEV17\MSSQL\DATA\Coaching_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Coaching] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Coaching].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Coaching] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Coaching] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Coaching] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Coaching] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Coaching] SET ARITHABORT OFF 
GO
ALTER DATABASE [Coaching] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Coaching] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Coaching] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Coaching] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Coaching] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Coaching] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Coaching] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Coaching] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Coaching] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Coaching] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Coaching] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Coaching] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Coaching] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Coaching] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Coaching] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Coaching] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Coaching] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Coaching] SET RECOVERY FULL 
GO
ALTER DATABASE [Coaching] SET  MULTI_USER 
GO
ALTER DATABASE [Coaching] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Coaching] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Coaching] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Coaching] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Coaching] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Coaching', N'ON'
GO
ALTER DATABASE [Coaching] SET QUERY_STORE = OFF
GO
USE [Coaching]
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
USE [Coaching]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 11/04/2018 5:38:55 PM ******/
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
/****** Object:  Table [dbo].[Training]    Script Date: 11/04/2018 5:38:55 PM ******/
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
/****** Object:  Table [dbo].[TrainingDetails]    Script Date: 11/04/2018 5:38:55 PM ******/
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
/****** Object:  Table [dbo].[Workout]    Script Date: 11/04/2018 5:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workout](
	[WorkoutID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[SessionNumber] [nchar](10) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_Workout] PRIMARY KEY CLUSTERED 
(
	[WorkoutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkoutDetails]    Script Date: 11/04/2018 5:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkoutDetails](
	[WorkoutDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[WorkoutID] [int] NULL,
	[UserID] [int] NULL,
	[BodyPart] [nvarchar](100) NULL,
	[WorkoutName] [nvarchar](100) NULL,
	[Weight] [nvarchar](50) NULL,
	[Repetitions] [nvarchar](10) NULL,
	[Sets] [nvarchar](10) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_WorkoutDetails] PRIMARY KEY CLUSTERED 
(
	[WorkoutDetailsID] ASC
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
SET IDENTITY_INSERT [dbo].[Workout] ON 

INSERT [dbo].[Workout] ([WorkoutID], [UserID], [SessionNumber], [DateAdded]) VALUES (1, 2, N'1         ', CAST(N'2018-04-11T15:48:03.003' AS DateTime))
INSERT [dbo].[Workout] ([WorkoutID], [UserID], [SessionNumber], [DateAdded]) VALUES (2, 2, N'2         ', CAST(N'2018-04-11T17:20:46.573' AS DateTime))
SET IDENTITY_INSERT [dbo].[Workout] OFF
SET IDENTITY_INSERT [dbo].[WorkoutDetails] ON 

INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (14, 1, 2, N'Chest', N'DB Press', N'50', N'10', N'3', CAST(N'2018-04-11T15:46:35.623' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (15, 1, 2, N'Chest', N'Bench Press', N'50', N'10', N'3', CAST(N'2018-04-11T15:46:50.950' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (16, 1, 2, N'Chest', N'DB flys', N'50', N'10', N'3', CAST(N'2018-04-11T15:47:02.403' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (17, 1, 2, N'Biceps', N'db curls', N'50', N'10', N'3', CAST(N'2018-04-11T15:47:22.167' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (18, 1, 2, N'Biceps', N'con curls', N'50', N'10', N'3', CAST(N'2018-04-11T15:47:31.967' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (19, 1, 2, N'Biceps', N'hammer curls', N'50', N'10', N'3', CAST(N'2018-04-11T15:47:41.187' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (20, 2, 2, N'Back', N'Pull over', N'50', N'10', N'3', CAST(N'2018-04-11T17:19:51.460' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (21, 2, 2, N'Back', N'Rows', N'50', N'10', N'3', CAST(N'2018-04-11T17:20:06.267' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (22, 2, 2, N'Back', N'One hand rows', N'50', N'10', N'3', CAST(N'2018-04-11T17:20:12.853' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (23, 2, 2, N'Triceps', N'Close grip bench', N'50', N'10', N'3', CAST(N'2018-04-11T17:20:23.073' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (24, 2, 2, N'Triceps', N'Cable pulldowns', N'50', N'10', N'3', CAST(N'2018-04-11T17:20:32.317' AS DateTime))
SET IDENTITY_INSERT [dbo].[WorkoutDetails] OFF
USE [master]
GO
ALTER DATABASE [Coaching] SET  READ_WRITE 
GO
