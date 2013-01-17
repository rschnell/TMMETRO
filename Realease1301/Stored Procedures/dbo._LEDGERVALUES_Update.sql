SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'LEDGERVALUES' table.
CREATE PROCEDURE [dbo].[_LEDGERVALUES_Update]
	-- The rest of writeable parameters
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
	@AssetClass ntext,
	-- Primary key parameters
	@VALUEID int
AS
	UPDATE [dbo].[LEDGERVALUES] SET
		[DiaryID] = @DiaryID,
		[ValueTypeID] = @ValueTypeID,
		[TotalValue] = @TotalValue,
		[Description] = @Description,
		[ValueDate] = @ValueDate,
		[Active] = @Active,
		[ValueFromDate] = @ValueFromDate,
		[ValueToDate] = @ValueToDate,
		[GroupID] = @GroupID,
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
		[CurrencyCode] = @CurrencyCode,
		[CurrencyRate] = @CurrencyRate,
		[CurrencyPer] = @CurrencyPer,
		[IsRECOVERED] = @IsRECOVERED,
		[AssetClass] = @AssetClass
	WHERE
		[VALUEID] = @VALUEID
GO
