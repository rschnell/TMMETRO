SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'XACTIONS' table.
CREATE PROCEDURE [dbo].[_XACTIONS_GetAll]
AS
	SELECT * FROM [dbo].[XACTIONS]
GO
