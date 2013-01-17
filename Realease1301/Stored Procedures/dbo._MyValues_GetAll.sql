SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'MyValues' table.
CREATE PROCEDURE [dbo].[_MyValues_GetAll]
AS
	SELECT * FROM [dbo].[MyValues]
GO
