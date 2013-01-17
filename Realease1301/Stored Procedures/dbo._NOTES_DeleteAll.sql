SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'NOTES' table.
CREATE PROCEDURE [dbo].[_NOTES_DeleteAll]
AS
	DELETE FROM [dbo].[NOTES]
GO
