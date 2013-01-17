SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CaseCategoryPivot' table.
CREATE PROCEDURE [dbo].[_CaseCategoryPivot_GetAll]
AS
	SELECT * FROM [dbo].[CaseCategoryPivot]
GO
