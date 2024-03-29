CREATE TABLE [dbo].[FUSIONREPORTS]
(
[REPORTID] [int] NOT NULL IDENTITY(1, 1),
[TITLE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FUSIONKEY] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVE] [bit] NULL,
[DATECREATED] [datetime] NULL,
[DATEUPDATED] [datetime] NULL,
[ANIMATION] [bit] NULL,
[SHOWNAMES] [bit] NULL,
[SHOWPERCENTAGEVALUES] [bit] NULL,
[GRAPHTYPE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FUSIONREPORTS] ADD CONSTRAINT [PK_FUSIONREPORTS] PRIMARY KEY CLUSTERED  ([REPORTID]) ON [PRIMARY]
GO
