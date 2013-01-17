SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'listIMPACT' table.
CREATE PROCEDURE [dbo].[_listIMPACT_GetAll]
AS
	SELECT * FROM [dbo].[listIMPACT]
GO
