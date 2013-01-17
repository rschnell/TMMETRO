SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'MyOriginalTeams' table.
CREATE PROCEDURE [dbo].[_MyOriginalTeams_GetAll]
AS
	SELECT * FROM [dbo].[MyOriginalTeams]
GO
