SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'LANGUAGES' table.
CREATE PROCEDURE [dbo].[_LANGUAGES_DeleteAll]
AS
	DELETE FROM [dbo].[LANGUAGES]
GO