SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CASEY' table.
CREATE PROCEDURE [dbo].[_CASEY_GetAll]
AS
	SELECT * FROM [dbo].[CASEY]
GO
