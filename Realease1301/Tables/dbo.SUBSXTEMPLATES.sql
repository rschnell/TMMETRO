CREATE TABLE [dbo].[SUBSXTEMPLATES]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[SUBSCRIPTIONID] [int] NULL,
[TEMPLATEID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SUBSXTEMPLATES] ADD CONSTRAINT [PK_SUBSXTEMPLATES] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
