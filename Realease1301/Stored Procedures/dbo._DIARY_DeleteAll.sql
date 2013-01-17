SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'DIARY' table.
CREATE PROCEDURE [dbo].[_DIARY_DeleteAll]
AS
	DELETE FROM [dbo].[DIARY]
GO
