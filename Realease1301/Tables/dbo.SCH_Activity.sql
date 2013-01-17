CREATE TABLE [dbo].[SCH_Activity]
(
[ActivityID] [int] NOT NULL IDENTITY(1, 1),
[Status] [int] NULL CONSTRAINT [DF_Activity_Status] DEFAULT ((0)),
[Subject] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUBID] [int] NULL,
[StartTime] [smalldatetime] NULL CONSTRAINT [DF_Activity_StartDateTimeUtc] DEFAULT (getutcdate()),
[EndTime] [smalldatetime] NULL,
[Description] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Location] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AllDay] [bit] NULL CONSTRAINT [DF_Activity_AllDayEvent] DEFAULT ((0)),
[CASEID] [int] NULL,
[ACTIONID] [int] NULL,
[RECURRENCEINFO] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REMINDERINFO] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EVENTTYPE] [int] NULL,
[label] [int] NULL,
[ResourceID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SCH_Activity] ADD CONSTRAINT [Activity_PK] PRIMARY KEY NONCLUSTERED  ([ActivityID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ACTIONID] ON [dbo].[SCH_Activity] ([ACTIONID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CASEID] ON [dbo].[SCH_Activity] ([CASEID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SUBID] ON [dbo].[SCH_Activity] ([SUBID]) ON [PRIMARY]
GO
