SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'SCH_Activity' table.
CREATE PROCEDURE [dbo].[_SCH_Activity_GetAll]
AS
	SELECT * FROM [dbo].[SCH_Activity]
GO
