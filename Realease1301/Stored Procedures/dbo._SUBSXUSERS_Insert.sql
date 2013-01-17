SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'SUBSXUSERS' table.
CREATE PROCEDURE [dbo].[_SUBSXUSERS_Insert]
	@SUBSCRIPTIONID int,
	@USERID int,
	@ISSUBMANAGER bit,
	@ACTIVE bit
AS
	INSERT INTO [dbo].[SUBSXUSERS]
	(
		[SUBSCRIPTIONID],
		[USERID],
		[ISSUBMANAGER],
		[ACTIVE]
	)
	VALUES
	(
		@SUBSCRIPTIONID,
		@USERID,
		@ISSUBMANAGER,
		@ACTIVE
	)
	SELECT @@IDENTITY
GO