SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'VALUES' table.
CREATE PROCEDURE [dbo].[_VALUES_Update]
	-- The rest of writeable parameters
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
	@CurrencyCode char(3),
	-- Primary key parameters
	@VALUEID int
AS
	UPDATE [dbo].[VALUES] SET
		[DiaryID] = @DiaryID,
		[ValueTypeID] = @ValueTypeID,
		[TotalValue] = @TotalValue,
		[Description] = @Description,
		[ValueDate] = @ValueDate,
		[Active] = @Active,
		[ValueFromDate] = @ValueFromDate,
		[ValueToDate] = @ValueToDate,
		[Location1TypeId] = @Location1TypeId,
		[Location2TypeId] = @Location2TypeId,
		[City] = @City,
		[RateTypeId] = @RateTypeId,
		[AssetTypeId] = @AssetTypeId,
		[AssetUOMId] = @AssetUOMId,
		[CurrencyTypeID] = @CurrencyTypeID,
		[Quantity] = @Quantity,
		[UnitValue] = @UnitValue,
		[AssetDescription] = @AssetDescription,
		[Country] = @Country,
		[CurrencyCode] = @CurrencyCode
	WHERE
		[VALUEID] = @VALUEID
GO
