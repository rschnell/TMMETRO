SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'ALIENINVITES' table using the primary key value.
CREATE PROCEDURE [dbo].[_ALIENINVITES_DeleteByPrimaryKey]
	@AlienInvitesID int
AS
	DELETE FROM [dbo].[ALIENINVITES] WHERE
		[AlienInvitesID] = @AlienInvitesID
GO
