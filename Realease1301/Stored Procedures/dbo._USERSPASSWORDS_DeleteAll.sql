SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'USERSPASSWORDS' table.
CREATE PROCEDURE [dbo].[_USERSPASSWORDS_DeleteAll]
AS
	DELETE FROM [dbo].[USERSPASSWORDS]
GO
