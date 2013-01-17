SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Daniel Cooper
-- Create date: 20/7/2007
-- Description:	Gets the total disk space purchased for a subscription
-- =============================================
CREATE PROCEDURE [dbo].[cmsGetQuotaDisk] 
	-- Add the parameters for the stored procedure here
	@subscriptionName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sum(countSpace) FROM Transactions INNER JOIN SUBSCRIPTIONS ON SubscriptionID = TMSubscriptionID WHERE SUBSCRIPTIONS.DNNRole = @subscriptionName
END
GO
