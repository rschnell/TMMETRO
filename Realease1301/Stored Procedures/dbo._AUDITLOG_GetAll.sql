SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'AUDITLOG' table.
CREATE PROCEDURE [dbo].[_AUDITLOG_GetAll]
AS
	SELECT * FROM [dbo].[AUDITLOG]
GO