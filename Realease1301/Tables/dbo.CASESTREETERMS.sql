CREATE TABLE [dbo].[CASESTREETERMS]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[TREEID] [int] NOT NULL CONSTRAINT [DF_CASESTREETERMS_TREEID] DEFAULT ((0)),
[CATEGORYID] [int] NULL,
[UPDATEBYID] [int] NULL,
[UPDATEDBY] [nchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LASTUPDATED] [datetime] NULL,
[BASETERM] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TEXT1] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TEXT2] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TEXT3] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TEXT4] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TEXT5] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TEXT6] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TEXT7] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TEXT8] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ENUSTR] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEDETR] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[THTHTR] [nvarchar] (max) COLLATE Thai_BIN NULL,
[ENUSTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEDETP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEDETPTIP] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[THTHTP] [nvarchar] (max) COLLATE Thai_BIN NULL,
[enUSTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_enUSTPTIP] DEFAULT (''),
[ENGBTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_ENGBTP] DEFAULT (''),
[ENGBTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_ENGBTPTIP] DEFAULT (''),
[THTHTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_THTHTPTIP] DEFAULT (''),
[NLNLTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_NLNLTP] DEFAULT (''),
[NLNLTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_NLNLTPTIP] DEFAULT (''),
[TRTRTP] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRTRTPTIP] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GBGBTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_GBGBTP] DEFAULT (''),
[GBGBTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_GBGBTPTIP] DEFAULT (''),
[HEILTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_HEILTP] DEFAULT (''),
[HEILTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_HEILTPTIP] DEFAULT (''),
[AREGTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_AREGTP] DEFAULT (''),
[AREGTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_AREGTPTIP] DEFAULT (''),
[ZHCNTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_ZHCNTP] DEFAULT (''),
[ZHCNTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_ZHCNTPTIP] DEFAULT (''),
[VIVNTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_VIVNTP] DEFAULT (''),
[VIVNTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_VIVNTPTIP] DEFAULT (''),
[JAJPTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_JAJPTP] DEFAULT (''),
[JAJPTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_JAJPTPTIP] DEFAULT (''),
[ENNLTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_ENNLTP] DEFAULT (''),
[ENNLTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_ENNLTPTIP] DEFAULT (''),
[JAJATP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_JAJATP] DEFAULT (''),
[JAJATPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_JAJATPTIP] DEFAULT (''),
[ENENTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_ENENTP] DEFAULT (''),
[ENENTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_ENENTPTIP] DEFAULT (''),
[FRFRTP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_FRFRTP] DEFAULT (''),
[FRFRTPTIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CASESTREETERMS_FRFRTPTIP] DEFAULT ('')
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CASESTREETERMS] ADD CONSTRAINT [PK_CASESTREETERMS] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_CASESTREETERMS_7_308065475__K2_7] ON [dbo].[CASESTREETERMS] ([TREEID]) INCLUDE ([BASETERM]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_CASESTREETERMS_7_308065475__K2_7_8] ON [dbo].[CASESTREETERMS] ([TREEID]) INCLUDE ([BASETERM], [TEXT1]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_CASESTREETERMS_7_308065475__K2_K1_K4_K5_K6_7_8_9_10_11_12_13_14_15_16_17_18_19_20_21_22_23_24_25_26_27_28_29_30_31_] ON [dbo].[CASESTREETERMS] ([TREEID], [ID], [UPDATEBYID], [UPDATEDBY], [LASTUPDATED]) INCLUDE ([AREGTP], [AREGTPTIP], [BASETERM], [DEDETP], [DEDETPTIP], [DEDETR], [ENENTP], [ENENTPTIP], [ENGBTP], [ENGBTPTIP], [ENNLTP], [ENNLTPTIP], [ENUSTP], [enUSTPTIP], [ENUSTR], [FRFRTP], [FRFRTPTIP], [GBGBTP], [GBGBTPTIP], [HEILTP], [HEILTPTIP], [JAJATP], [JAJATPTIP], [JAJPTP], [JAJPTPTIP], [NLNLTP], [NLNLTPTIP], [TEXT1], [TEXT2], [TEXT3], [TEXT4], [TEXT5], [TEXT6], [TEXT7], [TEXT8], [THTHTP], [THTHTPTIP], [THTHTR], [TRTRTP], [TRTRTPTIP], [VIVNTP], [VIVNTPTIP], [ZHCNTP], [ZHCNTPTIP]) ON [PRIMARY]
GO
CREATE STATISTICS [_dta_stat_308065475_1_4_5] ON [dbo].[CASESTREETERMS] ([ID], [UPDATEBYID], [UPDATEDBY])
GO
CREATE STATISTICS [_dta_stat_308065475_4_5_6_1] ON [dbo].[CASESTREETERMS] ([UPDATEBYID], [UPDATEDBY], [LASTUPDATED], [ID])
GO
EXEC sp_addextendedproperty N'MS_Description', N'The base terms from which all others are derived', 'SCHEMA', N'dbo', 'TABLE', N'CASESTREETERMS', 'COLUMN', N'BASETERM'
GO
