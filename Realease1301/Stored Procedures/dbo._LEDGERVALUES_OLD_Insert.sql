SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'LEDGERVALUES_OLD' table.
CREATE PROCEDURE [dbo].[_LEDGERVALUES_OLD_Insert]
	@VALUEID int,
	@DiaryID int,
	@ValueTypeID int,
	@TotalValue numeric(9,3),
	@Description text,
	@ValueDate datetime,
	@Active bit,
	@ValueFromDate datetime,
	@ValueToDate datetime,
	@GroupID int,
	@Location2TypeId int,
	@City ntext,
	@RateTypeId int,
	@AssetTypeId int,
	@AssetUOMId int,
	@CurrencyTypeID int,
	@Quantity numeric(9,3),
	@UnitValue numeric(9,3),
	@AssetDescription ntext,
	@Country nchar(60),
	@CurrencyCode char(3),
	@CurrencyRate numeric(18,3),
	@CurrencyPer int,
	@IsRECOVERED bit,
	@AssetClass ntext
AS
	INSERT INTO [dbo].[LEDGERVALUES_OLD]
	(
		[VALUEID],
		[DiaryID],
		[ValueTypeID],
		[TotalValue],
		[Description],
		[ValueDate],
		[Active],
		[ValueFromDate],
		[ValueToDate],
		[GroupID],
		[Location2TypeId],
		[City],
		[RateTypeId],
		[AssetTypeId],
		[AssetUOMId],
		[CurrencyTypeID],
		[Quantity],
		[UnitValue],
		[AssetDescription],
		[Country],
		[CurrencyCode],
		[CurrencyRate],
		[CurrencyPer],
		[IsRECOVERED],
		[AssetClass]
	)
	VALUES
	(
		@VALUEID,
		@DiaryID,
		@ValueTypeID,
		@TotalValue,
		@Description,
		@ValueDate,
		@Active,
		@ValueFromDate,
		@ValueToDate,
		@GroupID,
		@Location2TypeId,
		@City,
		@RateTypeId,
		@AssetTypeId,
		@AssetUOMId,
		@CurrencyTypeID,
		@Quantity,
		@UnitValue,
		@AssetDescription,
		@Country,
		@CurrencyCode,
		@CurrencyRate,
		@CurrencyPer,
		@IsRECOVERED,
		@AssetClass
	)
GO
