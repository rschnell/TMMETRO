SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Daniel Cooper
-- Create date: 17/7/2007
-- Description:	Translates between a TM SubscriptionID and a TMSUBName
-- =============================================
CREATE PROCEDURE [dbo].[cmsGetSubscriptionName] 
	-- Add the parameters for the stored procedure here
	@SubscriptionID int 
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @SubscriptionName varchar(50)

	SET @SubscriptionName = (SELECT TMSUBName FROM SUBSCRIPTIONS WHERE SubscriptionID = @SubscriptionID)
	IF ISNULL(@SubscriptionName, '') = ''
	BEGIN
		SELECT '-71'
	END
	ELSE
		SELECT @SubscriptionName
END

GO
