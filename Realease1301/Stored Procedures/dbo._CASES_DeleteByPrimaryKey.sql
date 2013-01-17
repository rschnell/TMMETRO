SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CASES' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASES_DeleteByPrimaryKey]
	@CASEID int
AS
	DELETE FROM [dbo].[CASES] WHERE
		[CASEID] = @CASEID
GO
