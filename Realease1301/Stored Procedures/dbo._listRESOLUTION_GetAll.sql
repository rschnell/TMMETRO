SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'listRESOLUTION' table.
CREATE PROCEDURE [dbo].[_listRESOLUTION_GetAll]
AS
	SELECT * FROM [dbo].[listRESOLUTION]
GO
