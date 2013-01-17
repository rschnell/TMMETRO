SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'CASES' table.
CREATE PROCEDURE [dbo].[_CASES_DeleteAll]
AS
	DELETE FROM [dbo].[CASES]
GO
