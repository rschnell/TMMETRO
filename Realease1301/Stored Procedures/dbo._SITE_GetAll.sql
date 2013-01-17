SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets all records from the 'Site' table.
CREATE PROCEDURE [dbo].[_SITE_GetAll]
AS
	SELECT * FROM [dbo].[Site]
GO
