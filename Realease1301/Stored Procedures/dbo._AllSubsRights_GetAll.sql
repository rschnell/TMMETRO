SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'AllSubsRights' table.
CREATE PROCEDURE [dbo].[_AllSubsRights_GetAll]
AS
	SELECT * FROM [dbo].[AllSubsRights]
GO
