SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'SCH_Resource' table.
CREATE PROCEDURE [dbo].[_SCH_Resource_GetAll]
AS
	SELECT * FROM [dbo].[SCH_Resource]
GO
