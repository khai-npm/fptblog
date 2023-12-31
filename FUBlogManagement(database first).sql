USE [master]
GO
/****** Object:  Database [FUBlogManagement]    Script Date: 10/1/2023 11:01:40 AM ******/
CREATE DATABASE [FUBlogManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FUBlogManagament', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FUBlogManagament.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FUBlogManagament_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FUBlogManagament_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FUBlogManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FUBlogManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FUBlogManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FUBlogManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FUBlogManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FUBlogManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FUBlogManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [FUBlogManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FUBlogManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FUBlogManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FUBlogManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FUBlogManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FUBlogManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FUBlogManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FUBlogManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FUBlogManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FUBlogManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FUBlogManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FUBlogManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FUBlogManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FUBlogManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FUBlogManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FUBlogManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FUBlogManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FUBlogManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [FUBlogManagement] SET  MULTI_USER 
GO
ALTER DATABASE [FUBlogManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FUBlogManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FUBlogManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FUBlogManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FUBlogManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FUBlogManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FUBlogManagement', N'ON'
GO
ALTER DATABASE [FUBlogManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [FUBlogManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FUBlogManagement]
GO
/****** Object:  Table [dbo].[BlogHistory]    Script Date: 10/1/2023 11:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogHistory](
	[HistoryID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[PromptStatus] [varchar](50) NOT NULL,
	[ToStatus] [varchar](50) NOT NULL,
	[Datetime] [datetime] NOT NULL,
	[Description] [nchar](10) NOT NULL,
 CONSTRAINT [PK_BlogHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC,
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/1/2023 11:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CategoryDescription] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 10/1/2023 11:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [varchar](50) NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[Context] [varchar](50) NOT NULL,
	[PublishTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Award] [bit] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 10/1/2023 11:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[React] [int] NOT NULL,
	[Comment] [varchar](50) NOT NULL,
	[AppovedBy] [varchar](50) NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[Title] [varchar](500) NULL,
	[PostContent] [varchar](5000) NOT NULL,
	[Award] [bit] NULL,
	[Approve] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[ApproveTime] [datetime] NOT NULL,
	[Image] [varchar](50) NULL,
 CONSTRAINT [PK_Threads] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reaction]    Script Date: 10/1/2023 11:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reaction](
	[ReactID] [int] NOT NULL,
	[ReactName] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Image] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reaction] PRIMARY KEY CLUSTERED 
(
	[ReactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 10/1/2023 11:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportID] [int] NOT NULL,
	[PostID] [int] NULL,
	[CommentID] [int] NULL,
	[Reporter] [varchar](50) NULL,
	[Status] [bit] NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 10/1/2023 11:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectID] [int] NOT NULL,
	[SubjecName] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 10/1/2023 11:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [int] NOT NULL,
	[TagName] [varchar](50) NOT NULL,
	[TagDescription] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 10/1/2023 11:01:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserID] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
	[Birthdate] [date] NULL,
	[Award] [int] NULL,
	[NumberOfPosts] [int] NULL,
	[Status] [bit] NULL,
	[Description] [varchar](50) NULL,
	[Major] [varchar](50) NOT NULL,
	[Image] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription], [Status]) VALUES (1, N'IT', N'IT related', 1)
GO
INSERT [dbo].[Comment] ([CommentID], [Author], [Context], [PublishTime], [Status], [Award]) VALUES (N'1', N'SE150618', N'Hehehe', CAST(N'2023-09-15T23:22:21.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[Post] ([PostID], [CategoryID], [TagID], [SubjectID], [React], [Comment], [AppovedBy], [Author], [Title], [PostContent], [Award], [Approve], [Status], [ApproveTime], [Image]) VALUES (1, 1, 1, 1, 1, N'1', N'SE150618', N'SE171021', NULL, N'Hehe', 1, 1, 1, CAST(N'2023-02-12T09:08:07.000' AS DateTime), N'1')
GO
INSERT [dbo].[Reaction] ([ReactID], [ReactName], [Description], [Image]) VALUES (1, N'Hehe', N'Hehehe', N'01')
GO
INSERT [dbo].[Subject] ([SubjectID], [SubjecName], [Description], [Status]) VALUES (1, N'SE', N'Software Engineer', 1)
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [TagDescription], [Status]) VALUES (1, N'Academic', N'Hoc thuat', 1)
GO
INSERT [dbo].[tblUser] ([UserID], [UserName], [Password], [RoleID], [Birthdate], [Award], [NumberOfPosts], [Status], [Description], [Major], [Image]) VALUES (N'SE150618', N'Hoangan', N'12345', N'Admin', CAST(N'2001-05-09' AS Date), 1, 1, 1, N'hehe', N'SE', NULL)
INSERT [dbo].[tblUser] ([UserID], [UserName], [Password], [RoleID], [Birthdate], [Award], [NumberOfPosts], [Status], [Description], [Major], [Image]) VALUES (N'SE171021', N'Duc', N'123456', N'User', CAST(N'2003-12-12' AS Date), 1, 0, 0, N'hehehe', N'IA', NULL)
GO
ALTER TABLE [dbo].[BlogHistory]  WITH CHECK ADD  CONSTRAINT [FK_BlogHistory_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[BlogHistory] CHECK CONSTRAINT [FK_BlogHistory_Post]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Reaction] FOREIGN KEY([React])
REFERENCES [dbo].[Reaction] ([ReactID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Reaction]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Threads_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Threads_Category]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Threads_Comments] FOREIGN KEY([Comment])
REFERENCES [dbo].[Comment] ([CommentID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Threads_Comments]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Threads_Subjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([SubjectID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Threads_Subjects]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Threads_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([TagID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Threads_Tag]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Threads_User] FOREIGN KEY([Author])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Threads_User]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Post]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_User] FOREIGN KEY([Reporter])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_User]
GO
USE [master]
GO
ALTER DATABASE [FUBlogManagement] SET  READ_WRITE 
GO
