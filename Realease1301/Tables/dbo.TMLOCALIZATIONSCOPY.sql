CREATE TABLE [dbo].[TMLOCALIZATIONSCOPY]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[CODE] [nchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BASEKEY] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LOCAL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UPDATED] [datetime] NULL,
[CREATED] [datetime] NULL,
[UPDATEDBY] [int] NULL,
[RESOURCESET] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVE] [bit] NULL,
[UPDATEDBYUSER] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LOCKED] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
