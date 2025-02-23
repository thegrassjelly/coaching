USE [master]
GO
/****** Object:  Database [Coaching]    Script Date: 16/04/2018 4:38:56 PM ******/
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
/****** Object:  Table [dbo].[BodyComp]    Script Date: 16/04/2018 4:38:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BodyComp](
	[BCID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[BodyType] [nvarchar](50) NULL,
	[Gender] [nvarchar](10) NULL,
	[Age] [int] NULL,
	[Height] [nvarchar](10) NULL,
	[ClothesWeight] [nvarchar](10) NULL,
	[Weight] [nvarchar](10) NULL,
	[FatPer] [nvarchar](10) NULL,
	[FatMass] [nvarchar](10) NULL,
	[FFM] [nvarchar](10) NULL,
	[MuscleMass] [nvarchar](10) NULL,
	[TBW] [nvarchar](10) NULL,
	[TBWPer] [nvarchar](10) NULL,
	[BoneMass] [nvarchar](10) NULL,
	[BMR] [nvarchar](10) NULL,
	[MetAge] [nvarchar](10) NULL,
	[VFR] [nvarchar](10) NULL,
	[BMI] [nvarchar](10) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_BodyComp] PRIMARY KEY CLUSTERED 
(
	[BCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 16/04/2018 4:38:56 PM ******/
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
/****** Object:  Table [dbo].[Scheduler]    Script Date: 16/04/2018 4:38:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scheduler](
	[SchedulerID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[AllDay] [bit] NULL,
	[Subject] [nvarchar](20) NULL,
	[Location] [nvarchar](20) NULL,
	[OriginalOccurrenceStart] [smalldatetime] NULL,
	[OriginalOccurrenceEnd] [smalldatetime] NULL,
	[Description] [nvarchar](20) NULL,
	[Status] [int] NULL,
	[Label] [int] NULL,
	[ResourceID] [int] NULL,
	[ResourceIDs] [nvarchar](max) NULL,
	[ReminderInfo] [nvarchar](max) NULL,
	[RecurrenceInfo] [nvarchar](max) NULL,
	[CustomField] [nvarchar](max) NULL,
	[TimeZoneId] [nvarchar](50) NULL,
 CONSTRAINT [PK_OpportunityActivity] PRIMARY KEY CLUSTERED 
(
	[SchedulerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Training]    Script Date: 16/04/2018 4:38:57 PM ******/
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
/****** Object:  Table [dbo].[TrainingDetails]    Script Date: 16/04/2018 4:38:57 PM ******/
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
/****** Object:  Table [dbo].[Workout]    Script Date: 16/04/2018 4:38:57 PM ******/
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
/****** Object:  Table [dbo].[WorkoutDetails]    Script Date: 16/04/2018 4:38:57 PM ******/
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
USE [master]
GO
ALTER DATABASE [Coaching] SET  READ_WRITE 
GO
