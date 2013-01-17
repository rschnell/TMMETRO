SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes all records from the 'Configuration' table.
CREATE PROCEDURE [dbo].[_Configuration_DeleteAll]
AS
	DELETE FROM [dbo].[Configuration]
GO
