SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes all records from the 'CASESTREE_METRO' table.
CREATE PROCEDURE [dbo].[_CASESTREE_METRO_DeleteAll]
AS
	DELETE FROM [dbo].[CASESTREE_METRO]
GO
