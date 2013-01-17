SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'doss' table.
CREATE PROCEDURE [dbo].[_doss_GetAll]
AS
	SELECT * FROM [dbo].[doss]
GO
