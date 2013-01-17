SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'Site' table using the primary key value.
CREATE PROCEDURE [dbo].[_SITE_DeleteByPrimaryKey]
	@SiteID int
AS
	DELETE FROM [dbo].[Site] WHERE
		[SiteID] = @SiteID
GO
