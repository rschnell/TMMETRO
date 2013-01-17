SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'doss' table.
CREATE PROCEDURE [dbo].[_doss_DeleteAll]
AS
	DELETE FROM [dbo].[doss]
GO
