SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'REPORTS' table.
CREATE PROCEDURE [dbo].[_REPORTS_DeleteAll]
AS
	DELETE FROM [dbo].[REPORTS]
GO