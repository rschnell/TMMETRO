SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CountActionFiles' table.
CREATE PROCEDURE [dbo].[_CountActionFiles_GetAll]
AS
	SELECT * FROM [dbo].[CountActionFiles]
GO
