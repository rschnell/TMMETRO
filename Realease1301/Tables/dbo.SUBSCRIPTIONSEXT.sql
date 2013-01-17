CREATE TABLE [dbo].[SUBSCRIPTIONSEXT]
(
[SUBSCRIPTIONID] [int] NOT NULL CONSTRAINT [DF_SUBSCRIPTIONSEXT_SUBSCRIPTIONID] DEFAULT ((0)),
[FLAG4] [bit] NOT NULL CONSTRAINT [DF_SUBSCRIPTIONSEXT_FLAG4] DEFAULT ((0)),
[FLAG5] [bit] NOT NULL CONSTRAINT [DF_SUBSCRIPTIONSEXT_FLAG5] DEFAULT ((0)),
[FLAG6] [bit] NOT NULL CONSTRAINT [DF_SUBSCRIPTIONSEXT_FLAG6] DEFAULT ((0)),
[DAYS] [int] NOT NULL CONSTRAINT [DF_SUBSCRIPTIONSEXT_DAYS] DEFAULT ((10))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SUBSCRIPTIONSEXT] ADD CONSTRAINT [PK_SUBSCRIPTIONSEXT] PRIMARY KEY CLUSTERED  ([SUBSCRIPTIONID]) ON [PRIMARY]
GO
