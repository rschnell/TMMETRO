SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'CASESXPERSONS' table.
CREATE PROCEDURE [dbo].[_CASESXPERSONS_DeleteAll]
AS
	DELETE FROM [dbo].[CASESXPERSONS]
GO
