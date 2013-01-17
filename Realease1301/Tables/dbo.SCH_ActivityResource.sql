CREATE TABLE [dbo].[SCH_ActivityResource]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[ActivityID] [int] NOT NULL CONSTRAINT [DF__ActivityResource__ActivityID] DEFAULT ((0)),
[ResourceID] [int] NOT NULL CONSTRAINT [DF__ActivityResource__ResourceID] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SCH_ActivityResource] ADD CONSTRAINT [PK_ActivityResource] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
