SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'AUDITLOG_2908' table.
CREATE PROCEDURE [dbo].[_AUDITLOG_2908_GetAll]
AS
	SELECT * FROM [dbo].[AUDITLOG_2908]
GO