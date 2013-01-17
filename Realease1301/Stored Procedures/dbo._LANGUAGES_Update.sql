SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'LANGUAGES' table.
CREATE PROCEDURE [dbo].[_LANGUAGES_Update]
	-- The rest of writeable parameters
	@LANGCode nchar(2),
	@SITEID int,
	@CultureCode nchar(2),
	@LANGDisplay nchar(20),
	-- Primary key parameters
	@LANGID int
AS
	UPDATE [dbo].[LANGUAGES] SET
		[LANGCode] = @LANGCode,
		[SITEID] = @SITEID,
		[CultureCode] = @CultureCode,
		[LANGDisplay] = @LANGDisplay
	WHERE
		[LANGID] = @LANGID
GO
