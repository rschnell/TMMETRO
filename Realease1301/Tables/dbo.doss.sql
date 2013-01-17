CREATE TABLE [dbo].[doss]
(
[dosId] [int] NOT NULL IDENTITY(1, 1),
[dosIp] [varchar] (39) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dosDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[doss] ADD CONSTRAINT [PK_doss] PRIMARY KEY CLUSTERED  ([dosId]) ON [PRIMARY]
GO
