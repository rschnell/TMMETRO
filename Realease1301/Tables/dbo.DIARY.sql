CREATE TABLE [dbo].[DIARY]
(
[DIARYID] [int] NOT NULL IDENTITY(1, 1),
[NoteHTM] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Note] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CASEID] [int] NULL,
[ACTIONID] [int] NULL,
[IsDescription] [bit] NOT NULL,
[_CMSUSERSRAISED] [int] NULL,
[_CMSDATEUPDATED] [datetime] NULL,
[_CMSTYPEOF] [int] NULL,
[Active] [bit] NOT NULL CONSTRAINT [DF_DIARY_Active] DEFAULT ((1)),
[CHANGETYPE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OLDVALUE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NEWVALUE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DIARY] ADD CONSTRAINT [PK_DIARY] PRIMARY KEY CLUSTERED  ([DIARYID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_DIARY_8_1673773020__K8D_3_5_7_14] ON [dbo].[DIARY] ([_CMSDATEUPDATED] DESC) INCLUDE ([_CMSUSERSRAISED], [ACTIONID], [CASEID], [Note]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_DIARY_8_1673773020__K5_K14_K7_K8_3] ON [dbo].[DIARY] ([ACTIONID], [CASEID], [_CMSUSERSRAISED], [_CMSDATEUPDATED]) INCLUDE ([Note]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_DIARY_8_1673773020__K1_K14_K5] ON [dbo].[DIARY] ([DIARYID], [CASEID], [ACTIONID]) ON [PRIMARY]
GO
