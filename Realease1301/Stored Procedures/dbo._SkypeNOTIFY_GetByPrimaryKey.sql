SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'SkypeNOTIFY' table using the primary key value.
CREATE PROCEDURE [dbo].[_SkypeNOTIFY_GetByPrimaryKey]
	@SkypeNotifyID int
AS
	SELECT * FROM [dbo].[SkypeNOTIFY] WHERE
		[SkypeNotifyID] = @SkypeNotifyID
GO
