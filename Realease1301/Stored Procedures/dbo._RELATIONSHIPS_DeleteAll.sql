SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'RELATIONSHIPS' table.
CREATE PROCEDURE [dbo].[_RELATIONSHIPS_DeleteAll]
AS
	DELETE FROM [dbo].[RELATIONSHIPS]
GO