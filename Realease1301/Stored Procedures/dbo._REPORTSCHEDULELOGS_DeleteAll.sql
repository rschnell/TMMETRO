SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'REPORTSCHEDULELOGS' table.
CREATE PROCEDURE [dbo].[_REPORTSCHEDULELOGS_DeleteAll]
AS
	DELETE FROM [dbo].[REPORTSCHEDULELOGS]
GO
