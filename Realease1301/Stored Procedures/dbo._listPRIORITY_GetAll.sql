SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'listPRIORITY' table.
CREATE PROCEDURE [dbo].[_listPRIORITY_GetAll]
AS
	SELECT * FROM [dbo].[listPRIORITY]
GO
