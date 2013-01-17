SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CountActionListItems' table.
CREATE PROCEDURE [dbo].[_CountActionListItems_GetAll]
AS
	SELECT * FROM [dbo].[CountActionListItems]
GO
