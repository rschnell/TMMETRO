CREATE TABLE [dbo].[ALIENINVITES]
(
[AlienInvitesID] [int] NOT NULL IDENTITY(1, 1),
[InviteDate] [datetime] NULL,
[Email] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SkypeHandle] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriptionID] [int] NULL,
[CaseID] [int] NULL,
[ActionID] [int] NULL,
[UserID] [int] NULL,
[Message] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[URL] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SecurityCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Password] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL CONSTRAINT [DF_ALIENINVITES_Active] DEFAULT ((1)),
[InviteeID] [int] NULL,
[LastUseDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALIENINVITES] ADD CONSTRAINT [PK_ALIENINVITES] PRIMARY KEY CLUSTERED  ([AlienInvitesID]) ON [PRIMARY]
GO
