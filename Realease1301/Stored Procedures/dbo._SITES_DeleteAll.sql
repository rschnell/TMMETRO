SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'SITES' table.
CREATE PROCEDURE [dbo].[_SITES_DeleteAll]
AS
	DELETE FROM [dbo].[SITES]
GO
