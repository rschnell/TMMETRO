SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author:		Daniel Cooper
-- Create date: 18/7/2007
-- Description:	Returns the available number of subscriptions available to the user
-- =============================================
CREATE PROCEDURE [dbo].[cmsGetQuotaSubscriptions] 
	-- Add the parameters for the stored procedure here
	@userName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT (SELECT ISNULL((SELECT SUM(countSubscriptions) FROM TRANSACTIONS INNER JOIN USERS ON USERS.UserId = TRANSACTIONS.TMUserID WHERE USERS.DNNName = @userName), 0))
	-   
	(SELECT COUNT(*) FROM SUBSXUSERS INNER JOIN USERS ON USERS.UserId = SUBSXUSERS.UserId WHERE USERS.DNNNAme = @userName AND IsSubManager = 1)
END



GO
