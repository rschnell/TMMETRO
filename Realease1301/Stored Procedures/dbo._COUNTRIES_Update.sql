SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'COUNTRIES' table.
CREATE PROCEDURE [dbo].[_COUNTRIES_Update]
	-- The rest of writeable parameters
	@ID varchar(2),
	@REGION_NAME varchar(12),
	@COUNTRY_NAME varchar(50),
	@COUNTRY_CODE varchar(2),
	@CURRENCY_NAME varchar(25),
	@CURRENCY_CODE varchar(3),
	@COUNTRYCODE varchar(3),
	@RATE numeric(18,3),
	@RATEDATE datetime,
	@PER int,
	-- Primary key parameters
	@COUNTRYID int
AS
	UPDATE [dbo].[COUNTRIES] SET
		[ID] = @ID,
		[REGION_NAME] = @REGION_NAME,
		[COUNTRY_NAME] = @COUNTRY_NAME,
		[COUNTRY_CODE] = @COUNTRY_CODE,
		[CURRENCY_NAME] = @CURRENCY_NAME,
		[CURRENCY_CODE] = @CURRENCY_CODE,
		[COUNTRYCODE] = @COUNTRYCODE,
		[RATE] = @RATE,
		[RATEDATE] = @RATEDATE,
		[PER] = @PER
	WHERE
		[COUNTRYID] = @COUNTRYID
GO
