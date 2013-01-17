SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'TSMyValues' table.
CREATE PROCEDURE [dbo].[_TSMyValues_GetAll]
AS
	SELECT * FROM [dbo].[TSMyValues]
GO
