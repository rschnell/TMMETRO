SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'MyGroup' table.
CREATE PROCEDURE [dbo].[_MyGroup_GetAll]
AS
	SELECT * FROM [dbo].[MyGroup]
GO
