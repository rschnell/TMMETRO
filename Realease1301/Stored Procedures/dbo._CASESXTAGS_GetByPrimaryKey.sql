SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CASESXTAGS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESXTAGS_GetByPrimaryKey]
	@CASEID int
AS
	SELECT * FROM [dbo].[CASESXTAGS] WHERE
		[CASEID] = @CASEID
GO
