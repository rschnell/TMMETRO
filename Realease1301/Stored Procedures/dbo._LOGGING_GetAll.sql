SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'LOGGING' table.
CREATE PROCEDURE [dbo].[_LOGGING_GetAll]
AS
	SELECT * FROM [dbo].[LOGGING]
GO
