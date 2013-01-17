SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'TAGS' table.
CREATE PROCEDURE [dbo].[_TAGS_DeleteAll]
AS
	DELETE FROM [dbo].[TAGS]
GO
