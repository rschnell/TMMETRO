SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'LEDGERPlus' table.
CREATE PROCEDURE [dbo].[_LEDGERPlus_GetAll]
AS
	SELECT * FROM [dbo].[LEDGERPlus]
GO
