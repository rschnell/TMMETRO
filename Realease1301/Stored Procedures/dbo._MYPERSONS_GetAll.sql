SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'MYPERSONS' table.
CREATE PROCEDURE [dbo].[_MYPERSONS_GetAll]
AS
	SELECT * FROM [dbo].[MYPERSONS]
GO
