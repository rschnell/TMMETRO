SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CASESTREEBASE' table.
CREATE PROCEDURE [dbo].[_CASESTREEBASE_GetAll]
AS
	SELECT * FROM [dbo].[CASESTREEBASE]
GO
