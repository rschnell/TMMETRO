SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'DIARY' table using the primary key value.
CREATE PROCEDURE [dbo].[_DIARY_DeleteByPrimaryKey]
	@DIARYID int
AS
	DELETE FROM [dbo].[DIARY] WHERE
		[DIARYID] = @DIARYID
GO
