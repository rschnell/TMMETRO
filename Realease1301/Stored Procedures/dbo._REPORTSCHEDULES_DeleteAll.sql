SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'REPORTSCHEDULES' table.
CREATE PROCEDURE [dbo].[_REPORTSCHEDULES_DeleteAll]
AS
	DELETE FROM [dbo].[REPORTSCHEDULES]
GO
