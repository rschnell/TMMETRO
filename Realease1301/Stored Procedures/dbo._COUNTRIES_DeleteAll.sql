SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'COUNTRIES' table.
CREATE PROCEDURE [dbo].[_COUNTRIES_DeleteAll]
AS
	DELETE FROM [dbo].[COUNTRIES]
GO
