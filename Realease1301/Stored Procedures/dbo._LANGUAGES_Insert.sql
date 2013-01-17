SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'LANGUAGES' table.
CREATE PROCEDURE [dbo].[_LANGUAGES_Insert]
	@LANGCode nchar(2),
	@SITEID int,
	@CultureCode nchar(2),
	@LANGDisplay nchar(20)
AS
	INSERT INTO [dbo].[LANGUAGES]
	(
		[LANGCode],
		[SITEID],
		[CultureCode],
		[LANGDisplay]
	)
	VALUES
	(
		@LANGCode,
		@SITEID,
		@CultureCode,
		@LANGDisplay
	)
	SELECT @@IDENTITY
GO
