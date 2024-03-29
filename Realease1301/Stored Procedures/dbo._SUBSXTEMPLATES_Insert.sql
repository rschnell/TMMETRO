SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'SUBSXTEMPLATES' table.
CREATE PROCEDURE [dbo].[_SUBSXTEMPLATES_Insert]
	@SUBSCRIPTIONID int,
	@TEMPLATEID int
AS
	INSERT INTO [dbo].[SUBSXTEMPLATES]
	(
		[SUBSCRIPTIONID],
		[TEMPLATEID]
	)
	VALUES
	(
		@SUBSCRIPTIONID,
		@TEMPLATEID
	)
	SELECT @@IDENTITY
GO
