SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'sysdiagrams' table using the primary key value.
CREATE PROCEDURE [dbo].[_sysdiagrams_DeleteByPrimaryKey]
	@Diagram_id int
AS
	DELETE FROM [dbo].[sysdiagrams] WHERE
		[diagram_id] = @Diagram_id
GO
