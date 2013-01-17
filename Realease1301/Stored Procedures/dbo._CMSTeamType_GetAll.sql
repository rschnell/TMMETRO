SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CMSTeamType' table.
CREATE PROCEDURE [dbo].[_CMSTeamType_GetAll]
AS
	SELECT * FROM [dbo].[CMSTeamType]
GO
