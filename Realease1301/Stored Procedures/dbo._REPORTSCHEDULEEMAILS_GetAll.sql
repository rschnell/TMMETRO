SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'REPORTSCHEDULEEMAILS' table.
CREATE PROCEDURE [dbo].[_REPORTSCHEDULEEMAILS_GetAll]
AS
	SELECT * FROM [dbo].[REPORTSCHEDULEEMAILS]
GO
