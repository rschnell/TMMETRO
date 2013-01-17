SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'SkypeCHAT' table using the primary key value.
CREATE PROCEDURE [dbo].[_SkypeCHAT_DeleteByPrimaryKey]
	@SkypeChatID int
AS
	DELETE FROM [dbo].[SkypeCHAT] WHERE
		[SkypeChatID] = @SkypeChatID
GO
