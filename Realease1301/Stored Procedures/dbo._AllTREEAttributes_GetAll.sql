SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'AllTREEAttributes' table.
CREATE PROCEDURE [dbo].[_AllTREEAttributes_GetAll]
AS
	SELECT * FROM [dbo].[AllTREEAttributes]
GO
