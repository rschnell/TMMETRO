SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'CMSTeamType' table.
CREATE PROCEDURE [dbo].[_CMSTeamType_DeleteAll]
AS
	DELETE FROM [dbo].[CMSTeamType]
GO
