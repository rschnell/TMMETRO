SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'Money' table.
CREATE PROCEDURE [dbo].[_Money_GetAll]
AS
	SELECT * FROM [dbo].[Money]
GO
