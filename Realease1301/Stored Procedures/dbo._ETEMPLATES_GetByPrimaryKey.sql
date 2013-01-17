SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'ETEMPLATES' table using the primary key value.
CREATE PROCEDURE [dbo].[_ETEMPLATES_GetByPrimaryKey]
	@ETEMPLATEID int
AS
	SELECT * FROM [dbo].[ETEMPLATES] WHERE
		[ETEMPLATEID] = @ETEMPLATEID
GO
