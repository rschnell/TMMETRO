CREATE TABLE [dbo].[SCH_Resource]
(
[ResourceID] [int] NOT NULL IDENTITY(1, 1),
[ResourceName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ResourceDescription] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUBID] [int] NULL,
[IMAddress] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [int] NULL,
[Status] [int] NULL,
[Image] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SCH_Resource] ADD CONSTRAINT [Resource_PK] PRIMARY KEY NONCLUSTERED  ([ResourceID]) ON [PRIMARY]
GO
