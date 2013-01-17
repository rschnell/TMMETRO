SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'SkypeCHAT' table using the primary key value.
CREATE PROCEDURE [dbo].[_SkypeCHAT_GetByPrimaryKey]
	@SkypeChatID int
AS
	SELECT * FROM [dbo].[SkypeCHAT] WHERE
		[SkypeChatID] = @SkypeChatID
GO
