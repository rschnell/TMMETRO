SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'listPROJECTS' table.
CREATE PROCEDURE [dbo].[_listPROJECTS_GetAll]
AS
	SELECT * FROM [dbo].[listPROJECTS]
GO
