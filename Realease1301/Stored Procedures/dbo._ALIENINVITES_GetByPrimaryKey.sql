SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'ALIENINVITES' table using the primary key value.
CREATE PROCEDURE [dbo].[_ALIENINVITES_GetByPrimaryKey]
	@AlienInvitesID int
AS
	SELECT * FROM [dbo].[ALIENINVITES] WHERE
		[AlienInvitesID] = @AlienInvitesID
GO
