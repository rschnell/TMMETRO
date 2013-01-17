SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'LEDGERMinus' table.
CREATE PROCEDURE [dbo].[_LEDGERMinus_GetAll]
AS
	SELECT * FROM [dbo].[LEDGERMinus]
GO
