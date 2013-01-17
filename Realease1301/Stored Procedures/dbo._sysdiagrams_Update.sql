SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'sysdiagrams' table.
CREATE PROCEDURE [dbo].[_sysdiagrams_Update]
	-- The rest of writeable parameters
	@Name sysname,
	@Principal_id int,
	@Version int,
	@Definition varbinary(max),
	-- Primary key parameters
	@Diagram_id int
AS
	UPDATE [dbo].[sysdiagrams] SET
		[name] = @Name,
		[principal_id] = @Principal_id,
		[version] = @Version,
		[definition] = @Definition
	WHERE
		[diagram_id] = @Diagram_id
GO
