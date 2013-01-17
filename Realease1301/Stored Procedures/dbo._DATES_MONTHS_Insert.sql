SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'DATES_MONTHS' table.
CREATE PROCEDURE [dbo].[_DATES_MONTHS_Insert]
	@M int
AS
	INSERT INTO [dbo].[DATES_MONTHS]
	(
		[m]
	)
	VALUES
	(
		@M
	)
GO
