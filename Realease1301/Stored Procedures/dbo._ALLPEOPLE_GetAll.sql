SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'ALLPEOPLE' table.
CREATE PROCEDURE [dbo].[_ALLPEOPLE_GetAll]
AS
	SELECT * FROM [dbo].[ALLPEOPLE]
GO
