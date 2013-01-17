SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author:		Daniel Cooper
-- Create date: 16/7/2007
-- Description:	Adds a user to a subscription
-- =============================================
CREATE PROCEDURE [dbo].[cmsAddUserToSubscription] 
	-- Add the parameters for the stored procedure here
	@subscriptionName varchar(50), 
	@userName varchar(50),
	@manager bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @SubscriptionID int
	DECLARE @UserID int

	SET @SubscriptionID = (SELECT SubscriptionID FROM SUBSCRIPTIONS WHERE DNNRole = @subscriptionName)
	SET @UserID = (SELECT UserID FROM USERS WHERE DNNName = @userName)

	IF ISNULL(@SubscriptionID, 0) = 0 
	BEGIN
		return -21
	END
	IF ISNULL(@UserID, 0) = 0 
	BEGIN
		return -22
	END

    -- Insert statements for procedure here
	INSERT INTO SUBSXUSERS (SubscriptionId, UserId, IsSubManager) VALUES(@SubscriptionID,@UserID , @manager)
		
	
END



GO
