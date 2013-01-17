SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'pges' table using the primary key value.
CREATE PROCEDURE [dbo].[_pges_DeleteByPrimaryKey]
	@PgeID int
AS
	DELETE FROM [dbo].[pges] WHERE
		[pgeID] = @PgeID
GO
