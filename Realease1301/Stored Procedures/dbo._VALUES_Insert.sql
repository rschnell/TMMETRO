SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'VALUES' table.
CREATE PROCEDURE [dbo].[_VALUES_Insert]
	@DiaryID int,
	@ValueTypeID int,
	@TotalValue numeric(9,3),
	@Description text,
	@ValueDate datetime,
	@Active bit,
	@ValueFromDate datetime,
	@ValueToDate datetime,
	@Location1TypeId int,
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
	@CurrencyCode char(3)
AS
	INSERT INTO [dbo].[VALUES]
	(
		[DiaryID],
		[ValueTypeID],
		[TotalValue],
		[Description],
		[ValueDate],
		[Active],
		[ValueFromDate],
		[ValueToDate],
		[Location1TypeId],
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
		[CurrencyCode]
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
		@Location1TypeId,
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
		@CurrencyCode
	)
	SELECT @@IDENTITY
GO
