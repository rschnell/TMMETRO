SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'LOGGING_NOTRACE' table.
CREATE PROCEDURE [dbo].[_LOGGING_NOTRACE_GetAll]
AS
	SELECT * FROM [dbo].[LOGGING_NOTRACE]
GO
