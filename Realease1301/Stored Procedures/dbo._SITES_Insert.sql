SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'SITES' table.
CREATE PROCEDURE [dbo].[_SITES_Insert]
	@SiteID int,
	@SiteName nvarchar(100),
	@SiteDisplayName nvarchar(200),
	@SiteDescription ntext,
	@SiteStatus nvarchar(20),
	@SiteDomainName nvarchar(400),
	@ACTIVE bit,
	@CREATED datetime
AS
	INSERT INTO [dbo].[SITES]
	(
		[SiteID],
		[SiteName],
		[SiteDisplayName],
		[SiteDescription],
		[SiteStatus],
		[SiteDomainName],
		[ACTIVE],
		[CREATED]
	)
	VALUES
	(
		@SiteID,
		@SiteName,
		@SiteDisplayName,
		@SiteDescription,
		@SiteStatus,
		@SiteDomainName,
		@ACTIVE,
		@CREATED
	)
	SELECT @@IDENTITY
GO
