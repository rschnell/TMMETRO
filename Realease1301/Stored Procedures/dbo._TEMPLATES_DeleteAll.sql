SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'TEMPLATES' table.
CREATE PROCEDURE [dbo].[_TEMPLATES_DeleteAll]
AS
	DELETE FROM [dbo].[TEMPLATES]
GO
