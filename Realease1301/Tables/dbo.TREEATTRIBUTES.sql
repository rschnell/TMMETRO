CREATE TABLE [dbo].[TREEATTRIBUTES]
(
[ATTID] [int] NOT NULL IDENTITY(1, 1),
[TREEID] [int] NULL,
[Code] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Attribute1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Attribute2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Attribute3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Attribute4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Attribute5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CategoryID] [int] NULL,
[ACTIVE] [bit] NULL,
[SUBSCRIPTIONID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TREEATTRIBUTES] ADD CONSTRAINT [PK_TREEATTRIBUTES] PRIMARY KEY CLUSTERED  ([ATTID]) ON [PRIMARY]
GO
