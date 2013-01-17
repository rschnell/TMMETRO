SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'MyDiary' table.
CREATE PROCEDURE [dbo].[_MyDiary_GetAll]
AS
	SELECT * FROM [dbo].[MyDiary]
GO
