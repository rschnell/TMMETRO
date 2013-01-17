SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE FUNCTION dbo.cmsListUserGroup 
(
	@CaseID		integer
)
RETURNS @Users TABLE (UserID integer, UserName varchar(250))
BEGIN
	DECLARE @Subscription	integer
	DECLARE @GroupID		integer
	DECLARE @GroupLN		integer
	DECLARE @GroupRN		integer
	SELECT @Subscription=SubscriptionID, @GroupID=GroupID FROM CASES WHERE CaseID = @CaseID
	SELECT @GroupLN=TreeLN, @GroupRN=TreeRN FROM GROUPSTREE WHERE GroupID = @GroupID
	INSERT INTO @Users 
	SELECT DISTINCT UserID, Username
		   FROM MYGROUP
		   WHERE (MYGROUP._TreeLN BETWEEN @GroupLN AND @GroupRN) AND MYGROUP._SubscriptionID = @Subscription
	RETURN
END
GO
