CREATE TABLE [dbo].[REPORTSCHEDULEEMAILS]
(
[REPORTSCHEDULEEMAILID] [int] NOT NULL IDENTITY(1, 1),
[REPORTSCHEDULEID] [int] NULL,
[EMAIL] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
