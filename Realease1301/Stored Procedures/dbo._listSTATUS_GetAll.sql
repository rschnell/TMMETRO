SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'listSTATUS' table.
CREATE PROCEDURE [dbo].[_listSTATUS_GetAll]
AS
	SELECT * FROM [dbo].[listSTATUS]
GO
