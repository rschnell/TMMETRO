SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'pges' table using the primary key value.
CREATE PROCEDURE [dbo].[_pges_GetByPrimaryKey]
	@PgeID int
AS
	SELECT * FROM [dbo].[pges] WHERE
		[pgeID] = @PgeID
GO
