SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'POIGALLERY' table.
CREATE PROCEDURE [dbo].[_POIGALLERY_DeleteAll]
AS
	DELETE FROM [dbo].[POIGALLERY]
GO
