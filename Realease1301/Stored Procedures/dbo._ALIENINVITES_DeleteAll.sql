SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'ALIENINVITES' table.
CREATE PROCEDURE [dbo].[_ALIENINVITES_DeleteAll]
AS
	DELETE FROM [dbo].[ALIENINVITES]
GO
