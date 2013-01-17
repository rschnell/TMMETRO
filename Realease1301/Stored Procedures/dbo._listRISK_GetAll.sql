SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'listRISK' table.
CREATE PROCEDURE [dbo].[_listRISK_GetAll]
AS
	SELECT * FROM [dbo].[listRISK]
GO
