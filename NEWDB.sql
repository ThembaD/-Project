USE [master]
GO
/****** Object:  Database [LabSystem]    Script Date: 22-Sep-17 10:49:03 ******/
CREATE DATABASE [LabSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LabSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LabSystem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LabSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LabSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LabSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LabSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LabSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LabSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LabSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LabSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LabSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [LabSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LabSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LabSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LabSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LabSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LabSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LabSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LabSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LabSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LabSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LabSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LabSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LabSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LabSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LabSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LabSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LabSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LabSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [LabSystem] SET  MULTI_USER 
GO
ALTER DATABASE [LabSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LabSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LabSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LabSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LabSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LabSystem', N'ON'
GO
USE [LabSystem]
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[AnnouncementID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[AnnouncementTitle] [nvarchar](50) NULL,
	[AnnouncementDescription] [nvarchar](50) NULL,
	[AnnouncementCreatedDate] [timestamp] NULL,
	[AnnouncementStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED 
(
	[AnnouncementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactSupport]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactSupport](
	[ContactSupportID] [int] IDENTITY(1,1) NOT NULL,
	[ContactSupportFullNames] [nvarchar](50) NOT NULL,
	[ContactSupportPosition] [nvarchar](50) NOT NULL,
	[ContactSupportEmailAddress] [nvarchar](50) NOT NULL,
	[ContactSupportCellNumber] [nvarchar](50) NULL,
	[ModifiedDate] [timestamp] NULL,
 CONSTRAINT [PK_ContactSupport] PRIMARY KEY CLUSTERED 
(
	[ContactSupportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lab]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lab](
	[LabID] [int] IDENTITY(1,1) NOT NULL,
	[LabTypeID] [int] NOT NULL,
	[LabName] [nvarchar](50) NOT NULL,
	[LabDescription] [nvarchar](100) NOT NULL,
	[ModifiedDate] [timestamp] NULL,
 CONSTRAINT [PK_Lab] PRIMARY KEY CLUSTERED 
(
	[LabID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabBooking]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabBooking](
	[LabBookingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LabDiscussionID] [int] NOT NULL,
	[LabBookingStudentNumber] [numeric](18, 0) NOT NULL,
	[LabBookingTimeIn] [datetime] NOT NULL,
	[LabBookingTimeOut] [datetime] NULL,
	[ModifiedDate] [timestamp] NULL,
 CONSTRAINT [PK_LabBooking] PRIMARY KEY CLUSTERED 
(
	[LabBookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabBookingAttendee]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabBookingAttendee](
	[LabBookingAttendeeID] [int] IDENTITY(1,1) NOT NULL,
	[LabBookingID] [int] NOT NULL,
	[LabBookingAttendeeStudentNumber] [numeric](18, 0) NOT NULL,
	[LabBookingAttendeeTimeIn] [timestamp] NOT NULL,
	[LabBookingAttendeeTimeOut] [datetime] NOT NULL,
 CONSTRAINT [PK_LabBookingAttendee] PRIMARY KEY CLUSTERED 
(
	[LabBookingAttendeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabDiscussion]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabDiscussion](
	[LabDiscussionID] [int] IDENTITY(1,1) NOT NULL,
	[LabTypeDescription] [nvarchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_LabType] PRIMARY KEY CLUSTERED 
(
	[LabDiscussionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabIssue]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabIssue](
	[LabIssueID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LabIssueTitle] [nvarchar](50) NOT NULL,
	[LabIssueDescription] [nvarchar](200) NOT NULL,
	[LabIssueStatusTypeID] [int] NULL,
	[LabIssueCreatedDate] [datetime] NOT NULL,
	[LabIssueResolveDate] [datetime] NULL CONSTRAINT [DF_LabIssue_LabIssueResolveDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_LabIssue] PRIMARY KEY CLUSTERED 
(
	[LabIssueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabIssueStatusType]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabIssueStatusType](
	[LabIssueStatusID] [int] IDENTITY(1,1) NOT NULL,
	[LabStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LabIssueStatusType] PRIMARY KEY CLUSTERED 
(
	[LabIssueStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabUser]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_LabUser_ModifiedDate]  DEFAULT (getdate()),
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[IdentityNumber] [numeric](18, 0) NULL,
	[PassportNumber] [nvarchar](50) NULL,
	[CellNumber] [numeric](18, 0) NULL,
	[Address] [nvarchar](50) NULL,
	[SecurityQuestion] [nvarchar](50) NULL,
	[SecurityAnswer] [nvarchar](50) NULL,
	[NextOfKeenName] [nvarchar](50) NULL,
	[NextOfKeenRelationShip] [nvarchar](50) NULL,
	[NextOfKeenCellnumber] [numeric](18, 0) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Leave]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leave](
	[LeaveID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LeaveTypeID] [int] NOT NULL,
	[LeaveTaken] [int] NULL,
	[LeaveRequestStatusID] [int] NOT NULL,
	[LeaveResquestStartDate] [date] NOT NULL,
	[LeaveResquestEndDate] [date] NULL,
	[LeaveRequestCreatedDate] [datetime] NULL,
	[LeaveRequestApprovedDate] [datetime] NULL,
 CONSTRAINT [PK_Leave] PRIMARY KEY CLUSTERED 
(
	[LeaveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaveRequestStatus]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveRequestStatus](
	[LeaveRequestStatusID] [int] IDENTITY(1,1) NOT NULL,
	[LeaveRequestDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LeaveRequestStatus] PRIMARY KEY CLUSTERED 
(
	[LeaveRequestStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaveTotal]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTotal](
	[LeaveTotalID] [int] IDENTITY(1,1) NOT NULL,
	[LeaveTypeID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Remaining] [int] NOT NULL,
	[Taken] [int] NOT NULL,
 CONSTRAINT [PK_LeaveTotal] PRIMARY KEY CLUSTERED 
(
	[LeaveTotalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaveType]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveType](
	[LeaveTypeID] [int] IDENTITY(1,1) NOT NULL,
	[LeaveTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_LeaveType] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecurityQuestion]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityQuestion](
	[SecurityQuestionID] [int] IDENTITY(1,1) NOT NULL,
	[SecurityQuestion] [nvarchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_SecurityQuestion] PRIMARY KEY CLUSTERED 
(
	[SecurityQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shift]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[ShiftID] [int] IDENTITY(1,1) NOT NULL,
	[ShiftDescription] [nvarchar](50) NOT NULL,
	[ShiftTime] [nvarchar](50) NOT NULL,
	[ModifiedDate] [timestamp] NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sms]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sms](
	[SmsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SmsMessage] [nvarchar](250) NOT NULL,
	[Recepients] [nvarchar](200) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Sms] PRIMARY KEY CLUSTERED 
(
	[SmsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTable](
	[TimeTableID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ShiftID] [int] NOT NULL,
	[ModifiedDate] [timestamp] NULL,
 CONSTRAINT [PK_TimeTable] PRIMARY KEY CLUSTERED 
(
	[TimeTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLog]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLog](
	[UserLogsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LogInTime] [datetime] NULL,
	[LogoutTime] [datetime] NULL,
 CONSTRAINT [PK_UserLog] PRIMARY KEY CLUSTERED 
(
	[UserLogsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserManual]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManual](
	[UserManualID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserManualTitle] [nvarchar](50) NULL,
	[UserManualDescription] [nvarchar](50) NULL,
	[UserManualURL] [nvarchar](200) NULL,
	[ModifiedDate] [timestamp] NULL,
 CONSTRAINT [PK_UserManual] PRIMARY KEY CLUSTERED 
(
	[UserManualID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserType]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeID] [int] NOT NULL,
	[UserTypeName] [nvarchar](50) NOT NULL,
	[UserTypeDescription] [nvarchar](50) NULL,
	[ModifiedDate] [timestamp] NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Announcement] ON 

INSERT [dbo].[Announcement] ([AnnouncementID], [UserID], [AnnouncementTitle], [AnnouncementDescription], [AnnouncementStatus]) VALUES (1, NULL, N'Mashudu', N'Mashudu', NULL)
SET IDENTITY_INSERT [dbo].[Announcement] OFF
SET IDENTITY_INSERT [dbo].[ContactSupport] ON 

INSERT [dbo].[ContactSupport] ([ContactSupportID], [ContactSupportFullNames], [ContactSupportPosition], [ContactSupportEmailAddress], [ContactSupportCellNumber]) VALUES (1, N'Mashudu A Aaaa', N'Techy', N'a@hhj.com', N'020661645')
INSERT [dbo].[ContactSupport] ([ContactSupportID], [ContactSupportFullNames], [ContactSupportPosition], [ContactSupportEmailAddress], [ContactSupportCellNumber]) VALUES (2, N'hsagah', N'sfafsa', N'asfasf', N'342423')
SET IDENTITY_INSERT [dbo].[ContactSupport] OFF
SET IDENTITY_INSERT [dbo].[LabIssue] ON 

INSERT [dbo].[LabIssue] ([LabIssueID], [UserID], [LabIssueTitle], [LabIssueDescription], [LabIssueStatusTypeID], [LabIssueCreatedDate], [LabIssueResolveDate]) VALUES (2, 1, N'Computer Broken', N'Computer Broken', 2, CAST(N'2017-01-10 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[LabIssue] ([LabIssueID], [UserID], [LabIssueTitle], [LabIssueDescription], [LabIssueStatusTypeID], [LabIssueCreatedDate], [LabIssueResolveDate]) VALUES (5, 2, N'Window Broken', N'Window Broken', 2, CAST(N'2017-01-10 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[LabIssue] ([LabIssueID], [UserID], [LabIssueTitle], [LabIssueDescription], [LabIssueStatusTypeID], [LabIssueCreatedDate], [LabIssueResolveDate]) VALUES (6, 1, N'Blank screen', N'Blank screen in lab4 computer 4', 3, CAST(N'2017-09-21 21:47:49.000' AS DateTime), CAST(N'2000-01-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[LabIssue] OFF
SET IDENTITY_INSERT [dbo].[LabIssueStatusType] ON 

INSERT [dbo].[LabIssueStatusType] ([LabIssueStatusID], [LabStatusName]) VALUES (1, N'Open')
INSERT [dbo].[LabIssueStatusType] ([LabIssueStatusID], [LabStatusName]) VALUES (2, N'In Progress')
INSERT [dbo].[LabIssueStatusType] ([LabIssueStatusID], [LabStatusName]) VALUES (3, N'Closed')
SET IDENTITY_INSERT [dbo].[LabIssueStatusType] OFF
SET IDENTITY_INSERT [dbo].[LabUser] ON 

INSERT [dbo].[LabUser] ([UserID], [UserName], [UserPassword], [UserTypeID], [ModifiedDate], [FirstName], [LastName], [IdentityNumber], [PassportNumber], [CellNumber], [Address], [SecurityQuestion], [SecurityAnswer], [NextOfKeenName], [NextOfKeenRelationShip], [NextOfKeenCellnumber]) VALUES (1, N'Admin', N'Admin', 1, CAST(N'1900-01-01 00:00:20.000' AS DateTime), N'gergedgbdfxhnfchjdhdf', N'grdg', CAST(35252 AS Numeric(18, 0)), NULL, CAST(1234 AS Numeric(18, 0)), N'sgg', N'gs', N'gsg', N'gsgawesfdgsfa', N'gerge', CAST(4353234567 AS Numeric(18, 0)))
INSERT [dbo].[LabUser] ([UserID], [UserName], [UserPassword], [UserTypeID], [ModifiedDate], [FirstName], [LastName], [IdentityNumber], [PassportNumber], [CellNumber], [Address], [SecurityQuestion], [SecurityAnswer], [NextOfKeenName], [NextOfKeenRelationShip], [NextOfKeenCellnumber]) VALUES (2, N'Assistant', N'Assistant', 2, CAST(N'1900-01-01 00:00:20.130' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LabUser] ([UserID], [UserName], [UserPassword], [UserTypeID], [ModifiedDate], [FirstName], [LastName], [IdentityNumber], [PassportNumber], [CellNumber], [Address], [SecurityQuestion], [SecurityAnswer], [NextOfKeenName], [NextOfKeenRelationShip], [NextOfKeenCellnumber]) VALUES (3, N'Technician', N'Technician', 3, CAST(N'1900-01-01 00:00:20.000' AS DateTime), N'5647', N'57635', CAST(637 AS Numeric(18, 0)), NULL, CAST(376357 AS Numeric(18, 0)), N'33', N'3', N'3', N'375', N'7635', CAST(6735657 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[LabUser] OFF
SET IDENTITY_INSERT [dbo].[Leave] ON 

INSERT [dbo].[Leave] ([LeaveID], [UserID], [LeaveTypeID], [LeaveTaken], [LeaveRequestStatusID], [LeaveResquestStartDate], [LeaveResquestEndDate], [LeaveRequestCreatedDate], [LeaveRequestApprovedDate]) VALUES (6, 2, 1, 0, 1, CAST(N'2017-09-22' AS Date), CAST(N'2017-09-22' AS Date), CAST(N'2017-09-21 22:23:58.120' AS DateTime), CAST(N'2017-09-22 08:45:13.317' AS DateTime))
INSERT [dbo].[Leave] ([LeaveID], [UserID], [LeaveTypeID], [LeaveTaken], [LeaveRequestStatusID], [LeaveResquestStartDate], [LeaveResquestEndDate], [LeaveRequestCreatedDate], [LeaveRequestApprovedDate]) VALUES (9, 2, 1, 4, 2, CAST(N'2017-09-22' AS Date), CAST(N'2017-09-26' AS Date), CAST(N'2017-09-21 22:29:26.937' AS DateTime), CAST(N'2017-09-21 23:43:08.477' AS DateTime))
INSERT [dbo].[Leave] ([LeaveID], [UserID], [LeaveTypeID], [LeaveTaken], [LeaveRequestStatusID], [LeaveResquestStartDate], [LeaveResquestEndDate], [LeaveRequestCreatedDate], [LeaveRequestApprovedDate]) VALUES (10, 2, 1, 2, 1, CAST(N'2017-09-23' AS Date), CAST(N'2017-09-25' AS Date), CAST(N'2017-09-22 08:46:40.023' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Leave] OFF
SET IDENTITY_INSERT [dbo].[LeaveRequestStatus] ON 

INSERT [dbo].[LeaveRequestStatus] ([LeaveRequestStatusID], [LeaveRequestDescription]) VALUES (1, N'Open')
INSERT [dbo].[LeaveRequestStatus] ([LeaveRequestStatusID], [LeaveRequestDescription]) VALUES (2, N'Approved')
INSERT [dbo].[LeaveRequestStatus] ([LeaveRequestStatusID], [LeaveRequestDescription]) VALUES (3, N'Declined')
SET IDENTITY_INSERT [dbo].[LeaveRequestStatus] OFF
SET IDENTITY_INSERT [dbo].[LeaveType] ON 

INSERT [dbo].[LeaveType] ([LeaveTypeID], [LeaveTypeName]) VALUES (1, N'Sick leave')
INSERT [dbo].[LeaveType] ([LeaveTypeID], [LeaveTypeName]) VALUES (2, N'Normal Leave')
SET IDENTITY_INSERT [dbo].[LeaveType] OFF
SET IDENTITY_INSERT [dbo].[Sms] ON 

INSERT [dbo].[Sms] ([SmsID], [UserID], [SmsMessage], [Recepients], [CreatedTime]) VALUES (2, 1, N'fgbrbrbrb', N'345467', CAST(N'2017-01-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Sms] OFF
SET IDENTITY_INSERT [dbo].[UserLog] ON 

INSERT [dbo].[UserLog] ([UserLogsID], [UserID], [LogInTime], [LogoutTime]) VALUES (1, 2, CAST(N'2017-09-21 21:46:30.967' AS DateTime), CAST(N'2017-09-21 21:46:39.217' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserLog] OFF
SET IDENTITY_INSERT [dbo].[UserManual] ON 

INSERT [dbo].[UserManual] ([UserManualID], [UserID], [UserManualTitle], [UserManualDescription], [UserManualURL]) VALUES (5, 1, N'regre', N'gergege', N'~/UserManuals/0b6ce5e8-d37d-40dd-8a6f-b8750313980f.jpg')
SET IDENTITY_INSERT [dbo].[UserManual] OFF
INSERT [dbo].[UserType] ([UserTypeID], [UserTypeName], [UserTypeDescription]) VALUES (1, N'Admin', N'Admin')
INSERT [dbo].[UserType] ([UserTypeID], [UserTypeName], [UserTypeDescription]) VALUES (2, N'Assistant', N'Assistant')
INSERT [dbo].[UserType] ([UserTypeID], [UserTypeName], [UserTypeDescription]) VALUES (3, N'Technician', N'Technician')
ALTER TABLE [dbo].[LabDiscussion] ADD  CONSTRAINT [DF_LabDiscussion_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Announcement]  WITH CHECK ADD  CONSTRAINT [FK_Announcement_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[LabUser] ([UserID])
GO
ALTER TABLE [dbo].[Announcement] CHECK CONSTRAINT [FK_Announcement_User]
GO
ALTER TABLE [dbo].[Lab]  WITH CHECK ADD  CONSTRAINT [FK_Lab_LabType] FOREIGN KEY([LabTypeID])
REFERENCES [dbo].[LabDiscussion] ([LabDiscussionID])
GO
ALTER TABLE [dbo].[Lab] CHECK CONSTRAINT [FK_Lab_LabType]
GO
ALTER TABLE [dbo].[LabBooking]  WITH CHECK ADD  CONSTRAINT [FK_LabBooking_User] FOREIGN KEY([LabDiscussionID])
REFERENCES [dbo].[LabDiscussion] ([LabDiscussionID])
GO
ALTER TABLE [dbo].[LabBooking] CHECK CONSTRAINT [FK_LabBooking_User]
GO
ALTER TABLE [dbo].[LabBookingAttendee]  WITH CHECK ADD  CONSTRAINT [FK_LabBookingAttendee_LabBooking] FOREIGN KEY([LabBookingID])
REFERENCES [dbo].[LabBooking] ([LabBookingID])
GO
ALTER TABLE [dbo].[LabBookingAttendee] CHECK CONSTRAINT [FK_LabBookingAttendee_LabBooking]
GO
ALTER TABLE [dbo].[LabIssue]  WITH CHECK ADD  CONSTRAINT [FK_LabIssue_LabIssueStatusType] FOREIGN KEY([LabIssueStatusTypeID])
REFERENCES [dbo].[LabIssueStatusType] ([LabIssueStatusID])
GO
ALTER TABLE [dbo].[LabIssue] CHECK CONSTRAINT [FK_LabIssue_LabIssueStatusType]
GO
ALTER TABLE [dbo].[LabIssue]  WITH CHECK ADD  CONSTRAINT [FK_LabIssue_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[LabUser] ([UserID])
GO
ALTER TABLE [dbo].[LabIssue] CHECK CONSTRAINT [FK_LabIssue_User]
GO
ALTER TABLE [dbo].[LabUser]  WITH CHECK ADD  CONSTRAINT [FK_LabUser_UserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserType] ([UserTypeID])
GO
ALTER TABLE [dbo].[LabUser] CHECK CONSTRAINT [FK_LabUser_UserType]
GO
ALTER TABLE [dbo].[Leave]  WITH CHECK ADD  CONSTRAINT [FK_Leave_LabUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[LabUser] ([UserID])
GO
ALTER TABLE [dbo].[Leave] CHECK CONSTRAINT [FK_Leave_LabUser]
GO
ALTER TABLE [dbo].[Leave]  WITH CHECK ADD  CONSTRAINT [FK_Leave_LeaveRequestStatus] FOREIGN KEY([LeaveRequestStatusID])
REFERENCES [dbo].[LeaveRequestStatus] ([LeaveRequestStatusID])
GO
ALTER TABLE [dbo].[Leave] CHECK CONSTRAINT [FK_Leave_LeaveRequestStatus]
GO
ALTER TABLE [dbo].[Leave]  WITH CHECK ADD  CONSTRAINT [FK_Leave_LeaveType] FOREIGN KEY([LeaveTypeID])
REFERENCES [dbo].[LeaveType] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[Leave] CHECK CONSTRAINT [FK_Leave_LeaveType]
GO
ALTER TABLE [dbo].[LeaveTotal]  WITH CHECK ADD  CONSTRAINT [FK_LeaveTotal_LabUser1] FOREIGN KEY([UserID])
REFERENCES [dbo].[LabUser] ([UserID])
GO
ALTER TABLE [dbo].[LeaveTotal] CHECK CONSTRAINT [FK_LeaveTotal_LabUser1]
GO
ALTER TABLE [dbo].[LeaveTotal]  WITH CHECK ADD  CONSTRAINT [FK_LeaveTotal_LeaveType] FOREIGN KEY([LeaveTypeID])
REFERENCES [dbo].[LeaveType] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[LeaveTotal] CHECK CONSTRAINT [FK_LeaveTotal_LeaveType]
GO
ALTER TABLE [dbo].[SecurityQuestion]  WITH CHECK ADD  CONSTRAINT [FK_SecurityQuestion_LabUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[LabUser] ([UserID])
GO
ALTER TABLE [dbo].[SecurityQuestion] CHECK CONSTRAINT [FK_SecurityQuestion_LabUser]
GO
ALTER TABLE [dbo].[Sms]  WITH CHECK ADD  CONSTRAINT [FK_Sms_LabUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[LabUser] ([UserID])
GO
ALTER TABLE [dbo].[Sms] CHECK CONSTRAINT [FK_Sms_LabUser]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_LabUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[LabUser] ([UserID])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_LabUser]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Shift] FOREIGN KEY([ShiftID])
REFERENCES [dbo].[Shift] ([ShiftID])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Shift]
GO
ALTER TABLE [dbo].[UserLog]  WITH CHECK ADD  CONSTRAINT [FK_UserLog_LabUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[LabUser] ([UserID])
GO
ALTER TABLE [dbo].[UserLog] CHECK CONSTRAINT [FK_UserLog_LabUser]
GO
ALTER TABLE [dbo].[UserManual]  WITH CHECK ADD  CONSTRAINT [FK_UserManual_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[LabUser] ([UserID])
GO
ALTER TABLE [dbo].[UserManual] CHECK CONSTRAINT [FK_UserManual_User]
GO
/****** Object:  StoredProcedure [dbo].[spApplyForLeave]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spApplyForLeave] 


@UserID int,
@LeaveTypeID int,
@LeaveTaken int,
@LeaveRequestStatusID int,
@LeaveResquestStartDate date,
@LeaveResquestEndDate date,
@LeaveRequestCreatedDate datetime,
@LeaveRequestApprovedDate datetime

AS
BEGIN

INSERT INTO [dbo].[Leave]
           ([UserID]
           ,[LeaveTypeID]
           ,[LeaveTaken]
           ,[LeaveRequestStatusID]
           ,[LeaveResquestStartDate]
           ,[LeaveResquestEndDate]
           ,[LeaveRequestCreatedDate]
           ,[LeaveRequestApprovedDate])
     VALUES
           (@UserID,
           @LeaveTypeID + 1,
           @LeaveTaken,
           @LeaveRequestStatusID,
           @LeaveResquestStartDate,
           @LeaveResquestEndDate,
           @LeaveRequestCreatedDate,
           @LeaveRequestApprovedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[spApproveLeave]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spApproveLeave]

@LeaveID int,
@UserID int,
@LeaveRequestStatusID int,
@LeaveRequestApprovedDate datetime

as
begin

UPDATE [dbo].[Leave]
   SET  
       [LeaveRequestStatusID] = @LeaveRequestStatusID + 1,
	   [LeaveRequestApprovedDate] = @LeaveRequestApprovedDate

 WHERE [UserID] = @UserID AND LeaveID = @LeaveID

End

GO
/****** Object:  StoredProcedure [dbo].[spOpenReportedIssuesPerUser]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spOpenReportedIssuesPerUser]

@UserID int

As
begin

 select Count(*)as TotalReportedActive from LabIssue 
 where LabIssueStatusTypeID = '1' OR LabIssueStatusTypeID='2'
 AND LabIssue.UserID = @UserID

End
GO
/****** Object:  StoredProcedure [dbo].[spPendingLeaves]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPendingLeaves] 
	-- Add the parameters for the stored procedure here

	  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Count(LeaveId) as TotalPendingLeaves from Leave
	where LeaveRequestStatusID= 1
END
GO
/****** Object:  StoredProcedure [dbo].[spPendingLeavesAsssistant]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spPendingLeavesAsssistant] 
	-- Add the parameters for the stored procedure here

	@UserID int      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Count(LeaveId) as TotalPendingLeaves from leave
	where UserID=@UserId and LeaveRequestStatusID= 1
END
GO
/****** Object:  StoredProcedure [dbo].[spReportLabProblem]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spReportLabProblem] 

@UserId int,
@LabIssueTitle nvarchar(50),
@LabIssuedescription nvarchar(50),
@LabIssueStatus nvarchar(50)
AS
BEGIN

	INSERT INTO LabIssue  
	        ([UserId]
	       , [LabIssueTitle]
           ,[LabIssueDescription]
           ,[LabIssueCreatedDate]
           ,[LabIssueStatusTypeID]
           ,[LabIssueResolveDate])
	VALUES  ( @UserId
	         ,@LabIssueTitle
           , @LabIssuedescription
           , GETDATE()  
           , @LabIssueStatus
		   , ''
           )
END
GO
/****** Object:  StoredProcedure [dbo].[spTotalAnnouncements]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spTotalAnnouncements] 
	-- Add the parameters for the stored procedure here

	@UserID int      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Count(AnnouncementID) as TotalAnnouncements from Announcement
	where UserID=@UserId
END
GO
/****** Object:  StoredProcedure [dbo].[spUserLog]    Script Date: 22-Sep-17 10:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spUserLog]
@sID INT = NULL,
@COMMAND INT = 0,
@UserID varchar(50)

AS
BEGIN
	SET NOCOUNT ON;
	IF(@COMMAND = 0)
		BEGIN
			INSERT INTO USERLOG (UserID,LoginTime,LogOutTime) VALUES (@UserID,GETDATE(),NULL)
		END
	ELSE IF (@COMMAND = 1)
		BEGIN
			UPDATE USERLOG SET LogOutTime = GETDATE()
		
			WHERE UserID=@UserID
		END
END
GO
USE [master]
GO
ALTER DATABASE [LabSystem] SET  READ_WRITE 
GO
