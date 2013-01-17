CREATE TABLE [dbo].[RULES_OLD]
(
[RULESID] [int] NOT NULL IDENTITY(1, 1),
[TITLE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[APPLIESTO] [nchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[APPLIESTOTYPE] [int] NULL,
[VALUE] [nchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FILTER] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RULETYPE] [int] NOT NULL,
[LOGICTYPE] [int] NULL,
[CREATEDBY] [int] NOT NULL,
[CREATED] [datetime] NULL,
[UPDATEDBY] [int] NULL,
[UPDATED] [datetime] NULL,
[SUBSCRIPTIONID] [int] NULL,
[ACTIVE] [bit] NULL,
[CASEID] [int] NULL,
[RULENO] [int] NULL,
[STEPNO] [int] NULL,
[TRIGGERFIELD] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
