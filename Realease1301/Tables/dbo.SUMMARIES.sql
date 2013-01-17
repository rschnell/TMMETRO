CREATE TABLE [dbo].[SUMMARIES]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Title] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PREFIX] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SCOPE] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATECREATED] [datetime] NULL,
[DATEUPDATED] [datetime] NULL,
[VERSION] [int] NULL,
[Active] [bit] NULL CONSTRAINT [DF_SUMMARIES_Acxtive] DEFAULT ((1)),
[IsAdmin] [bit] NULL CONSTRAINT [DF_SUMMARIES_IsAdmin] DEFAULT ((0)),
[Path] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SUMMARIES] ADD CONSTRAINT [PK_SUMMARIES] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
