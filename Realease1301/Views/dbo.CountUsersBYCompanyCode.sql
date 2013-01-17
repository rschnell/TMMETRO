SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[CountUsersBYCompanyCode]
AS
SELECT     CodeOrganization, COUNT(UserId) AS NOUSERS
FROM         dbo.USERS
GROUP BY CodeOrganization

GO
