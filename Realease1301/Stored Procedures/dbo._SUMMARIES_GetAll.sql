SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'SUMMARIES' table.
CREATE PROCEDURE [dbo].[_SUMMARIES_GetAll]
AS
	SELECT * FROM [dbo].[SUMMARIES]
GO
