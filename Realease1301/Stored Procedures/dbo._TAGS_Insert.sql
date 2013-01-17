SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'TAGS' table.
CREATE PROCEDURE [dbo].[_TAGS_Insert]
	@TAG nvarchar(50)
AS
	INSERT INTO [dbo].[TAGS]
	(
		[TAG]
	)
	VALUES
	(
		@TAG
	)
	SELECT @@IDENTITY
GO
