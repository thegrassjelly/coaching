USE [Coaching]
GO
/****** Object:  Table [dbo].[BodyComp]    Script Date: 02/05/2018 1:16:18 PM ******/
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
/****** Object:  Table [dbo].[Clients]    Script Date: 02/05/2018 1:16:20 PM ******/
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
/****** Object:  Table [dbo].[Scheduler]    Script Date: 02/05/2018 1:16:21 PM ******/
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
/****** Object:  Table [dbo].[Training]    Script Date: 02/05/2018 1:16:22 PM ******/
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
/****** Object:  Table [dbo].[TrainingDetails]    Script Date: 02/05/2018 1:16:23 PM ******/
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
/****** Object:  Table [dbo].[Workout]    Script Date: 02/05/2018 1:16:24 PM ******/
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
/****** Object:  Table [dbo].[WorkoutDetails]    Script Date: 02/05/2018 1:16:25 PM ******/
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
SET IDENTITY_INSERT [dbo].[BodyComp] ON 

INSERT [dbo].[BodyComp] ([BCID], [UserID], [BodyType], [Gender], [Age], [Height], [ClothesWeight], [Weight], [FatPer], [FatMass], [FFM], [MuscleMass], [TBW], [TBWPer], [BoneMass], [BMR], [MetAge], [VFR], [BMI], [DateAdded]) VALUES (1, 1, N'Meso', N'Male', 23, N'163', N'1', N'85', N'20', N'1', N'1', N'1', N'23', N'5', N'2', N'2', N'42', N'2', N'Meso', CAST(N'2018-04-16T21:08:26.437' AS DateTime))
INSERT [dbo].[BodyComp] ([BCID], [UserID], [BodyType], [Gender], [Age], [Height], [ClothesWeight], [Weight], [FatPer], [FatMass], [FFM], [MuscleMass], [TBW], [TBWPer], [BoneMass], [BMR], [MetAge], [VFR], [BMI], [DateAdded]) VALUES (1003, 1, N'Meso', N'Male', 24, N'160', N'2', N'160', N'10', N'10', N'10', N'10', N'10', N'10', N'10', N'10', N'10', N'10', N'10', CAST(N'2018-04-20T10:18:45.217' AS DateTime))
INSERT [dbo].[BodyComp] ([BCID], [UserID], [BodyType], [Gender], [Age], [Height], [ClothesWeight], [Weight], [FatPer], [FatMass], [FFM], [MuscleMass], [TBW], [TBWPer], [BoneMass], [BMR], [MetAge], [VFR], [BMI], [DateAdded]) VALUES (1004, 1, N'Meso', N'Male', 20, N'20', N'20', N'20', N'20', N'20', N'20', N'20', N'20', N'20', N'20', N'20', N'20', N'20', N'20', CAST(N'2018-04-20T10:29:13.977' AS DateTime))
INSERT [dbo].[BodyComp] ([BCID], [UserID], [BodyType], [Gender], [Age], [Height], [ClothesWeight], [Weight], [FatPer], [FatMass], [FFM], [MuscleMass], [TBW], [TBWPer], [BoneMass], [BMR], [MetAge], [VFR], [BMI], [DateAdded]) VALUES (1005, 4, N'Ectomorph', N'Female', 34, N'160', N'3', N'45', N'19', N'8', N'37', N'35', N'24', N'54', N'2', N'4402', N'18', N'1', N'18', CAST(N'2018-04-20T10:47:14.227' AS DateTime))
INSERT [dbo].[BodyComp] ([BCID], [UserID], [BodyType], [Gender], [Age], [Height], [ClothesWeight], [Weight], [FatPer], [FatMass], [FFM], [MuscleMass], [TBW], [TBWPer], [BoneMass], [BMR], [MetAge], [VFR], [BMI], [DateAdded]) VALUES (1011, 3, N'Endomorph', N'Female', 35, N'157', N'.3', N'56', N'34', N'19', N'37', N'35', N'25', N'46', N'2', N'4665', N'42', N'5', N'23', CAST(N'2018-04-20T11:01:27.553' AS DateTime))
INSERT [dbo].[BodyComp] ([BCID], [UserID], [BodyType], [Gender], [Age], [Height], [ClothesWeight], [Weight], [FatPer], [FatMass], [FFM], [MuscleMass], [TBW], [TBWPer], [BoneMass], [BMR], [MetAge], [VFR], [BMI], [DateAdded]) VALUES (1012, 6, N'Meso', N'Female', 36, N'152', N'.3', N'63.2', N'39.3', N'24.8', N'38.4', N'36.2', N'29.5', N'46.7', N'2.2', N'4950', N'56', N'7', N'27.4', CAST(N'2018-04-21T10:31:11.533' AS DateTime))
INSERT [dbo].[BodyComp] ([BCID], [UserID], [BodyType], [Gender], [Age], [Height], [ClothesWeight], [Weight], [FatPer], [FatMass], [FFM], [MuscleMass], [TBW], [TBWPer], [BoneMass], [BMR], [MetAge], [VFR], [BMI], [DateAdded]) VALUES (1013, 7, N'Meso', N'Male', 40, N'170', N'.3', N'74', N'22.1', N'16.5', N'58', N'55', N'41.4', N'55.6', N'3', N'6774', N'36', N'12', N'25.8', CAST(N'2018-04-21T12:07:56.313' AS DateTime))
INSERT [dbo].[BodyComp] ([BCID], [UserID], [BodyType], [Gender], [Age], [Height], [ClothesWeight], [Weight], [FatPer], [FatMass], [FFM], [MuscleMass], [TBW], [TBWPer], [BoneMass], [BMR], [MetAge], [VFR], [BMI], [DateAdded]) VALUES (1015, 11, N'Endo', N'Female', 21, N'152', N'0.5', N'54.5', N'32.4', N'17.6', N'36.8', N'34.7', N'27.3', N'50.2', N'2.1', N'4870', N'29', N'4', N'23.5', CAST(N'2018-04-25T10:44:58.430' AS DateTime))
SET IDENTITY_INSERT [dbo].[BodyComp] OFF
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([UserID], [FirstName], [LastName], [UserPic], [Birthday], [EmailAdd], [MobileNo], [Address], [Status], [DateAdded], [DateModified]) VALUES (3, N'Diana Jean', N'Pua', N'ef473338-509c-49a6-aadf-763cec6f23a9.jpg', CAST(N'1982-12-14T00:00:00.000' AS DateTime), N'tiu_dj@yahoo.com', N'09178718871', N'Dapitan st. Qc', N'Active', CAST(N'2018-04-20T09:37:24.713' AS DateTime), N'Apr 20 201')
INSERT [dbo].[Clients] ([UserID], [FirstName], [LastName], [UserPic], [Birthday], [EmailAdd], [MobileNo], [Address], [Status], [DateAdded], [DateModified]) VALUES (4, N'Anna', N'Ngo', N'989d314d-8f8f-4809-b825-7d107d66b6d0.jpg', CAST(N'1984-02-17T00:00:00.000' AS DateTime), N'Pinpin17@yahoo.com', N'639178144813', N'Dapitan street quezon city', N'Active', CAST(N'2018-04-20T10:28:05.743' AS DateTime), N'Apr 20 201')
INSERT [dbo].[Clients] ([UserID], [FirstName], [LastName], [UserPic], [Birthday], [EmailAdd], [MobileNo], [Address], [Status], [DateAdded], [DateModified]) VALUES (5, N'David', N'Licauco', N'b1906c4d-7710-40e4-82b9-06780b448c26.jpg', CAST(N'1995-06-15T00:00:00.000' AS DateTime), N'davidlicauco@gmail.com', N'09177003695', N'', N'Active', CAST(N'2018-04-21T10:09:40.463' AS DateTime), N'Apr 21 201')
INSERT [dbo].[Clients] ([UserID], [FirstName], [LastName], [UserPic], [Birthday], [EmailAdd], [MobileNo], [Address], [Status], [DateAdded], [DateModified]) VALUES (6, N'Ashley', N'Chan', N'60275299-85a8-4b35-8ae5-0bb617e01dfa.jpg', CAST(N'1981-07-22T00:00:00.000' AS DateTime), N'ash_chan722@yahoo.com', N'09158282858', N'', N'Active', CAST(N'2018-04-21T10:20:26.407' AS DateTime), NULL)
INSERT [dbo].[Clients] ([UserID], [FirstName], [LastName], [UserPic], [Birthday], [EmailAdd], [MobileNo], [Address], [Status], [DateAdded], [DateModified]) VALUES (7, N'Francis', N'Adajar', N'ab0cd263-40c7-4567-bb26-012208ef495f.jpg', CAST(N'1978-02-08T00:00:00.000' AS DateTime), N'Fr_adajar@yahoo.com', N'09178992066', N'160 apo st Laloma sta Mesa heights qc', N'Active', CAST(N'2018-04-21T11:56:31.160' AS DateTime), NULL)
INSERT [dbo].[Clients] ([UserID], [FirstName], [LastName], [UserPic], [Birthday], [EmailAdd], [MobileNo], [Address], [Status], [DateAdded], [DateModified]) VALUES (8, N'Edward', N'Barretto', N'4a8edd2b-b5f4-41d6-9974-3b2b3f1b0ded.jpg', CAST(N'1980-10-24T00:00:00.000' AS DateTime), N'Barretto.ed@gmail.com', N'09209035880', N'976 m naval st San Jose navotas', N'Active', CAST(N'2018-04-21T12:10:00.723' AS DateTime), N'Apr 21 201')
INSERT [dbo].[Clients] ([UserID], [FirstName], [LastName], [UserPic], [Birthday], [EmailAdd], [MobileNo], [Address], [Status], [DateAdded], [DateModified]) VALUES (10, N'Jean', N'Cheng', N'045a19c4-4d83-41ce-8db8-1af552a49bb0.jpg', CAST(N'1996-09-19T00:00:00.000' AS DateTime), N'jeanc@outlook.ph', N'09053495211', N'23 D. Tuazon St., Quezon City', N'Active', CAST(N'2018-04-23T17:11:34.683' AS DateTime), NULL)
INSERT [dbo].[Clients] ([UserID], [FirstName], [LastName], [UserPic], [Birthday], [EmailAdd], [MobileNo], [Address], [Status], [DateAdded], [DateModified]) VALUES (11, N'Christine', N'Tan', N'c166662d-bd45-45a7-b6f5-ba84d6960a92.jpg', CAST(N'1996-12-25T00:00:00.000' AS DateTime), N'christine_tan2512@yahoo.com', N'09176313435', N'Manila', N'Active', CAST(N'2018-04-25T10:34:38.603' AS DateTime), N'Apr 25 201')
SET IDENTITY_INSERT [dbo].[Clients] OFF
SET IDENTITY_INSERT [dbo].[Training] ON 

