SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'SCH_ActivityResource' table.
CREATE PROCEDURE [dbo].[_SCH_ActivityResource_GetAll]
AS
	SELECT * FROM [dbo].[SCH_ActivityResource]
GO
