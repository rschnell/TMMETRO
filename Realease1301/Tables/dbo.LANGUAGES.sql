CREATE TABLE [dbo].[LANGUAGES]
(
[LANGID] [int] NOT NULL IDENTITY(1, 1),
[LANGCode] [nchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SITEID] [int] NOT NULL CONSTRAINT [DF_LANGUAGES_SITEID] DEFAULT ((0)),
[CultureCode] [nchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LANGDisplay] [nchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LANGUAGES] ADD CONSTRAINT [PK_LANGUAGES] PRIMARY KEY CLUSTERED  ([LANGID]) ON [PRIMARY]
GO
