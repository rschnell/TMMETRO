SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'TAGS' table.
CREATE PROCEDURE [dbo].[_TAGS_GetAll]
AS
	SELECT * FROM [dbo].[TAGS]
GO
