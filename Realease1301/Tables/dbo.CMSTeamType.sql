CREATE TABLE [dbo].[CMSTeamType]
(
[TeamTypeID] [int] NOT NULL IDENTITY(1, 1),
[NoInvitees] [int] NULL,
[MultiTeam] [bit] NOT NULL CONSTRAINT [DEFAULT_custom_TeamType_MultiTeam] DEFAULT ((0)),
[NoCases] [int] NOT NULL CONSTRAINT [DEFAULT_custom_TeamType_NoCases] DEFAULT ((0)),
[NoGigabytes] [float] NULL,
[TypeName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NoActions] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CMSTeamType] ADD CONSTRAINT [PK__CMSTeamT__AC847D6D3254513F] PRIMARY KEY CLUSTERED  ([TeamTypeID]) ON [PRIMARY]
GO
