SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'TEMPLATES' table.
CREATE PROCEDURE [dbo].[_TEMPLATES_Update]
	-- The rest of writeable parameters
	@TEMPLATEID int,
	@TEMPLATENAME nchar(50),
	@SUBSCRIPTION int,
	@GLOBAL bit,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[TEMPLATES] SET
		[TEMPLATEID] = @TEMPLATEID,
		[TEMPLATENAME] = @TEMPLATENAME,
		[SUBSCRIPTION] = @SUBSCRIPTION,
		[GLOBAL] = @GLOBAL
	WHERE
		[ID] = @ID
GO
