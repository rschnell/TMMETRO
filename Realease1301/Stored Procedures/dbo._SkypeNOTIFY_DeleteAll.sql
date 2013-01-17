SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes all records from the 'SkypeNOTIFY' table.
CREATE PROCEDURE [dbo].[_SkypeNOTIFY_DeleteAll]
AS
	DELETE FROM [dbo].[SkypeNOTIFY]
GO
