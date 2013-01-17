SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Daniel Cooper
-- Create date: 26/7/2007
-- Description:	Retrieves a group ID given a  user ID
-- =============================================
CREATE PROCEDURE [dbo].[cmsGroupGetID] 
	-- Add the parameters for the stored procedure here
	@userID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT GroupID FROM Users WHERE UserID = @UserID
END
GO
