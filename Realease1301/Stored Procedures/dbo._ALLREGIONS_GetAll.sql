SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'ALLREGIONS' table.
CREATE PROCEDURE [dbo].[_ALLREGIONS_GetAll]
AS
	SELECT * FROM [dbo].[ALLREGIONS]
GO