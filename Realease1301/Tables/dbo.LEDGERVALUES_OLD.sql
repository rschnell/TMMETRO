CREATE TABLE [dbo].[LEDGERVALUES_OLD]
(
[VALUEID] [int] NULL,
[DiaryID] [int] NULL,
[ValueTypeID] [int] NULL,
[TotalValue] [numeric] (9, 3) NULL,
[Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ValueDate] [datetime] NULL,
[Active] [bit] NULL,
[ValueFromDate] [datetime] NULL,
[ValueToDate] [datetime] NULL,
[GroupID] [int] NULL,
[Location2TypeId] [int] NULL,
[City] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RateTypeId] [int] NULL,
[AssetTypeId] [int] NULL,
[AssetUOMId] [int] NULL,
[CurrencyTypeID] [int] NULL,
[Quantity] [numeric] (9, 3) NULL,
[UnitValue] [numeric] (9, 3) NULL,
[AssetDescription] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Country] [nchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CurrencyCode] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CurrencyRate] [numeric] (18, 3) NULL,
[CurrencyPer] [int] NULL,
[IsRECOVERED] [bit] NULL,
[AssetClass] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
