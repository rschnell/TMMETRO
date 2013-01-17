SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'CASESXTAGS' table.
CREATE PROCEDURE [dbo].[_CASESXTAGS_Insert]
	@CASEID int,
	@TAG nvarchar(max)
AS
	INSERT INTO [dbo].[CASESXTAGS]
	(
		[CASEID],
		[TAG]
	)
	VALUES
	(
		@CASEID,
		@TAG
	)
GO
