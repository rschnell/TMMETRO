SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'ETEMPLATES' table.
CREATE PROCEDURE [dbo].[_ETEMPLATES_Update]
	-- The rest of writeable parameters
	@TITLE nvarchar(50),
	@ETEMPLATETYPE int,
	@SUBSCRIPTIONID int,
	@UPDATEDBY int,
	@UPDATED datetime,
	@LOCATION nvarchar(100),
	@FILENAME nvarchar(100),
	@ACTIVE bit,
	-- Primary key parameters
	@ETEMPLATEID int
AS
	UPDATE [dbo].[ETEMPLATES] SET
		[TITLE] = @TITLE,
		[ETEMPLATETYPE] = @ETEMPLATETYPE,
		[SUBSCRIPTIONID] = @SUBSCRIPTIONID,
		[UPDATEDBY] = @UPDATEDBY,
		[UPDATED] = @UPDATED,
		[LOCATION] = @LOCATION,
		[FILENAME] = @FILENAME,
		[ACTIVE] = @ACTIVE
	WHERE
		[ETEMPLATEID] = @ETEMPLATEID
GO