SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'DATES_DAYS' table.
CREATE PROCEDURE [dbo].[_DATES_DAYS_Insert]
	@D date
AS
	INSERT INTO [dbo].[DATES_DAYS]
	(
		[d]
	)
	VALUES
	(
		@D
	)
GO
