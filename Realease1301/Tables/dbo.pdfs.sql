CREATE TABLE [dbo].[pdfs]
(
[pdfID] [int] NOT NULL IDENTITY(1, 1),
[pdfDate] [datetime] NOT NULL,
[pdfStatus] [int] NOT NULL,
[pdfVersion] [int] NOT NULL,
[pdfPageLoaded] [int] NOT NULL,
[pdfPageCount] [int] NOT NULL,
[pdfUserRights] [int] NOT NULL,
[pdfDpi] [int] NOT NULL,
[pdfDpiHigh] [int] NOT NULL,
[pdfFilename] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[pdfData] [image] NOT NULL,
[pdfDataLength] [int] NOT NULL,
[pdfDataHash] [binary] (64) NOT NULL,
[pdfXml] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[pdfText] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[pdfs] ADD CONSTRAINT [PK_pdfs] PRIMARY KEY CLUSTERED  ([pdfID]) ON [PRIMARY]
GO
