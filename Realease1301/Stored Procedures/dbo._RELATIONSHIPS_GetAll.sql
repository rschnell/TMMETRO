SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'RELATIONSHIPS' table.
CREATE PROCEDURE [dbo].[_RELATIONSHIPS_GetAll]
AS
	SELECT * FROM [dbo].[RELATIONSHIPS]
GO