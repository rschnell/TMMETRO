SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'RULES' table.
CREATE PROCEDURE [dbo].[_RULES_DeleteAll]
AS
	DELETE FROM [dbo].[RULES]
GO
