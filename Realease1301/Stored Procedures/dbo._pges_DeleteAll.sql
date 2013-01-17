SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'pges' table.
CREATE PROCEDURE [dbo].[_pges_DeleteAll]
AS
	DELETE FROM [dbo].[pges]
GO
