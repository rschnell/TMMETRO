SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Daniel Cooper
-- Create date: 16/7/2007
-- Description:	Translates a .net role name to a TM subscriptionID number
-- =============================================
CREATE PROCEDURE [dbo].[cmsGetSubscriptionID] 
	-- Add the parameters for the stored procedure here
	@roleName varchar(50) 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @SubscriptionID int

	SET @SubscriptionID = (SELECT SubscriptionID FROM SUBSCRIPTIONS WHERE TMSubName = @roleName)

	IF ISNULL(@SubscriptionID, 0) = 0
	BEGIN
		SELECT -61
	END
	ELSE
		SELECT @SubscriptionID
END

GO
