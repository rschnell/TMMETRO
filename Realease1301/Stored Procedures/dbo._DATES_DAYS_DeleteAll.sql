SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'DATES_DAYS' table.
CREATE PROCEDURE [dbo].[_DATES_DAYS_DeleteAll]
AS
	DELETE FROM [dbo].[DATES_DAYS]
GO