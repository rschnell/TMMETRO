SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'USERLOCATIONS' table.
CREATE PROCEDURE [dbo].[_USERLOCATIONS_GetAll]
AS
	SELECT * FROM [dbo].[USERLOCATIONS]
GO