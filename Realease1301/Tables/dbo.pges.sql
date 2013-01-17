CREATE TABLE [dbo].[pges]
(
[pgeID] [int] NOT NULL IDENTITY(1, 1),
[pdfID] [int] NOT NULL,
[docID] [int] NOT NULL,
[keyID] [int] NOT NULL,
[pgeDate] [datetime] NOT NULL,
[pgeNumber] [int] NOT NULL,
[pgeImageType] [int] NOT NULL,
[pgeImageData] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[pges] ADD CONSTRAINT [PK_pges] PRIMARY KEY CLUSTERED  ([pgeID]) ON [PRIMARY]
GO
