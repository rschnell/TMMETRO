SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CONFIG' table.
CREATE PROCEDURE [dbo].[_CONFIG_GetAll]
AS
	SELECT * FROM [dbo].[CONFIG]
GO