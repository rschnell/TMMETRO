SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'SUBSCRIPTIONCURRENCIES' table.
CREATE PROCEDURE [dbo].[_SUBSCRIPTIONCURRENCIES_GetAll]
AS
	SELECT * FROM [dbo].[SUBSCRIPTIONCURRENCIES]
GO
