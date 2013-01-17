SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptCASES' table.
CREATE PROCEDURE [dbo].[_rptCASES_GetAll]
AS
	SELECT * FROM [dbo].[rptCASES]
GO
