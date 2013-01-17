SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[cmsAddDNNSubscription]
	@SubscriptionName varchar(240), 
	@delimiter char(1)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @subscriptionNumber int

	INSERT INTO SUBSCRIPTIONS (TMSubName) VALUES (@SubscriptionName)
	Set @subscriptionNumber = @@Identity 
	UPDATE SUBSCRIPTIONS SET DNNRole = (cast(@subscriptionNumber as varchar) + @delimiter + @SubscriptionName) WHERE SubscriptionID = @subscriptionNumber
	SELECT cast(@subscriptionNumber as varchar) + @delimiter + @SubscriptionName

END
GO
