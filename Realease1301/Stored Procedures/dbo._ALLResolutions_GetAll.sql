SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'ALLResolutions' table.
CREATE PROCEDURE [dbo].[_ALLResolutions_GetAll]
AS
	SELECT * FROM [dbo].[ALLResolutions]
GO
