SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes all records from the 'Site' table.
CREATE PROCEDURE [dbo].[_SITE_DeleteAll]
AS
	DELETE FROM [dbo].[Site]
GO
