SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'USERS' table.
CREATE PROCEDURE [dbo].[_USERS_DeleteAll]
AS
	DELETE FROM [dbo].[USERS]
GO
