SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'sysdiagrams' table.
CREATE PROCEDURE [dbo].[_sysdiagrams_Insert]
	@Name sysname,
	@Principal_id int,
	@Version int,
	@Definition varbinary(max)
AS
	INSERT INTO [dbo].[sysdiagrams]
	(
		[name],
		[principal_id],
		[version],
		[definition]
	)
	VALUES
	(
		@Name,
		@Principal_id,
		@Version,
		@Definition
	)
	SELECT @@IDENTITY
GO
