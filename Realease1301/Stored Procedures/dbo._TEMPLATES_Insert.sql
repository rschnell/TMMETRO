SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'TEMPLATES' table.
CREATE PROCEDURE [dbo].[_TEMPLATES_Insert]
	@TEMPLATEID int,
	@TEMPLATENAME nchar(50),
	@SUBSCRIPTION int,
	@GLOBAL bit
AS
	INSERT INTO [dbo].[TEMPLATES]
	(
		[TEMPLATEID],
		[TEMPLATENAME],
		[SUBSCRIPTION],
		[GLOBAL]
	)
	VALUES
	(
		@TEMPLATEID,
		@TEMPLATENAME,
		@SUBSCRIPTION,
		@GLOBAL
	)
	SELECT @@IDENTITY
GO
