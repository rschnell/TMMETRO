SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'NEWS' table.
CREATE PROCEDURE [dbo].[_NEWS_GetAll]
AS
	SELECT * FROM [dbo].[NEWS]
GO
