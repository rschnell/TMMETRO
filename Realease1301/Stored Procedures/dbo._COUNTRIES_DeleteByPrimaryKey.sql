SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'COUNTRIES' table using the primary key value.
CREATE PROCEDURE [dbo].[_COUNTRIES_DeleteByPrimaryKey]
	@COUNTRYID int
AS
	DELETE FROM [dbo].[COUNTRIES] WHERE
		[COUNTRYID] = @COUNTRYID
GO
