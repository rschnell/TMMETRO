SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes all records from the 'SkypeCHAT' table.
CREATE PROCEDURE [dbo].[_SkypeCHAT_DeleteAll]
AS
	DELETE FROM [dbo].[SkypeCHAT]
GO
