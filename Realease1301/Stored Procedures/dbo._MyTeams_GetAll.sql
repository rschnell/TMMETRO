SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'MyTeams' table.
CREATE PROCEDURE [dbo].[_MyTeams_GetAll]
AS
	SELECT * FROM [dbo].[MyTeams]
GO
