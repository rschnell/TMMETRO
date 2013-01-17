SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'Site' table using the primary key value.
CREATE PROCEDURE [dbo].[_SITE_GetByPrimaryKey]
	@SiteID int
AS
	SELECT * FROM [dbo].[Site] WHERE
		[SiteID] = @SiteID
GO
