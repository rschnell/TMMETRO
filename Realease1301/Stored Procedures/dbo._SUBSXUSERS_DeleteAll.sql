SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'SUBSXUSERS' table.
CREATE PROCEDURE [dbo].[_SUBSXUSERS_DeleteAll]
AS
	DELETE FROM [dbo].[SUBSXUSERS]
GO
