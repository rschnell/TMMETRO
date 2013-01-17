SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Daniel Cooper
-- Create date: 20/7/2007
-- Description:	Retrieves the number of cases available to a subscription
-- =============================================
CREATE PROCEDURE [dbo].[cmsGetQuotaCases] 
	-- Add the parameters for the stored procedure here
	@subscriptionName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
 cast((SELECT sum(countCases) 
FROM Transactions INNER JOIN SUBSCRIPTIONS ON SUBSCRIPTIONS.SubscriptionID = Transactions.TMSubscriptionID 
WHERE SUBSCRIPTIONS.DNNRole = @subscriptionName) as int)
	- 
 cast((SELECT count(*) 
FROM CASES INNER JOIN SUBSCRIPTIONS ON SUBSCRIPTIONS.SubscriptionID = CASES.SubscriptionID 
WHERE SUBSCRIPTIONS.DNNRole = @subscriptionName) as int)
END


GO
