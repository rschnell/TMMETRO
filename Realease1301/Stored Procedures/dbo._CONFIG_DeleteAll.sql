SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'CONFIG' table.
CREATE PROCEDURE [dbo].[_CONFIG_DeleteAll]
AS
	DELETE FROM [dbo].[CONFIG]
GO
