SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'REFERENCES' table.
CREATE PROCEDURE [dbo].[_REFERENCES_GetAll]
AS
	SELECT * FROM [dbo].[REFERENCES]
GO
