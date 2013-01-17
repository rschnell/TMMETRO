SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'COUNTRIES' table using the primary key value.
CREATE PROCEDURE [dbo].[_COUNTRIES_GetByPrimaryKey]
	@COUNTRYID int
AS
	SELECT * FROM [dbo].[COUNTRIES] WHERE
		[COUNTRYID] = @COUNTRYID
GO
