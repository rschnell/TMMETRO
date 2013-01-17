SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CASES' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASES_GetByPrimaryKey]
	@CASEID int
AS
	SELECT * FROM [dbo].[CASES] WHERE
		[CASEID] = @CASEID
GO
