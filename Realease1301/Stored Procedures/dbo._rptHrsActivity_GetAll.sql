SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptHrsActivity' table.
CREATE PROCEDURE [dbo].[_rptHrsActivity_GetAll]
AS
	SELECT * FROM [dbo].[rptHrsActivity]
GO
