CREATE TABLE [dbo].[ETEMPLATES]
(
[ETEMPLATEID] [int] NOT NULL IDENTITY(1, 1),
[TITLE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETEMPLATETYPE] [int] NULL,
[SUBSCRIPTIONID] [int] NULL,
[UPDATEDBY] [int] NULL,
[UPDATED] [datetime] NULL,
[LOCATION] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FILENAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVE] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ETEMPLATES] ADD CONSTRAINT [PK_ETEMPLATES] PRIMARY KEY CLUSTERED  ([ETEMPLATEID]) ON [PRIMARY]
GO
