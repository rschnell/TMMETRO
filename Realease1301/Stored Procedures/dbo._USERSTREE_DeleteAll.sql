SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes all records from the 'USERSTREE' table.
CREATE PROCEDURE [dbo].[_USERSTREE_DeleteAll]
AS
	DELETE FROM [dbo].[USERSTREE]
GO
