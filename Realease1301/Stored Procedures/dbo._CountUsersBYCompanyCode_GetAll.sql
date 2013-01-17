SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CountUsersBYCompanyCode' table.
CREATE PROCEDURE [dbo].[_CountUsersBYCompanyCode_GetAll]
AS
	SELECT * FROM [dbo].[CountUsersBYCompanyCode]
GO
