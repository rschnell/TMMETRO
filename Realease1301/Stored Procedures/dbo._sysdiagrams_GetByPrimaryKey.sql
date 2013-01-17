SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'sysdiagrams' table using the primary key value.
CREATE PROCEDURE [dbo].[_sysdiagrams_GetByPrimaryKey]
	@Diagram_id int
AS
	SELECT * FROM [dbo].[sysdiagrams] WHERE
		[diagram_id] = @Diagram_id
GO
