SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'IMProviders' table.
CREATE PROCEDURE [dbo].[_IMProviders_DeleteAll]
AS
	DELETE FROM [dbo].[IMProviders]
GO
