CREATE TABLE [dbo].[CASESXTAGS]
(
[CASEID] [int] NOT NULL,
[TAG] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CASESXTAGS] ADD CONSTRAINT [PK_CASESXTAGS] PRIMARY KEY CLUSTERED  ([CASEID]) ON [PRIMARY]
GO