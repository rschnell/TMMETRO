SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSTIMESHEETSALL' table.
CREATE PROCEDURE [dbo].[_rptTSTIMESHEETSALL_GetAll]
AS
	SELECT * FROM [dbo].[rptTSTIMESHEETSALL]
GO