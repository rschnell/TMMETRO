SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'CASESTREE' table.
CREATE PROCEDURE [dbo].[_CASESTREE_DeleteAll]
AS
	DELETE FROM [dbo].[CASESTREE]
GO