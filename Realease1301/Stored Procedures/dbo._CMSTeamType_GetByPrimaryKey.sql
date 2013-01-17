SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CMSTeamType' table using the primary key value.
CREATE PROCEDURE [dbo].[_CMSTeamType_GetByPrimaryKey]
	@TeamTypeID int
AS
	SELECT * FROM [dbo].[CMSTeamType] WHERE
		[TeamTypeID] = @TeamTypeID
GO
