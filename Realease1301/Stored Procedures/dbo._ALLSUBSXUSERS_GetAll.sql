SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'ALLSUBSXUSERS' table.
CREATE PROCEDURE [dbo].[_ALLSUBSXUSERS_GetAll]
AS
	SELECT * FROM [dbo].[ALLSUBSXUSERS]
GO
