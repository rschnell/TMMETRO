SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'AllCASESTree' table.
CREATE PROCEDURE [dbo].[_AllCASESTree_GetAll]
AS
	SELECT * FROM [dbo].[AllCASESTree]
GO
