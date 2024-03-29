CREATE TABLE [dbo].[CASESXUSERS]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[CASEID] [int] NOT NULL,
[ACTIONID] [int] NULL,
[USERID] [int] NOT NULL,
[INVITEDATE] [datetime] NULL,
[INVITEDBY] [int] NULL,
[NOINVITE] [bit] NULL CONSTRAINT [DF_CASESXUSERS_NOINVITE] DEFAULT ((0)),
[NOCHANGE] [int] NULL CONSTRAINT [DF_CASESXUSERS_NOCHANGE] DEFAULT ((0)),
[NOASSIGNEE] [int] NULL CONSTRAINT [DF_CASESXUSERS_NOASSIGNEE] DEFAULT ((0)),
[NOASSIGN] [int] NULL CONSTRAINT [DF_CASESXUSERS_NOASSIGN] DEFAULT ((0)),
[INVISIBLE] [int] NULL CONSTRAINT [DF_CASESXUSERS_INIVISIBLE] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CASESXUSERS] ADD CONSTRAINT [PK_CASESXUSERS] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_CASESXUSERS_8_2075154438__K3_K2_4] ON [dbo].[CASESXUSERS] ([ACTIONID], [CASEID]) INCLUDE ([USERID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CaseXUsersIndex] ON [dbo].[CASESXUSERS] ([CASEID], [ACTIONID], [USERID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_CASESXUSERS_8_2075154438__K4_K3_2] ON [dbo].[CASESXUSERS] ([USERID], [ACTIONID]) INCLUDE ([CASEID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_CASESXUSERS_8_2075154438__K4_K3_K1_5_6] ON [dbo].[CASESXUSERS] ([USERID], [ACTIONID], [ID]) INCLUDE ([INVITEDATE], [INVITEDBY]) ON [PRIMARY]
GO
CREATE STATISTICS [_dta_stat_2075154438_3_1_4] ON [dbo].[CASESXUSERS] ([ACTIONID], [ID], [USERID])
GO
CREATE STATISTICS [_dta_stat_2075154438_7_2_3_4] ON [dbo].[CASESXUSERS] ([CASEID], [ACTIONID], [USERID], [NOINVITE])
GO
CREATE STATISTICS [_dta_stat_2075154438_2_4] ON [dbo].[CASESXUSERS] ([CASEID], [USERID])
GO
