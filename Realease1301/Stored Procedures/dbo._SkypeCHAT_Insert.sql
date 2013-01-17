SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'SkypeCHAT' table.
CREATE PROCEDURE [dbo].[_SkypeCHAT_Insert]
	@Name varchar(255),
	@Topic varchar(1000),
	@CaseID int,
	@ActionID int
AS
	INSERT INTO [dbo].[SkypeCHAT]
	(
		[Name],
		[Topic],
		[CaseID],
		[ActionID]
	)
	VALUES
	(
		@Name,
		@Topic,
		@CaseID,
		@ActionID
	)
	SELECT @@IDENTITY
GO
