SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes all records from the 'CATEGORIESBASEOLD' table.
CREATE PROCEDURE [dbo].[_CATEGORIESBASEOLD_DeleteAll]
AS
	DELETE FROM [dbo].[CATEGORIESBASEOLD]
GO
