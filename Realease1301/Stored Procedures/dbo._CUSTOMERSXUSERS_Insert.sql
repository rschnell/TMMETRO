SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'CUSTOMERSXUSERS' table.
CREATE PROCEDURE [dbo].[_CUSTOMERSXUSERS_Insert]
	@CUSTOMERID int,
	@USERID int
AS
	INSERT INTO [dbo].[CUSTOMERSXUSERS]
	(
		[CUSTOMERID],
		[USERID]
	)
	VALUES
	(
		@CUSTOMERID,
		@USERID
	)
	SELECT @@IDENTITY
GO