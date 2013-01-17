SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'NEWS' table.
CREATE PROCEDURE [dbo].[_NEWS_DeleteAll]
AS
	DELETE FROM [dbo].[NEWS]
GO
