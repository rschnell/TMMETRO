SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[ALLCUSTOMERUSERSUNALLOCATED]
AS
SELECT     dbo.ALLUSERS.CodeOrganization, dbo.ALLUSERS.ManagerName, dbo.ALLUSERS.ManagerEmail, dbo.ALLUSERS.IsDetective, dbo.ALLUSERS.LastName, 
                      dbo.ALLUSERS.FirstName, dbo.ALLUSERS.UserName, dbo.ALLUSERS.UserId, dbo.CUSTOMERSXUSERS.USERID AS LINKUSERID
FROM         dbo.ALLUSERS LEFT OUTER JOIN
                      dbo.CUSTOMERSXUSERS ON dbo.ALLUSERS.UserId = dbo.CUSTOMERSXUSERS.USERID
WHERE     (dbo.ALLUSERS.ManagerName IS NOT NULL) AND (dbo.CUSTOMERSXUSERS.USERID IS NULL)


GO