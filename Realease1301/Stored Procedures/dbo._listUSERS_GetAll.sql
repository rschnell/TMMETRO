SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'listUSERS' table.
CREATE PROCEDURE [dbo].[_listUSERS_GetAll]
AS
	SELECT * FROM [dbo].[listUSERS]
GO
