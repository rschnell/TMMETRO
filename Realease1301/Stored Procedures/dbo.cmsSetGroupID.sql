SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Daniel Cooper
-- Create date: 26/7/2007
-- Description:	Sets a user's group ID
-- =============================================
CREATE PROCEDURE [dbo].[cmsSetGroupID] 
	-- Add the parameters for the stored procedure here
	@userID int, 
	@groupID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE USERS SET GroupID = @groupID WHERE UserID = @userID
END
GO
