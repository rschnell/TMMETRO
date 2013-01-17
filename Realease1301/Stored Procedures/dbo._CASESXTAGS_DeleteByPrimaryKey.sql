SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CASESXTAGS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESXTAGS_DeleteByPrimaryKey]
	@CASEID int
AS
	DELETE FROM [dbo].[CASESXTAGS] WHERE
		[CASEID] = @CASEID
GO
