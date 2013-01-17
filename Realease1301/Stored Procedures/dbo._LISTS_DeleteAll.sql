SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'LISTS' table.
CREATE PROCEDURE [dbo].[_LISTS_DeleteAll]
AS
	DELETE FROM [dbo].[LISTS]
GO
