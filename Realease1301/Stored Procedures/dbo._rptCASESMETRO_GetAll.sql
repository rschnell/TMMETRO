SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptCASESMETRO' table.
CREATE PROCEDURE [dbo].[_rptCASESMETRO_GetAll]
AS
	SELECT * FROM [dbo].[rptCASESMETRO]
GO