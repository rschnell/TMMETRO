SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'ETEMPLATES' table.
CREATE PROCEDURE [dbo].[_ETEMPLATES_Insert]
	@TITLE nvarchar(50),
	@ETEMPLATETYPE int,
	@SUBSCRIPTIONID int,
	@UPDATEDBY int,
	@UPDATED datetime,
	@LOCATION nvarchar(100),
	@FILENAME nvarchar(100),
	@ACTIVE bit
AS
	INSERT INTO [dbo].[ETEMPLATES]
	(
		[TITLE],
		[ETEMPLATETYPE],
		[SUBSCRIPTIONID],
		[UPDATEDBY],
		[UPDATED],
		[LOCATION],
		[FILENAME],
		[ACTIVE]
	)
	VALUES
	(
		@TITLE,
		@ETEMPLATETYPE,
		@SUBSCRIPTIONID,
		@UPDATEDBY,
		@UPDATED,
		@LOCATION,
		@FILENAME,
		@ACTIVE
	)
	SELECT @@IDENTITY
GO
