SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CABINETSUBS' table.
CREATE PROCEDURE [dbo].[_CABINETSUBS_GetAll]
AS
	SELECT * FROM [dbo].[CABINETSUBS]
GO
