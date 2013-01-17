SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Daniel Cooper
-- Create date: 16/7/2007
-- Description:	Gets a userID after being passed a username
-- =============================================
CREATE PROCEDURE [dbo].[cmsGetUserID] 
	-- Add the parameters for the stored procedure here
	@userName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @UserID int

	SET @UserID = (SELECT UserID FROM USERS WHERE UserName = @userName)
    IF ISNULL(@UserID, 0) = 0 
	BEGIN
		SELECT -51
	END
	ELSE
		SELECT @UserID
END


GO
