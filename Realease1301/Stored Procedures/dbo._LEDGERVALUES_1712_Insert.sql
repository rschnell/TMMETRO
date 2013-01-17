SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'LEDGERVALUES_1712' table.
CREATE PROCEDURE [dbo].[_LEDGERVALUES_1712_Insert]
	@DiaryID int,
	@ValueTypeID int,
	@TotalValue numeric(18,3),
	@Description nvarchar(max),
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
	@Quantity numeric(18,3),
	@UnitValue numeric(18,3),
	@AssetDescription ntext,
	@Country nchar(60),
	@CurrencyCode char(3),
	@CurrencyRate numeric(18,3),
	@CurrencyPer int,
	@IsRECOVERED bit,
	@AssetClass ntext
AS
	INSERT INTO [dbo].[LEDGERVALUES_1712]
	(
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
	SELECT @@IDENTITY
GO
