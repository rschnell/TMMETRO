SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'REPORTS' table.
CREATE PROCEDURE [dbo].[_REPORTS_Update]
	-- The rest of writeable parameters
	@DESCRIPTION nvarchar(max),
	@NAME nvarchar(50),
	@PARAMETERS nvarchar(max),
	@ACTIVE bit,
	@REPORTTYPE int,
	@SUBSCRIPTIONID int,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[REPORTS] SET
		[DESCRIPTION] = @DESCRIPTION,
		[NAME] = @NAME,
		[PARAMETERS] = @PARAMETERS,
		[ACTIVE] = @ACTIVE,
		[REPORTTYPE] = @REPORTTYPE,
		[SUBSCRIPTIONID] = @SUBSCRIPTIONID
	WHERE
		[ID] = @ID
GO