INSERT [dbo].[Training] ([TrainingID], [UserID], [GoalSetting], [TrainingPackage], [TrainingFee], [DateAdded], [DateModified]) VALUES (1002, 3, N'Weight Loss', N'30 Session', CAST(0.00 AS Decimal(18, 2)), CAST(N'2018-04-20T09:46:22.987' AS DateTime), NULL)
INSERT [dbo].[Training] ([TrainingID], [UserID], [GoalSetting], [TrainingPackage], [TrainingFee], [DateAdded], [DateModified]) VALUES (1003, 4, N'Weight Loss', N'30 Session', CAST(0.00 AS Decimal(18, 2)), CAST(N'2018-04-20T10:41:49.250' AS DateTime), NULL)
INSERT [dbo].[Training] ([TrainingID], [UserID], [GoalSetting], [TrainingPackage], [TrainingFee], [DateAdded], [DateModified]) VALUES (1004, 3, N'Weight Loss', N'30 Session', CAST(0.00 AS Decimal(18, 2)), CAST(N'2018-04-20T10:58:25.537' AS DateTime), NULL)
INSERT [dbo].[Training] ([TrainingID], [UserID], [GoalSetting], [TrainingPackage], [TrainingFee], [DateAdded], [DateModified]) VALUES (1005, 7, N'Tone and Shape', N'30 Session', CAST(25500.00 AS Decimal(18, 2)), CAST(N'2018-04-21T12:04:10.857' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Training] OFF
SET IDENTITY_INSERT [dbo].[TrainingDetails] ON 

INSERT [dbo].[TrainingDetails] ([TrainingDetailsID], [TrainingID], [ProgressPicFront], [ProgressPicSide], [ProgressPicBack], [Age], [Height], [Weight], [Arms], [Chest], [Waist], [Hip], [Thigh], [Legs], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [DateAdded]) VALUES (1, 1, N'front.jpg', N'side.jpg', N'back.jpg', 1, N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'0', N'1', N'0', N'1', N'0', CAST(N'2018-04-16T00:00:00.000' AS DateTime))
INSERT [dbo].[TrainingDetails] ([TrainingDetailsID], [TrainingID], [ProgressPicFront], [ProgressPicSide], [ProgressPicBack], [Age], [Height], [Weight], [Arms], [Chest], [Waist], [Hip], [Thigh], [Legs], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [DateAdded]) VALUES (2, 2, N'front.jpg', N'side.jpg', N'back.jpg', 1, N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'0', N'1', N'0', N'1', N'0', CAST(N'2018-04-22T00:00:00.000' AS DateTime))
INSERT [dbo].[TrainingDetails] ([TrainingDetailsID], [TrainingID], [ProgressPicFront], [ProgressPicSide], [ProgressPicBack], [Age], [Height], [Weight], [Arms], [Chest], [Waist], [Hip], [Thigh], [Legs], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [DateAdded]) VALUES (1002, 1002, N'58cb1292-fda4-4d7f-9f37-72bc81a001b0.jpg', N'43435a3c-2fd3-4ece-8185-82614ebd6d5e.jpg', N'3167a641-9e45-4070-936e-20c0ddb66aaf.jpg', 35, N'157', N'55', N'26', N'88', N'73', N'98', N'52', N'', N'1', N'0', N'1', N'0', N'1', N'0', CAST(N'2018-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[TrainingDetails] ([TrainingDetailsID], [TrainingID], [ProgressPicFront], [ProgressPicSide], [ProgressPicBack], [Age], [Height], [Weight], [Arms], [Chest], [Waist], [Hip], [Thigh], [Legs], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [DateAdded]) VALUES (1003, 1003, N'f8ce37ab-695f-43d9-b44d-80f9c2b7e321.jpg', N'1fc99827-3891-4290-9260-559a481e8bfd.jpg', N'ac071768-8424-4f84-ad3d-086788f6279a.jpg', 34, N'160', N'45', N'27', N'75', N'64', N'86', N'45', N'', N'1', N'0', N'1', N'0', N'1', N'0', CAST(N'2018-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[TrainingDetails] ([TrainingDetailsID], [TrainingID], [ProgressPicFront], [ProgressPicSide], [ProgressPicBack], [Age], [Height], [Weight], [Arms], [Chest], [Waist], [Hip], [Thigh], [Legs], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [DateAdded]) VALUES (1004, 1004, N'front.jpg', N'side.jpg', N'back.jpg', 35, N'157', N'56', N'26', N'86', N'75', N'95', N'50', N'', N'1', N'0', N'1', N'0', N'1', N'0', CAST(N'2018-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[TrainingDetails] ([TrainingDetailsID], [TrainingID], [ProgressPicFront], [ProgressPicSide], [ProgressPicBack], [Age], [Height], [Weight], [Arms], [Chest], [Waist], [Hip], [Thigh], [Legs], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [DateAdded]) VALUES (1005, 1005, N'63bb4580-73f2-4cac-992b-71f836ce114d.jpeg', N'd8e5672b-1d78-459a-af84-26dfa66da361.jpeg', N'40165876-206c-4afb-b6f1-fb571b841a55.jpeg', 40, N'170', N'74', N'35', N'99', N'87', N'98', N'99', N'61', N'1', N'0', N'1', N'0', N'1', N'0', CAST(N'2018-04-21T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TrainingDetails] OFF
SET IDENTITY_INSERT [dbo].[Workout] ON 

INSERT [dbo].[Workout] ([WorkoutID], [UserID], [SessionNumber], [DateAdded]) VALUES (1, 1, N'1         ', CAST(N'2018-04-16T21:49:53.863' AS DateTime))
SET IDENTITY_INSERT [dbo].[Workout] OFF
SET IDENTITY_INSERT [dbo].[WorkoutDetails] ON 

INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (1, 1, 1, N'Chest', N'Db press', N'100', N'10', N'3', CAST(N'2018-04-16T21:49:07.317' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (2, 1, 1, N'Chest', N'Db press incline', N'100', N'10', N'3', CAST(N'2018-04-16T21:49:15.520' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (3, 1, 1, N'Biceps', N'Db curl', N'100', N'10', N'3', CAST(N'2018-04-16T21:49:27.003' AS DateTime))
INSERT [dbo].[WorkoutDetails] ([WorkoutDetailsID], [WorkoutID], [UserID], [BodyPart], [WorkoutName], [Weight], [Repetitions], [Sets], [DateAdded]) VALUES (4, 1, 1, N'Biceps', N'Db curl hammer', N'100', N'10', N'3', CAST(N'2018-04-16T21:49:34.677' AS DateTime))
SET IDENTITY_INSERT [dbo].[WorkoutDetails] OFF
