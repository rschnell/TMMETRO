SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'SkypeCHAT' table.
CREATE PROCEDURE [dbo].[_SkypeCHAT_Update]
	-- The rest of writeable parameters
	@Name varchar(255),
	@Topic varchar(1000),
	@CaseID int,
	@ActionID int,
	-- Primary key parameters
	@SkypeChatID int
AS
	UPDATE [dbo].[SkypeCHAT] SET
		[Name] = @Name,
		[Topic] = @Topic,
		[CaseID] = @CaseID,
		[ActionID] = @ActionID
	WHERE
		[SkypeChatID] = @SkypeChatID
GO
