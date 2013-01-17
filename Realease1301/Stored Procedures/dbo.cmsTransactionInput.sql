SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Daniel Cooper
-- Create date: 23/7/2007
-- Description:	Populates the transation table
-- =============================================
CREATE PROCEDURE [dbo].[cmsTransactionInput] 
	-- Add the parameters for the stored procedure here
	@subscriptionName varchar(50),
	@userName varchar(50),
	@transactionType int,
	@cases int,
	@space int,
	@subscriptions int,
	@reciept varchar(50),
	@cleared bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @userID int
	DECLARE @subscriptionID int
	SET @subscriptionID = (SELECT TOP 1 SubscriptionID FROM SUBSCRIPTIONS WHERE  DNNRole = @SubscriptionName)
	SET @userID = (SELECT TOP 1 UserID FROM USERS WHERE DNNName = @userName)

	INSERT INTO Transactions (TMSubscriptionID, TMUserID, TxType, countCases, countSpace, countSubscriptions, TxRecieptNumber, TxCleared)
	VALUES(@subscriptionID, @userID, @transactionType, @cases, @space, @subscriptions, @reciept, @cleared)
END


GO
