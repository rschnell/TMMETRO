CREATE TABLE [dbo].[IMProviders]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[IMCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMUserName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMPassword] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMDescription] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMemail] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IMProviders] ADD CONSTRAINT [PK_IMProviders] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
