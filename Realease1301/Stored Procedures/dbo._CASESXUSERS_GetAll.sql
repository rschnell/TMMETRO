SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CASESXUSERS' table.
CREATE PROCEDURE [dbo].[_CASESXUSERS_GetAll]
AS
	SELECT * FROM [dbo].[CASESXUSERS]
GO