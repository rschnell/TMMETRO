SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'IMProviders' table.
CREATE PROCEDURE [dbo].[_IMProviders_GetAll]
AS
	SELECT * FROM [dbo].[IMProviders]
GO
