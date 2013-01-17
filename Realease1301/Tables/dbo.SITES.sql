CREATE TABLE [dbo].[SITES]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[SiteID] [int] NOT NULL,
[SiteName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteDisplayName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SiteDescription] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteStatus] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SiteDomainName] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ACTIVE] [bit] NULL CONSTRAINT [DF_Site_ACTIVE] DEFAULT ((1)),
[CREATED] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SITES] ADD CONSTRAINT [PK_SITES] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
