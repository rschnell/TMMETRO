SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'SITES' table.
CREATE PROCEDURE [dbo].[_SITES_Update]
	-- The rest of writeable parameters
	@SiteID int,
	@SiteName nvarchar(100),
	@SiteDisplayName nvarchar(200),
	@SiteDescription ntext,
	@SiteStatus nvarchar(20),
	@SiteDomainName nvarchar(400),
	@ACTIVE bit,
	@CREATED datetime,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[SITES] SET
		[SiteID] = @SiteID,
		[SiteName] = @SiteName,
		[SiteDisplayName] = @SiteDisplayName,
		[SiteDescription] = @SiteDescription,
		[SiteStatus] = @SiteStatus,
		[SiteDomainName] = @SiteDomainName,
		[ACTIVE] = @ACTIVE,
		[CREATED] = @CREATED
	WHERE
		[ID] = @ID
GO
