SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'SkypeNOTIFY' table using the primary key value.
CREATE PROCEDURE [dbo].[_SkypeNOTIFY_DeleteByPrimaryKey]
	@SkypeNotifyID int
AS
	DELETE FROM [dbo].[SkypeNOTIFY] WHERE
		[SkypeNotifyID] = @SkypeNotifyID
GO
