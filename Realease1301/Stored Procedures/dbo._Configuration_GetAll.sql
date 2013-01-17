SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets all records from the 'Configuration' table.
CREATE PROCEDURE [dbo].[_Configuration_GetAll]
AS
	SELECT * FROM [dbo].[Configuration]
GO
