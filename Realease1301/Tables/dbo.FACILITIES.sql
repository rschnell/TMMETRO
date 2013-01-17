CREATE TABLE [dbo].[FACILITIES]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[COUNTRY] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMPANY] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMPANYCODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STREET] [nvarchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LONGNAME] [nvarchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CODE] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STORENAME] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CITY] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[POSTCODE] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TYPE] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X] [numeric] (15, 12) NULL,
[Y] [numeric] (15, 12) NULL,
[DATECREATED] [datetime] NULL,
[DATEUPDATED] [datetime] NULL,
[NOTE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SHORTCODE] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
