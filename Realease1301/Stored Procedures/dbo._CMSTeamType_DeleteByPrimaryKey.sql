SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CMSTeamType' table using the primary key value.
CREATE PROCEDURE [dbo].[_CMSTeamType_DeleteByPrimaryKey]
	@TeamTypeID int
AS
	DELETE FROM [dbo].[CMSTeamType] WHERE
		[TeamTypeID] = @TeamTypeID
GO
