SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets all records from the 'SkypeNOTIFY' table.
CREATE PROCEDURE [dbo].[_SkypeNOTIFY_GetAll]
AS
	SELECT * FROM [dbo].[SkypeNOTIFY]
GO
