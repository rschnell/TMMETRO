SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'USERSEXTENDED' table.
CREATE PROCEDURE [dbo].[_USERSEXTENDED_DeleteAll]
AS
	DELETE FROM [dbo].[USERSEXTENDED]
GO
