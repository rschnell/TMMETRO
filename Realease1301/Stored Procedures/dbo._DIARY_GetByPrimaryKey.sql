SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'DIARY' table using the primary key value.
CREATE PROCEDURE [dbo].[_DIARY_GetByPrimaryKey]
	@DIARYID int
AS
	SELECT * FROM [dbo].[DIARY] WHERE
		[DIARYID] = @DIARYID
GO
