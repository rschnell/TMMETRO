SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'DIARYEX' table.
CREATE PROCEDURE [dbo].[_DIARYEX_GetAll]
AS
	SELECT * FROM [dbo].[DIARYEX]
GO
