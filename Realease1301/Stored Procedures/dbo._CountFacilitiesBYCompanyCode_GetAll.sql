SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CountFacilitiesBYCompanyCode' table.
CREATE PROCEDURE [dbo].[_CountFacilitiesBYCompanyCode_GetAll]
AS
	SELECT * FROM [dbo].[CountFacilitiesBYCompanyCode]
GO
