SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'SUBSCRIPTIONSEXT' table.
CREATE PROCEDURE [dbo].[_SUBSCRIPTIONSEXT_GetAll]
AS
	SELECT * FROM [dbo].[SUBSCRIPTIONSEXT]
GO