CREATE TABLE [dbo].[docs]
(
[docID] [int] NOT NULL IDENTITY(1, 1),
[pdfID] [int] NOT NULL,
[docDate] [datetime] NOT NULL,
[docStatus] [int] NOT NULL,
[docSettings] [int] NOT NULL,
[docXml] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[docOutputData] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[docs] ADD CONSTRAINT [PK_docs] PRIMARY KEY CLUSTERED  ([docID]) ON [PRIMARY]
GO
