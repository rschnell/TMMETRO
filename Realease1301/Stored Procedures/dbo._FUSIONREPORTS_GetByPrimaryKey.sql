SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'FUSIONREPORTS' table using the primary key value.
CREATE PROCEDURE [dbo].[_FUSIONREPORTS_GetByPrimaryKey]
	@REPORTID int
AS
	SELECT * FROM [dbo].[FUSIONREPORTS] WHERE
		[REPORTID] = @REPORTID
GO