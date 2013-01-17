SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'TRANSLATIONS' table.
CREATE PROCEDURE [dbo].[_TRANSLATIONS_Insert]
	@CODE nchar(5),
	@BASEKEY nvarchar(max),
	@LOCAL nvarchar(max),
	@INUSE bit
AS
	INSERT INTO [dbo].[TRANSLATIONS]
	(
		[CODE],
		[BASEKEY],
		[LOCAL],
		[INUSE]
	)
	VALUES
	(
		@CODE,
		@BASEKEY,
		@LOCAL,
		@INUSE
	)
GO
